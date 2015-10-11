package bean;
import java.util.ArrayList;

public class AvailableRoomList {
	ArrayList<AvailableRoom> availableRoomList = new ArrayList<AvailableRoom>();

	public ArrayList<AvailableRoom> getAvailableRoomList() {
		return availableRoomList;
	}

	public void setAvailableRoomList(ArrayList<AvailableRoom> availableRoomList) {
		this.availableRoomList = availableRoomList;
	}
	
	public void insert(AvailableRoom availableRoom) {
		// TODO Auto-generated method stub
		this.availableRoomList.add(availableRoom);
	}
}
