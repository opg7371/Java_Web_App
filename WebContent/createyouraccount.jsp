<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function rollOver() {
  //change the colour
  element.className += (element.className?' ':'') + 'CSStoHighlight';
  //change display of child
  for( var x = 0; element.childNodes[x]; x++ ){
    if( element.childNodes[x].tagName == 'UL' ) { element.childNodes[x].className += (element.childNodes[x].className?' ':'') + 'CSStoShow'; }
    if( element.childNodes[x].tagName == 'A' ) { element.childNodes[x].className += (element.childNodes[x].className?' ':'') + 'CSStoHighLink'; }
  }
}

function rollOff() {
  //change the colour
  element.className = element.className.replace(/ ?CSStoHighlight$/,'');
  //change display of child
  for( var x = 0; element.childNodes[x]; x++ ){
    if( element.childNodes[x].tagName == 'UL' ) { element.childNodes[x].className = element.childNodes[x].className.replace(/ ?CSStoShow$/,''); }
    if( element.childNodes[x].tagName == 'A' ) { element.childNodes[x].className = element.childNodes[x].className.replace(/ ?CSStoHighLink$/,''); }
  }
}
function chkelement(F1)
{
   for(var i=0; i<F1.elements.length; i++)
   {	
	   if(F1.elements[i].value == '')
		{
		   alert("Fill out all Fields");		   		  
		   document.F1.post.focus();
		   return false;
		}
		else
		{
		  formSubmit();
	    }	   
   }
}
function formSubmit()
{
document.getElementById("frm2").submit();
}

</script>
</head>
<body>
<form id = "frm2" name = "F2" action="CreatevarifyServlet" method="post">
<font size = "10">User Id</font>
<input type = "text" id="userid" NAME="userid"><br>
<font size = "10">Password</font> 
<input type = "password" id="password" NAME="pswd"><br>
<font size = "10">Emp Name</font> 
<input type = "text" id="Emp_name" NAME="emp_name"><br>
<font size = "10">Emp Number</font> 
<input type = "text" id="emp_number" NAME="emp_no"></br>
 
  <input type="radio" name="user" value="1" checked> End User<br>
  <input type="radio" name="user" value="2"> Authorised User<br>
  <input type="radio" name="user" value="3"> SuperUser
 
<input type = "submit"  value = "CREATE_YOUR_ACCOUNT">
</form>
</body>
</html>