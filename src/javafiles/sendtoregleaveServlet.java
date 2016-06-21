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




/**
 * Servlet implementation class FormControllerServlet
 * 
@WebServlet("/upload.do")
@MultipartConfig
@WebServlet("/FormControllerServlet") 
@WebServlet(name = "LoginvarifyServlet", urlPatterns = {"/LoginvarifyServlet"})*/
public class sendtoregleaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public sendtoregleaveServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	@Override		
 	    protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, NullPointerException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter out = response.getWriter();
	//System.out.println("Here it is");
	String uid = request.getParameter("userid").toString();
	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@10.1.53.10:1521:nflvjpdb", "trainee", "trainee");           
            PreparedStatement ps = con.prepareStatement("select emp_name from to_login where emp_code ='"+uid+"'");        
            ResultSet rs = ps.executeQuery();
            rs.next();
    		String empnm=rs.getString(1);
    		String resultMessage = ""+uid+"";
			String resultMessage1 = ""+empnm+"" ;
			request.setAttribute("Message", resultMessage);
			request.setAttribute("Message1", resultMessage1);
			getServletContext().getRequestDispatcher("/Userdataentry.jsp").forward(
		                    request, response);
			
			
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


