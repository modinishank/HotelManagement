package model;

public class Message {
	
public String errorMessage="Welcome User";
	
	public void displayMessage(int response) 
	{
		
		if(response == PersonOperationConstant.VALUES_SELECTED)
		{
			errorMessage="Values are successfully selected";
		}
	
		else if(response == PersonOperationConstant.SUCCESS_INSERTION)
		{
			errorMessage="Data Inserted Successfully";
		}
		else if(response == PersonOperationConstant.SQL_EXCEPTION)
		{
			errorMessage="Data not Inserted";
		}
		else if(response == PersonOperationConstant.DELETE_SUCCESSFUL)
		{
			errorMessage="Data Deleted Successfully";
		}
		else if(response == PersonOperationConstant.ENTER_VALUES)
		{
			errorMessage="Atleast enter some values";
		}
		else if(response == PersonOperationConstant.ROOM_NOT_SELECTED)
		{
			errorMessage="No Room Selected";
		}
	
		
}
}
