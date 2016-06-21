package javafiles;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.*;
import java.lang.*;
import java.nio.file.Paths;
import java.rmi.Naming;
import java.sql.*;
import java.text.*;
//import javax.servlet.annotation.WebServlet;
import javax.imageio.ImageIO;
import javax.imageio.stream.FileImageInputStream;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.Part;
//import javax.servlet.annotation.MultipartConfig;
import javax.xml.stream.Location;
import java.util.Scanner;
//import sun.nio.cs.Surrogate.Parser;
import javax.servlet.*;
import javax.servlet.http.*;
//import javax.servlet.jsp.PageContext;

//import com.sun.xml.internal.bind.v2.TODO;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.output.*;
//import javax.servlet.annotation.WebServlet;

/**
 * Servlet implementation class FormControllerServlet
 * 
@WebServlet("/upload.do")
@MultipartConfig
@WebServlet("/FormControllerServlet") 
@WebServlet(name = "LoginvarifyServlet", urlPatterns = {"/LoginvarifyServlet"})*/
public class LoginvarifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginvarifyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
@Override
 	    protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, NullPointerException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter out = response.getWriter();
		String username = request.getParameter("userid");
		String password = request.getParameter("pswd");
		
		try {
			//boolean status = checklogin.checkLogin(username,password);
			Class.forName("oracle.jdbc.driver.OracleDriver").newInstance(); 
			 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@10.1.53.10:1521:nflvjpdb", "trainee", "trainee"); 
			 Statement stmt = con.createStatement(); 
			 
			
			if (username!=null || password!=null) 
			{
				boolean status = checklogin.checkLogin(username,password);
				if (status == false)
				{					
					String resultMessage = "Invalid userid or password...All fields are required";
					request.setAttribute("Message", resultMessage);
					getServletContext().getRequestDispatcher("/loginfailed.jsp").forward(
			                    request, response);
				}
				else				
				{	 														
					ResultSet rs = stmt.executeQuery("Select emp_code,emp_name from to_login where userid='"+username+"' and pswd='"+password+"'");
					 rs.next();
					String empno=rs.getString(1);
					String empnm=rs.getString(2);
					String resultMessage = ""+username+"";
					
				/*	ResultSet rs1 = stmt.executeQuery("Select count(*) from alertprocess where alertrecievedby='"+username+"' and actiontakenalert is null");
					rs1.next();
					int cnt=rs1.getInt(1);
					String resultMessage1 = ""+cnt+""; */
					String resultMessage1 = ""+empnm+"";
					String resultMessage2 = ""+empno+"";
					request.setAttribute("Message", resultMessage);
					request.setAttribute("Message1", resultMessage1);
					request.setAttribute("Message2", resultMessage2);
					getServletContext().getRequestDispatcher("/Userdataentry.jsp").forward(
		                    request, response);
				}
				
			}									
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {	
		doGet(request,response);		
	}
	
}


