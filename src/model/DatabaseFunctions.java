package model;

import helper.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import bean.AvailableRoom;
import bean.AvailableRoomList;
import bean.Guest;
import bean.GuestList;
import bean.Hotel;
import bean.HotelList;

public class DatabaseFunctions {

	public GuestList retriveGuest(String guestName) {
		
		DBConnection connection = new DBConnection();
		Connection conn=connection.getconnection();
		PreparedStatement prepareStatement = null;
        String guestSearchQuery = Query.GUEST_SEARCH_QUERY;
        ResultSet resSet =null;
        Guest guest=null;
		GuestList guestList= new GuestList();
		String retrivedGuestId, retrivedGuestName, retrivedGuestAddress, retrivedGuestAffilation;
		
        try
		{   
			prepareStatement = conn.prepareStatement(guestSearchQuery);
			prepareStatement.setString(1,guestName);
			resSet = prepareStatement.executeQuery();
			
			while(resSet.next())
			{//GUESTID, GUESTNAME, GUESTADDRESS, GUESTAFFILIATION
				retrivedGuestId = resSet.getString("GUESTID");
				retrivedGuestName = resSet.getString("GUESTNAME");
				retrivedGuestAddress = resSet.getString("GUESTADDRESS");
				retrivedGuestAffilation = resSet.getString("GUESTAFFILIATION");
				
				guest = new Guest(retrivedGuestId, retrivedGuestName, retrivedGuestAddress, retrivedGuestAffilation);
				guestList.insert(guest);
			}
			
		}
        catch(SQLException se)
		{
            se.printStackTrace();
        }
        
        return guestList;
    }
	
	public int insertGuest(String guestName, String guestAddress) {
		
		
		DBConnection connection = new DBConnection();
		Connection conn=connection.getconnection();
        PreparedStatement prepareStatement = null;
        String insertGuestQuery = Query.INSERT_GUEST_QUERY;
        
        String defaultGuestAffiliation="VIP";
        
        try
		{   
			prepareStatement = conn.prepareStatement(insertGuestQuery);
			prepareStatement.setString(1,guestName);
			prepareStatement.setString(2,guestAddress);
			prepareStatement.setString(3,defaultGuestAffiliation);
			prepareStatement.executeUpdate(); 
			return PersonOperationConstant.SUCCESS_INSERTION;
		}
        catch(SQLException se)
		{
            return PersonOperationConstant.SQL_EXCEPTION;
        }
    }

	public int insertContactUsDetails(String contactName,String contactEmail,String contactMessage,String contactNumber){
		
		DBConnection connection = new DBConnection();
		Connection conn=connection.getconnection();
        PreparedStatement prepareStatement = null;
        String insertContactUsDetails = Query.INSERT_CONTACT_US_DETAILS;
        
        try
		{   
			prepareStatement = conn.prepareStatement(insertContactUsDetails);
			prepareStatement.setString(1,contactName);
			prepareStatement.setString(2,contactEmail);
			prepareStatement.setString(3,contactMessage);
			prepareStatement.setString(4,contactNumber);
			prepareStatement.executeUpdate(); 
			return PersonOperationConstant.SUCCESS_INSERTION;
		}
        catch(SQLException se)
		{
            return PersonOperationConstant.SQL_EXCEPTION;
        }
    }
	
	public AvailableRoomList selectRoom(String hotelCity,String roomType,String startDate,String endDate) {
		DBConnection connection = new DBConnection();
		AvailableRoom availableRoom = null;
		AvailableRoomList availableRoomList= new AvailableRoomList();
		Connection conn=connection.getconnection();
        PreparedStatement preparedStatement = null;
        ResultSet resSet =null;
        String resultHotelName,resultRoomNumber,availableHotelId,availableHotelCity;
        double availableRoomPrice;
        try
		{
		   	preparedStatement = conn.prepareStatement(Query.CITY_TYPE_DATE);
			preparedStatement.setString(1,hotelCity);
			preparedStatement.setString(2,roomType);
			preparedStatement.setString(3,startDate);
			preparedStatement.setString(4,endDate);
			preparedStatement.setString(5,startDate);
			preparedStatement.setString(6,endDate);
			preparedStatement.setString(7,startDate);
			preparedStatement.setString(8,endDate);
			preparedStatement.setString(9,startDate);
			preparedStatement.setString(10,endDate);
			preparedStatement.setString(11,startDate);
			preparedStatement.setString(12,endDate);
		  
			resSet = preparedStatement.executeQuery();
			while(resSet.next())
			{
				availableHotelId = resSet.getString("HOTELID");
				resultHotelName = resSet.getString("HOTELNAME");
				availableHotelCity = resSet.getString("CITY");
				resultRoomNumber = resSet.getString("ROOMNO");
				availableRoomPrice = resSet.getDouble("PRICE");
				availableRoom=new AvailableRoom(availableHotelId,resultHotelName,availableHotelCity,resultRoomNumber,availableRoomPrice);
				availableRoomList.insert(availableRoom);
			}
        }
		catch(SQLException se)
		{
			se.printStackTrace();
		}
        return availableRoomList;
	}
	

	public String bookRoomNow(String hotelId, String roomNumber, String guestId, String startDate, String endDate) {
		
		DBConnection connection = new DBConnection();
		Connection conn=connection.getconnection();
        PreparedStatement prepareStatement = null;
        ResultSet resSet =null;
        String bookingId="";
        String insertBookingQuery = Query.INSERT_BOOK_ROOM;
        try
		{
        	//Inserting into booking table first. Our trigger will take care of overlapping values if any.
			prepareStatement = conn.prepareStatement(insertBookingQuery);
			prepareStatement.setString(1,hotelId);
			prepareStatement.setString(2,roomNumber);
			prepareStatement.setString(3,guestId);
			prepareStatement.setString(4,startDate);
			prepareStatement.setString(5,endDate);
			prepareStatement.executeUpdate(); 
			
			//Inserting data into reference table. Booking ID is auto created and inserted into the table
			prepareStatement = conn.prepareStatement(Query.INSERT_BOOK_ROOM_REFERENCE);
			prepareStatement.setString(1,hotelId);
			prepareStatement.setString(2,roomNumber);
			prepareStatement.setString(3,guestId);
			prepareStatement.setString(4,startDate);
			prepareStatement.setString(5,endDate);
			prepareStatement.executeUpdate();
			
			//Retrieving Booking ID 
			//SELECT BOOKINGID FROM BOOKINGREFERENCE WHERE HOTELID=? AND ROOMNO=? AND GUESTID=? AND STARTDATE=? AND ENDDATE=?
			prepareStatement = conn.prepareStatement(Query.CUSTOMER_ID);
			prepareStatement.setString(1,hotelId);
			prepareStatement.setString(2,roomNumber);
			prepareStatement.setString(3,guestId);
			prepareStatement.setString(4,startDate);
			prepareStatement.setString(5,endDate);
			resSet = prepareStatement.executeQuery();
			while(resSet.next())
			{
				bookingId = resSet.getString("BOOKINGID");
			}
			return bookingId;
		}
        catch(SQLException se)
		{
            return "exception";
        }
    }
}
