<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.net.*" %>
    <%@ page import="java.sql.*" %>
    <% Class.forName("oracle.jdbc.driver.OracleDriver"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width">
<link href="bluetabs.css" rel="stylesheet" type="text/css">
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

<title>IMS Part II</title>
<style type="text/css">
ul.makeMenu, ul.makeMenu ul {
  width: 100%;                 /* sets the size of the menu blocks */
  border: 1px solid #000;      /* puts a black border around the menu blocks */
  background-color: #8aa;      /* makes the menu blocks mint green - a bg-color MUST be included for IE to work properly! */
  padding-left: 0px;           /* stops the usual indent from ul */
  cursor: default;             /* gives an arrow cursor */
  margin-left: 0px;            /* Opera 7 final's margin and margin-box model cause problems */
}
ul.makeMenu li {
  list-style-type: none;       /* removes the bullet points */
  margin: 0px;                 /* Opera 7 puts large spacings between li elements */
  position: relative;          /* makes the menu blocks be positioned relative to their parent menu item
                                  the lack of offset makes these appear normal, but it will make a difference
                                  to the absolutely positioned child blocks */
  color: #fff;                 /* sets the default font colour to white */
}
ul.makeMenu li > ul {          /* using the > selector prevents many lesser browsers (and IE - see below) hiding child ULs */
  display: none;               /* hides child menu blocks - one of the most important declarations */
  position: absolute;          /* make child blocks hover without leaving space for them */
  top: 2px;                    /* position slightly lower than the parent menu item */
  left: 40px;                  /* this must not be more than the width of the parent block, or the mouse will
                                  have to move off the element to move between blocks, and the menu will close */
}
ul.makeMenu li:hover, ul.makeMenu li.CSStoHighlight {
  background-color: #ffa;      /* gives the active menu items a yellow background */
  color: #000;                 /* makes the active menu item text black */ 
}
ul.makeMenu ul.CSStoShow {     /* must not be combined with the next rule or IE gets confused */
  display: block;              /* specially to go with the className changes in the behaviour file */
}
ul.makeMenu li:hover > ul {    /* one of the most important declarations - the browser must detect hovering over arbitrary elements
                                  the > targets only the child ul, not any child uls of that child ul */
  display: block;              /* makes the child block visible - one of the most important declarations */
}
/* and some link styles */
ul.makeMenu li a { color: #fff; display: block; width: 100%; text-decoration: underline; }
ul.makeMenu li a:hover, ul.makeMenu li a.CSStoHighLink { color: #000; }
ul.makeMenu li:hover > a { color: #000; } /* supports links in branch headings - should not be display: block; */
html, body {
                      width: 100%;
                      height: 100%;
                      margin: 0px;
                      align: center;
                      }
</style>
<attach event="onmouseover" handler="rollOver" />
<attach event="onmouseout" handler="rollOff" />
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

</script>

</head>

<body>

<!--<c:url value="/imsii.jsp" var="goToDefault" /> -->
<form method="link" action="logout.jsp">
<table width="100%" align="center">
<tr align="center">
<td width="5%" valign="top" align="center">
<img src="images/nfl2.jpg" ></img>
Historical Tree
</td>
<td width="90%" valign="middle" align="center" bgcolor=#FFEBCD>
<h3>National Fertilizers Limited , Vijaipur Unit</h3>
   <h3> (A Goverment of India Undertaking,
    Vijaipur,Guna,Madhya Pradesh-473111)</h3>
</td>
<td width="5%" valign="top" align="right">
<img src="images/NFL Logo.ico" ></img>
</td>
</tr>
</table>
<table width="100%" align="center">
<tr align="center">
<td width="100%" valign="top" align="center" bgcolor=#00FFFF>
<%= new java.util.Date() %>

</td>
</tr>
</table>
<table width="100%" align="center">
   <tr align="center">
      <td width="90%" valign="middle" align="center" bgcolor=#ADD8E6 >
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h2>Time Office (Leave Section) </h2>
      </td>
      <td width="10%" align="center" bgcolor=#00FFFF valign="middle">
         <input type="submit" value="Logout">
         <a href="http://10.1.1.128:8080/TimeOffice/to_login.jsp"><font color="red">HomePage</font></a>
     </td>
  </tr>
  </table>
  <table width="100%" align="center">
  <tr align="center">
    <td width="100%" valign="middle" align="center" bgcolor=#DAA520>
    Logged in user:Emp No- <%=request.getAttribute("Message")%>, Emp name-<%=request.getAttribute("Message2")%>    
  </td>
</tr>
</table>
<table width="100%" align="center" bgcolor=#f8c471>
<tr>
<td align="center">
<ul>      
      <a href="sendtoregleaveServlet?userid=<%=request.getAttribute("Message")%>"><b>Apply Leave</b></a>    
</ul>
</td>
</tr>
</table>
<table width="100%" align="center">
<tr>
<td width="90%" valign="middle" align="center" bgcolor=#fad7a0>
  You have <%=request.getAttribute("Message1")%> pending leave application for forwarding/approval
</td>
</tr>
</table>
</body>
</html>