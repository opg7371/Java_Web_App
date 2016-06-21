<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Time Office -Login Failed</title>
</head>
<body>
<table align="center"  border="2" cellpadding="2" cellspacing="1" width="50%" bgcolor=#fad7a0>
   <tr height="20px" align="center" valign="middle" >
     <td align="center">
       <h3><%=request.getAttribute("Message")%></h3>
     </td> 
   </tr> 
   <tr height="10px" align="center" valign="middle" >
     <td align="center">
        <FORM ACTION="to_login.jsp" METHOD="post">                   
           <INPUT TYPE="submit" value="Back">
        </FORM>
     </td> 
   </tr>                
</table>
</body>
</html>