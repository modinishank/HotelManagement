package bean;
import java.util.ArrayList;

public class GuestList {

	ArrayList<Guest> guestList = new ArrayList<Guest>();

	public ArrayList<Guest> getGuestList() {
		return guestList;
	}

	public void setGuestList(ArrayList<Guest> guestList) {
		this.guestList = guestList;
	}
	
	public void insert(Guest guest) {
		// TODO Auto-generated method stub
		this.guestList.add(guest);
	}

}
