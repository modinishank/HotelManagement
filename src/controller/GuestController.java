package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AvailableRoomList;
import bean.GuestList;
import model.DatabaseFunctions;
import model.Message;
import model.PersonOperationConstant;

/**
 * Servlet implementation class GuestController
 */
@WebServlet("/GuestController")
public class GuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuestController() {
        super();
        // TODO Auto-generated constructor stub        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("doPost in Controller");
		String strAction = request.getParameter("action");
		if(strAction.equals("insertGuest"))
		{
			try
			{
				insertGuest(request,response);
			}
			catch (Exception e)
			{
				System.out.println(PersonOperationConstant.SQL_EXCEPTION);
			}
		}
		else if(strAction.equals("findRooms"))
		{
			try
			{
				findRooms(request,response);
			}
			catch (Exception e)
			{
				System.out.println(PersonOperationConstant.SQL_EXCEPTION);
			}
		}
		else if(strAction.equals("bookRoom"))
		{
			try
			{
				bookRoom(request,response);
			}
			catch (Exception e)
			{
				System.out.println(PersonOperationConstant.SQL_EXCEPTION);
			}
		}
		else if(strAction.equals("checkGuest"))
		{
			try
			{
				
				checkGuest(request,response);
			}
			catch (Exception e)
			{
				System.out.println(PersonOperationConstant.SQL_EXCEPTION);
			}
		}
		else if(strAction.equals("contactUs"))
		{
			try
			{
				contactUs(request,response);
			}
			catch (Exception e)
			{
				System.out.println(PersonOperationConstant.SQL_EXCEPTION);
			}
		}
	}
	
	private void contactUs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DatabaseFunctions objDatabase = new DatabaseFunctions();
		String contactName, contactEmail, contactMessage, contactNumber;
		int result = 0;
		contactName = request.getParameter("name");
		contactEmail = request.getParameter("email");
		contactMessage = request.getParameter("message");
		contactNumber = request.getParameter("contactNumber");

		try {
			result = objDatabase.insertContactUsDetails(contactName, contactEmail, contactMessage, contactNumber);
			if(result==1)
				request.setAttribute("message", "Message inserted successfully");
			else
				request.setAttribute("message", "Message is not inserted");
		}
		catch(Exception e)
		{
			request.setAttribute("message", "An exception occured while trying to insert contact us message");
		}

        RequestDispatcher rd = request.getRequestDispatcher("ContactUs.jsp");
		rd.forward(request, response);
	}

	private void checkGuest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		DatabaseFunctions objDatabase = new DatabaseFunctions();
		String guestName;
		guestName = request.getParameter("guestName");

		try {
				GuestList result = objDatabase.retriveGuest(guestName);
				if(result==null ||  result.getGuestList().size()==0)
					request.setAttribute("message", "No Data Available");
				else
					request.setAttribute("message", "Guest details are available");
				request.setAttribute("guestList", result.getGuestList());
			}
		catch(Exception e)
			{
				request.setAttribute("message", "An exception occured while trying to retrive guest details");
			}

        RequestDispatcher rd = request.getRequestDispatcher("CheckGuest.jsp");
		rd.forward(request, response);
	}

	private void insertGuest(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		DatabaseFunctions objDatabase = new DatabaseFunctions();
		String guestName,guestAddress;
		int result = 0;
		guestName = request.getParameter("guestName");
		guestAddress = request.getParameter("guestAddress");
		
		try {
				result = objDatabase.insertGuest(guestName, guestAddress);
				if(result==1)
					request.setAttribute("message", "Guest details inserted successfully");
				else
					request.setAttribute("message", "Guest details are not inserted");
			}
		catch(Exception e)
		{
				request.setAttribute("message", "An exception occured while trying to insert guest details");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("AddGuestNew.jsp");
		rd.forward(request, response);
	}
	private void findRooms(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		DatabaseFunctions objDatabase = new DatabaseFunctions();
		String startDate,endDate,hotelCity,roomType;
		
		hotelCity = request.getParameter("hotelCity");
		roomType = request.getParameter("roomType");
		startDate = request.getParameter("startDate");
		endDate = request.getParameter("endDate");
		
		try {
				AvailableRoomList result = objDatabase.selectRoom(hotelCity,roomType,startDate,endDate);
				if(result==null ||  result.getAvailableRoomList().size()==0)
					request.setAttribute("message", "No Rooms Available");
				else
					request.setAttribute("message", "Available Rooms Listed Below");
				request.setAttribute("availableRoomList", result.getAvailableRoomList());
			}
		catch(Exception e)
			{
				request.setAttribute("message", "An exception occured while trying to find available rooms");
			}

		RequestDispatcher rd = request.getRequestDispatcher("AvailableRooms.jsp");
		rd.forward(request, response);
		
	}

    //bookRoom
	private void bookRoom(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		//System.out.println("Booking rooms now");
		DatabaseFunctions objDatabase = new DatabaseFunctions();
		String startDate,endDate,hotelId,roomNumber,guestId,result;
		
		hotelId = request.getParameter("hotelId");
		roomNumber = request.getParameter("roomNumber");
		guestId = request.getParameter("guestId");
		startDate = request.getParameter("startDate");
		endDate = request.getParameter("endDate");
		
		try {
				result = objDatabase.bookRoomNow(hotelId,roomNumber,guestId,startDate,endDate);
				if(result.equalsIgnoreCase("exception"))
					{request.setAttribute("message", "Please enter correct details");
					request.setAttribute("bookingId", result);}
				else
					{request.setAttribute("message", "Room booked");
					request.setAttribute("bookingId", result);}
			}
		catch(Exception e)
		{
			request.setAttribute("message", "An exception occured while trying to book room");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("BookRoom.jsp");
		rd.forward(request, response);
		
	}
	
}
