<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>User Department Data Entry Form</title>
<script language="JavaScript" src="pupdate.js"></script>
<link type="text/css" rel="stylesheet" href="global.css"/>
        <script type="text/javascript" src="calendar.js"></script>
        <script type="text/javascript">
            function init() {
                calendar.set("codt");                
            }
            
        </script>
</head>
<style>
body {
	margin: 0;
	padding: 0;
	line-height: 1.7em;
	font-family: Verdana, Geneva, sans-serif;
	font-size: 12px;
	color: #0000FF;	
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
    color:#0B610B;
}
.formHeading{
    font-family:Arial, Helvetica, sans-serif;
    font-size:18px;
    color:#8A0808;
}
</style>
<!-- <script language="JavaScript">
function chkelement(F1)
{
   for(var i=0; i<F1.elements.length; i++)
   {
		if(F1.elements[i].value != '')
		{
			f_email();			   		   			
		}
		else				
		 {			
			alert("Fill out all Fields.Leave system generated values unchanged, if not necessary");		   		  
			   document.F1.post.focus();
			   return false;			
		 }
   } 
} -->
<!-- <script language="JavaScript">
function chkelement(F1)
{
if(document.F1.post.value == " ")
{			
	alert("Please select post");		   		  
	   document.F1.post.focus();
	   return false;	   		
 }
else if(document.F1.centre_cd1.value == " ")
	{			
		alert("Please select centre choice");		   		  
		   document.F1.centre_cd1.focus();
		   return false;	   		
	 }	
	else if(document.F1.cand_name.value == '')
	{			
		alert("Please Enter Candidate Name");		   		  
		   document.F1.cand_name.focus();
		   return false;	   		
	 }
	else if(document.F1.father_name.value == '')
	{			
		alert("Please Enter Father's Name");		   		  
		   document.F1.father_name.focus();
		   return false;	   		
	 }
	else if(document.F1.mother_name.value == '')
	{			
		alert("Please Enter Mother's Name");		   		  
		   document.F1.mother_name.focus();
		   return false;	   		
	 }
	else if(((document.F1.cat.value == "SC") || (document.F1.cat.value == "ST")) && (document.F1.misc_cst_no.value =="N/A" ))
	{			
		alert("Please Enter Misc. Caste Certificate No");		   		  
		   document.F1.misc_cst_no.focus();
		   return false;	   		
	 }
	else if(((document.F1.cat.value == "SC") || (document.F1.cat.value == "ST")) && (document.F1.caste_name.value =="N/A" ))
	{			
		alert("Please Enter Caste/Tribe Name");		   		  
		   document.F1.caste_name.focus();
		   return false;	   		
	 }
	else if((document.F1.cat.value == "OBC") && (document.F1.creamy_ncreamy.value =="N" ))
	{			
		alert("OBC Candidate has to Creamy Layer to avail OBC quota. Select Gen at category if OBC Non-Creamy Layer");		   		  
		   document.F1.creamy_ncreamy.focus();
		   return false;	   		
	 }
	else if((document.F1.physical.value == "Yes") && (document.F1.perc_disab.value < 40.0))
	{			
		alert("Please Specify Percentage Disability. Minimum allowed percentage disability is 40. Else select 'No' above");		   		  
		   document.F1.perc_disab.focus();
		   return false;	   		
	 }
	else if(document.F1.religion.value == '')
	{			
		alert("Please specify your religion");		   		  
		   document.F1.religion.focus();
		   return false;	   		
	 }			
	else if(document.F1.mother_tongue.value == '')
	{			
		alert("Please Enter Mother Tongue");		   		  
		   document.F1.mother_tongue.focus();
		   return false;	   		
	 }
	else if(document.F1.language_known.value == '')
	{			
		alert("Please Enter at least one language");		   		  
		   document.F1.language_known.focus();
		   return false;	   		
	 }			
	else if(document.F1.cadd1.value == '')
	{			
		alert("Please Enter Correspondence Add1");		   		  
		   document.F1.cadd1.focus();
		   return false;	   		
	 }
	else if(document.F1.cadd2.value == '')
	{			
		alert("Please Enter Correspondence Add2");		   		  
		   document.F1.cadd2.focus();
		   return false;	   		
	 }
	else if(document.F1.cadd3.value == '')
	{			
		alert("Please Enter Correspondence Add3");		   		  
		   document.F1.cadd3.focus();
		   return false;	   		
	 }
	else if(document.F1.cdist.value == '')
	{			
		alert("Please Enter Correspondence Add District");		   		  
		   document.F1.cdist.focus();
		   return false;	   		
	 }
	else if(document.F1.cstate.value == " ")
	{			
		alert("Please select Correspondence Add State");		   		  
		   document.F1.cstate.focus();
		   return false;	   		
	 }
	else if(document.F1.cpin.value == '')
	{			
		alert("Please Enter Correspondence Add Pin Code");		   		  
		   document.F1.cpin.focus();
		   return false;	   		
	 }

    else if(document.F1.land_lineno.value == '')
     {			
	   alert("Please Enter N/A if not available");		   		  
	      document.F1.land_lineno.focus();
	      return false;	   		
     }
	else if(document.F1.padd1.value == '')
	{			
		alert("Please Enter Permanent Add1");		   		  
		   document.F1.padd1.focus();
		   return false;	   		
	 }
	else if(document.F1.padd2.value == '')
	{			
		alert("Please Enter Permanent Add2");		   		  
		   document.F1.padd2.focus();
		   return false;	   		
	 }
	else if(document.F1.padd3.value == '')
	{			
		alert("Please Enter Permanent Add3");		   		  
		   document.F1.padd3.focus();
		   return false;	   		
	 }
	else if(document.F1.pdist.value == '')
	{			
		alert("Please Enter Permanent Add District");		   		  
		   document.F1.pdist.focus();
		   return false;	   		
	 }
	else if(document.F1.pstate.value == " ")
	{			
		alert("Please select Permanent Add State");		   		  
		   document.F1.pstate.focus();
		   return false;	   		
	 }
	else if(document.F1.ppin.value == '')
	{			
		alert("Please Enter Permanent Add Pin Code");		   		  
		   document.F1.ppin.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam1.value == '')
	{			
		alert("Please Enter 10th class or Equivalent Examination Name");		   		  
		   document.F1.q_exam1.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam1_board.value == '')
	{			
		alert("Please Enter 10th class or Equivalent Examination Board Name");		   		  
		   document.F1.q_exam1_board.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam1_inst.value == '')
	{			
		alert("Please Enter 10th class or Equivalent Institute Name");		   		  
		   document.F1.q_exam1_inst.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam1_jyear.value == '')
	{			
		alert("Please Enter 10th class or Equivalent Examination Joining Year");		   		  
		   document.F1.q_exam1_jyear.focus();
		   return false;	   		
	 }	
	else if(document.F1.q_exam1_pyear.value == '')
	{			
		alert("Please Enter 10th class or Equivalent Examination Passing Year");		   		  
		   document.F1.q_exam1_pyear.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam1_mark_perc.value == '')
	{			
		alert("Please Enter 10th class or Equivalent Examination Percentage Mark");		   		  
		   document.F1.q_exam1_mark_perc.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam2.value == '')
	{			
		alert("Please Enter 10+2 or Equivalent Examination Name");		   		  
		   document.F1.q_exam2.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam2_board.value == '')
	{			
		alert("Please Enter N/A if not studied 10+2");		   		  
		   document.F1.q_exam2_board.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam2_inst.value == '')
	{			
		alert("Please Enter N/A if not studied 10+2");		   		  
		   document.F1.q_exam2_inst.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam2_jyear.value == '')
	{			
		alert("Please Enter N/A if not studied 10+2");		   		  
		   document.F1.q_exam2_jyear.focus();
		   return false;	   		
	 }	
	else if(document.F1.q_exam2_pyear.value == '')
	{			
		alert("Please Enter N/A if not studied 10+2");		   		  
		   document.F1.q_exam2_pyear.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam2_mark_perc.value == '')
	{			
		alert("Please Enter 0 if not studied 10+2");		   		  
		   document.F1.q_exam2_mark_perc.focus();
		   return false;	   		
	 }
	else if(document.F1.qual_type.value == "PT/DE")
	{			
		alert("You are not eligible to apply. Full Time or Regular Qualified is required");		   		  
		   document.F1.qual_type.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam3.value == '')
	{			
		alert("Please Enter Graduation or Diploma Examination Name");		   		  
		   document.F1.q_exam3.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam3_board.value == '')
	{			
		alert("Please Enter Graduation or Diploma Examination Board Name");		   		  
		   document.F1.q_exam3_board.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam3_inst.value == '')
	{			
		alert("Please Enter Graduation or Diploma Institute Name");		   		  
		   document.F1.q_exam3_inst.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam3_jyear.value == '')
	{			
		alert("Please Enter Graduation or Diploma Joining Year");		   		  
		   document.F1.q_exam3_jyear.focus();
		   return false;	   		
	 }	
	else if(document.F1.q_exam3_pyear.value == '')
	{			
		alert("Please Enter Graduation or Diploma Passing Year");		   		  
		   document.F1.q_exam3_pyear.focus();
		   return false;	   		
	 }
	else if(document.F1.q_exam3_mark_perc.value == '')
	{			
		alert("Please Enter Graduation or Diploma Examination Percentage Mark");		   		  
		   document.F1.q_exam3_mark_perc.focus();
		   return false;	   		
	 }
	else if(((document.F1.cat.value == "Gen") || (document.F1.cat.value == "OBC")) && (document.F1.q_exam3_mark_perc.value < 50.0 ))
	{			
		alert("Minimum required percentage of qualifying mark is 50% for Gen and OBC candidate");		   		  
		   document.F1.q_exam3_mark_perc.focus();
		   return false;	   		
	 }	
	else if(((document.F1.cat.value == "SC") || (document.F1.cat.value == "ST")) && (document.F1.q_exam3_mark_perc.value < 45.0 ))
	{			
		alert("Minimum required percentage of qualifying mark is 45% for SC and ST candidate");		   		  
		   document.F1.q_exam3_mark_perc.focus();
		   return false;	   		
	 }
	else if((document.F1.post.value == "001") && ((document.F1.q_exam3.value !="001") && (document.F1.q_exam3.value !="002") && (document.F1.q_exam3.value !="003")))
	{			
		alert("Please Select proper examination name.You have opted for the post Jr.Engineering Asst.GrII(Prod)");		   		  
		   document.F1.q_exam3.focus();
		   return false;	   		
	 }
	else if((document.F1.post.value == "002") && ((document.F1.q_exam3.value !="004") && (document.F1.q_exam3.value !="005")))
	{			
		alert("Please Select proper examination name.You have opted for the post Jr.Engineering Asst.GrII(Mechanical)");		   		  
		   document.F1.q_exam3.focus();
		   return false;	   		
	 }
	else if((document.F1.post.value == "003") && ((document.F1.q_exam3.value !="006") && (document.F1.q_exam3.value !="007")))
	{			
		alert("Please Select proper examination name.You have opted for the post Jr.Engineering Asst.GrII(Electrical)");		   		  
		   document.F1.q_exam3.focus();
		   return false;	   		
	 }
	else if((document.F1.post.value == "004") && ((document.F1.q_exam3.value !="008") && (document.F1.q_exam3.value !="009") && (document.F1.q_exam3.value !="010") && (document.F1.q_exam3.value !="011")))
	{			
		alert("Please Select proper examination name.You have opted for the post Jr.Engineering Asst.GrII(Instrumentation)");		   		  
		   document.F1.q_exam3.focus();
		   return false;	   		
	 }
	else if(document.F1.experience1_org.value == '')
	{			
		alert("Please Enter Post Qualification Experience Org.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.experience1_org.focus();
		   return false;	   		
	 }
	else if(document.F1.experience1_desig.value == '')
	{			
		alert("Please Enter Post Qualification Experience Position.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.experience1_desig.focus();
		   return false;	   		
	 }
	else if(document.F1.experience1_from.value == '')
	{			
		alert("Please Enter Post Qualification Experience From.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.experience1_from.focus();
		   return false;	   		
	 }
	else if(document.F1.experience1_to.value == '')
	{			
		alert("Please Enter Post Qualification Experience Upto.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.experience1_to.focus();
		   return false;	   		
	 }
	else if(document.F1.experience1_duty.value == '')
	{			
		alert("Please Enter Post Qualification Experience Duty Performed.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.experience1_duty.focus();
		   return false;	   		
	 }
	else if(document.F1.experience1_leave.value == '')
	{			
		alert("Please Enter Reason of Leaving.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.experience1_leave.focus();
		   return false;	   		
	 }
	else if(document.F1.experience2_org.value == '')
	{			
		alert("Please Enter Post Qualification Experience Org.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.experience2_org.focus();
		   return false;	   		
	 }
	else if(document.F1.experience2_desig.value == '')
	{			
		alert("Please Enter Post Qualification Experience Position.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.experience2_desig.focus();
		   return false;	   		
	 }
	else if(document.F1.experience2_from.value == '')
	{			
		alert("Please Enter Post Qualification Experience From.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.experience2_from.focus();
		   return false;	   		
	 }
	else if(document.F1.experience2_to.value == '')
	{			
		alert("Please Enter Post Qualification Experience Upto.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.experience2_to.focus();
		   return false;	   		
	 }
	else if(document.F1.experience2_duty.value == '')
	{			
		alert("Please Enter Post Qualification Experience Duty Performed.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.experience2_duty.focus();
		   return false;	   		
	 }
	else if(document.F1.experience2_leave.value == '')
	{			
		alert("Please Enter Reason of Leaving.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.experience2_leave.focus();
		   return false;	   		
	 }
	else if(document.F1.related_person.value == '')
	{			
		alert("Please Enter Related Person in NFL.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.related_person.focus();
		   return false;	   		
	 }
	else if(document.F1.related_desig.value == '')
	{			
		alert("Please Enter Desig of Related Person in NFL.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.related_desig.focus();
		   return false;	   		
	 }
	else if(document.F1.relation.value == '')
	{			
		alert("Please Enter Relation.Leave System Generated Value un altered if not applicable");		   		  
		   document.F1.relation.focus();
		   return false;	   		
	 } 			
	else if(document.F1.photo.value == '')
	{			
		alert("Please Upload Photo");		   		  
		   document.F1.photo.focus();
		   return false;	   		
	 }	
	else if(document.F1.sign.value == '')
	{			
		alert("Please Upload Signature");		   		  
		   document.F1.sign.focus();
		   return false;	   		
	 }
	
	else
		{		
		   f_email();			   		   			
		}
}
function formSubmit()
{
  document.getElementById("frm1").submit();
}
function f_email()
{
var e=/^([a-zA-Z0-9_.-])+@+([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;
if(e.test(document.F1.email.value))
{
//return true;
phone();
}
else
{
alert("Please enter valid email!");
document.F1.email.focus();
//return false;
}
 
}
function phone()
{
var p=/[0-9]/;
if(document.F1.mob.value!='')
{
  if(p.test(document.F1.mob.value) && document.F1.mob.value.length==10)
     {
       formSubmit();
     }
  else
     {
        alert("Please Enter Correct Mobile No!");
        document.F1.mob.focus();  
     } 
}
else
  alert("Please enter 10 digit mobile number!");
  document.F1.mob.focus();
  //return false;
}

function checkIt() {
	  if (confirm('Are you sure you want to submit details ? Click Cancel Button to review')) {
		  chkelement(F1);			   
	  }
	}
</script>  -->
<script language="JavaScript">
function formSubmit()
{
  document.getElementById("frm1").submit();
}
function checkIt() {
	  if (confirm('Are you sure you want to submit details ? Click Cancel Button to review')) {
		  formSubmit();			   
	  }
	}
</script>
<script language="javascript" type="text/javascript"> 
    var xmlHttp;   
    var xmlHttp;
    function showempdet(str){    
    	if (typeof XMLHttpRequest != "undefined"){  
    		xmlHttp= new XMLHttpRequest();      }    
    	else if (window.ActiveXObject){  
    		xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");      }   
    	if (xmlHttp==null){   
    		alert("Browser does not support XMLHTTP Request");  
    		return; 
    		}  
    	
    	var url="empdet.jsp";
    	//url +="?type_leave=" +str; 
    	url +="?pswd=" +str;    	   
    	xmlHttp.onreadystatechange = stateChange;   
    	xmlHttp.open("GET", url, true);  
    	xmlHttp.send(null);    
    	}     
    function stateChange(){   
    	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
    		document.getElementById("empname").innerHTML=xmlHttp.responseText; 
    		}       
    	}
</script>

<body width="100%">
<table width="100%" align="center">
  <tr height="40px">
     <td align="center" colspan="2" class="formHeading" bgcolor="#F5F6CE">NIT Details</td>
  </tr>
  <tr height="40px">
     <td align="center" colspan="2" class="formHeading" bgcolor="#F5F6CE">Data Entry Form</td>
  </tr>  
  <tr height="10px">
     <td colspan="2"></td>
  </tr>
 </table>
<form id="frm1" name=F1 enctype="multipart/form-data" action="SavedataServlet?userid=<%=request.getAttribute("Message")%>" method="post">
<!-- <form name=F1 onsubmit ="return chkelement(this); return checkIt()" action="form_submit.jsp; EmailSendingServlet" > -->
<!-- <form id="frm1" onsubmit ="return checkIt()" action="form_submit.jsp" >-->		
<% String username = request.getParameter("userid");%>
<table width="100%" align="center">
  <tr align="center">
    <td width="100%" valign="middle" align="center" bgcolor=#DAA520>
   <b> Logged in user: User ID- <%=request.getAttribute("Message")%>,User Name- <%=request.getAttribute("Message1")%></b>
  </td>
</tr>
</table>
					<body onload="init()">  
                       <form action="" method="post">
                          <table width="100%" bgcolor=#D7DF01 align="center">                    
                             <tr valign="top" align="center">                                                                                                                                                     
                                <td width="50%" align="right"><label> Emp No:</label></td><td width="50%" align="left"><input type="text" size="5" name="empno" id="empno" readonly value=<%=request.getAttribute("Message2")%>></input> </td>
                             </tr>
                             <tr> 
                                <td width="50%" align="right"><label> CO Date:</label></td> <td width="50%" align="left"><input type="text" size="15" name="codt" id="codt"></input><label> (Date Format YYYY-MM-DD)</label> </td>
                             </tr>
                             <tr> 
                                <td width="50%" align="right"><label> Nature of CO:</label></td> <td width="50%" align="left"><input type="text" size="15" name="cotype" id="cotype"></input></td>
                             </tr>   
                                                                                    
                          </table> 
                        </form>                                              
                      </body>
                                              
               <table class="text" border="1" cellpadding="2" cellspacing="1" width="100%" align="center">
                  <tr>                                                                 
                 	  <td height="30" align="center">
                    	<input value="Submit Detail" class="btnbg" type="button" onclick="checkIt()">&nbsp;&nbsp;
                    	<input TYPE="submit" value="Exit" onclick=window.close();></input>
                      </td>
               	  </tr>                 
               </table>	
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="javafiles.*" %>
</form>
</body>
</html>
