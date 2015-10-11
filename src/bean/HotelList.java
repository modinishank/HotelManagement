package bean;
import java.util.ArrayList;

public class HotelList {
	ArrayList<Hotel> hotelList = new ArrayList<Hotel>();

	public ArrayList<Hotel> getHotelList() {
		return hotelList;
	}

	public void setHotelList(ArrayList<Hotel> hotelList) {
		this.hotelList = hotelList;
	}

	public void insert(Hotel hotel) {
		// TODO Auto-generated method stub
		this.hotelList.add(hotel);
	}
}
