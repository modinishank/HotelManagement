package bean;
import java.util.ArrayList;

public class RoomList {

	ArrayList<Room> roomList = new ArrayList<Room>();
	
	public ArrayList<Room> getRoomList() {
		return roomList;
	}

	public void setRoomList(ArrayList<Room> roomList) {
		this.roomList = roomList;
	}

	public void insert(Room room) {
		// TODO Auto-generated method stub
		this.roomList.add(room);
	}
}
