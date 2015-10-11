/**
 * 
 */

function onSubmitButton(id) {
	        
	        var strAction=id;
	 		document.forms.guestPage.action="GuestController?action="+strAction;
	 		document.forms.guestPage.submit();
	 }

function checkForValidName(){
	var check_name = document.forms["guestCheckPage"]["guestName"].value;
	if(check_name=="" || check_name==null)
	{
		document.getElementById("guestname_error").innerHTML="Please Enter Guest Name";
		return false;
	}
	else
	{
		var testDigit = /^[a-zA-Z' ']+$/ ;   
		if (!testDigit.test(check_name)) 
		{
			document.getElementById("guestname_error").innerHTML="Only Alphabatic Characters Are Allowed";
			return false;
		}
	}
}

function onSubmitGuest(id)
{
	var ok1=checkGuestName();
	var ok2=checkGuestAddress();
	
	if(ok1==true && ok2==true)
		{
		var strAction=id;
 		document.forms.guestPage.action="GuestController?action="+strAction;
 		document.forms.guestPage.submit();
		}
		
}	

function checkGuestName()
{
	var check_name = document.forms["guestPage"]["guestName"].value;
	if(check_name=="" || check_name==null)
	{
		document.getElementById("name_error").innerHTML="Please Enter Guest Name";
		return false;
	}
	else
	{
		var testDigit = /^[a-zA-Z' ']+$/ ;   
		if (!testDigit.test(check_name)) 
		{
			document.getElementById("name_error").innerHTML="Only Alphabatic Characters Are Allowed";
			return false;
		}
		else
		{
			return true;
			
		}
	}
}

function checkGuestAddress()
{
	var check_address = document.forms["guestPage"]["guestAddress"].value;
	if(check_address=="" || check_address==null)
	{
		document.getElementById("address_error").innerHTML="Please Enter Address";
		return false;
	}
	else
	{
		var testDigit = /^[a-zA-Z0-9' ']+$/ ;   
		if (!testDigit.test(check_address)) 
		{
			document.getElementById("address_error").innerHTML="Only AlphaNumeric Characters Are Allowed";
			return false;
		}
		else
		{
			return true;
		}
	}
}