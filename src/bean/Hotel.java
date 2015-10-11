package bean;

public class Hotel {
	//HOTELID, HOTELNAME, CITY
	private String hotelId;
	private String HotelName;
	private String city;
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
	public Hotel(String hotelId, String hotelName, String city) {
		super();
		this.hotelId = hotelId;
		HotelName = hotelName;
		this.city = city;
	}
}