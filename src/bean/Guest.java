package bean;

public class Guest {
	
	private String name;
	private String address;
	private String id;
	private String guestAffilation;
	
	
	public Guest(String id, String name, String address, String guestAffilation) {
		super();
		this.name = name;
		this.address = address;
		this.id = id;
		this.guestAffilation = guestAffilation;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getGuestAffilation() {
		return guestAffilation;
	}


	public void setGuestAffilation(String guestAffilation) {
		this.guestAffilation = guestAffilation;
	}
	
}
