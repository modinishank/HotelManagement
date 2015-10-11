package bean;

public class AvailableRoom {
	private String hotelId;
	private String HotelName;
	private String city;
	private String roomNumber;
	private double price;
	public AvailableRoom(String hotelId, String hotelName, String city, String roomNumber, double price) {
		super();
		this.hotelId = hotelId;
		HotelName = hotelName;
		this.city = city;
		this.roomNumber = roomNumber;
		this.price = price;
	}
	public String getHotelId() {
		return hotelId;
	}
	public void setHotelId(String hotelId) {
		this.hotelId = hotelId;
	}
	public String getHotelName() {
		return HotelName;
	}
	public void setHotelName(String hotelName) {
		HotelName = hotelName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
