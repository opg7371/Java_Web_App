<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body >
<table align="center" width="50%" bgcolor="#008B8B">
<tr align="center">
<td >
<%
   session.invalidate(); 
%>
  <h1><font color="#00FFFF">You are Sucessfully logged out...</font></h1>
  <a href="http://10.1.1.128:8080/IMSII/imsiilogin.jsp">Go to Home Page</a>
  </td>
  </tr>
  </table>
</body>
</html>