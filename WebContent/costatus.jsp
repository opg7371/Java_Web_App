<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
<style>
body {
	margin: 0;
	padding: 0;
	line-height: 1.7em;
	font-family: Verdana, Geneva, sans-serif;
	font-size: 12px;
	color: #000000;	
	background: url(images/pnggradHDrgba.png) repeat-x bottom;	
	align: center;
	width: 100%;
}
.outter{
    border:3px #E0F0E8 solid;
    background-color:#F5FAF9;
}
.note{
    font-family:tahoma;
    font-size:12px;
    color:#333333;
    border:1px #55917A dashed;
}
.input{
    font-family:Verdana, Arial, Helvetica, sans-serif;
    font-weight:normal;
    font-size:12px;
    border:1px #A7BEB7 solid;
}
.text{
    font-family:tahoma;
    font-size:12px;
    color:#617E78;    
}
.formHeading{
    font-family:Arial, Helvetica, sans-serif;
    font-size:18px;
    color:#8A0808;
}
</style>

    <script language="javascript" type="text/javascript"> 
    var xmlHttp;   
    var xmlHttp;  
    function showAppl(str){    
    	if (typeof XMLHttpRequest != "undefined"){  
    		xmlHttp= new XMLHttpRequest();      }    
    	else if (window.ActiveXObject){  
    		xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }   
    	if (xmlHttp==null){   
    		alert("Browser does not support XMLHTTP Request");  
    		return; 
    		}  
    	var url="getcostatus.jsp"; 
    	url +="?userid=" +str;   
    	xmlHttp.onreadystatechange = stateChange;   
    	xmlHttp.open("GET", url, true);  
    	xmlHttp.send(null);    
    	}     
    function stateChange(){   
    	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
    		document.getElementById("codet").innerHTML=xmlHttp.responseText; 
    		}       
    	}     
   
    function formSubmit()
    {
    document.getElementById("frm1").submit();
    }
    </script>  
          </head>   
               <body>
               <% String val=request.getAttribute("Message").toString(); %>                           
             <form id="frm1" name=F1 >          
                  <table width="100%" align="center">
                     <tr >
                       <td width="100%">
                          <table class="text" border="1" cellpadding="4" cellspacing="3" width="100%">
                            <tr height="40px"  >                       
                              <td width="90%" align="center" class="formHeading" bgcolor="#2EFE2E">View Leave Application</td>
                              <td width="10%" align="right" bgcolor=#00FFFF valign="middle">                               
                                  <a href="http://10.1.1.128:8080/TimeOffice/to_login.jsp">HomePage</a>
                              </td> 
                            </tr>
                         </table> 
                      </td>
                    </tr>
                    <tr align="center">
                        <td width="100%" valign="top" align="center" bgcolor=#fad7a0>
                          <b>Logged in User: Emp No- <%=request.getAttribute("Message")%>,Name - <%=request.getAttribute("Message1")%></b>
                        </td>
                    </tr>
                    <tr align="center">
                        <td width="100%" valign="top" align="center" bgcolor=#fad7a0>
                         <b> Total DCO- <%=request.getAttribute("Message3")%>,Accepted - <%=request.getAttribute("Message4")%>,Availed- <%=request.getAttribute("Message5")%>,Balance - <%=request.getAttribute("Message6")%></b>
                        </td>
                    </tr>
                    <tr align="center">
                        <td width="100%" valign="top" align="center" bgcolor=#fad7a0>
                         <b> Total ECO- <%=request.getAttribute("Message7")%>,Accepted - <%=request.getAttribute("Message8")%>,Availed- <%=request.getAttribute("Message9")%>,Encashed - <%=request.getAttribute("Message10")%>,Balance - <%=request.getAttribute("Message11")%></b>
                        </td>
                    </tr>
                    <tr >
                      <td width="100%"> 
                         <table width="100%" align="center">   
                           <tr height="10px" align="center">
                              <td bgcolor="#E0F0E8" width="50%">Please Click on the box and then press tab:                              
                                 <input size="11" maxlength="11" type="password" name="userid" value=<%=request.getAttribute("Message2")%> onkeydown="showAppl(this.value)">                                   
                             </td>                                                 
                         </tr>
                        </table>
                      </td>
                   </tr>
                   <tr >
                      <td width="100%">    
                        <table width="100%" align="center">
                          <tr height="5px" align="center">                            
                            <td bgcolor="#E0F0E8">
                               ==================================================================================================  
                           </td>                                                                                   
                         </tr>                         
                        </table>
                      </td>
                   </tr>
                                                          
                  <tr height="5px" align="center">                                                        
                      <td bgcolor="#E0F0E8" align="center">
                        <div id='codet'>
                            <input size="8" maxlength="8"  type="text" name="codet">
                       </div>    
                      </td>                                                       
                  </tr>      
                   <tr >
                      <td width="100%">    
                        <table width="100%" align="center">
                          <tr height="5px" align="center">                            
                            <td bgcolor="#E0F0E8">
                               ==================================================================================================  
                           </td>                                                                                   
                         </tr>                 
                      </table>
                     </td>
                   </tr> 
                         
                  <tr height="5px" align="center">                            
                      <td align="center">                        
                         <INPUT TYPE="submit" value="Exit" onclick=window.close();></INPUT>                                 
                      </td>                                                                                 
                 </tr>
             </table>
           </form>
      </body> 
</html>