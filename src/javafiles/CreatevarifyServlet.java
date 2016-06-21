package javafiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
 //import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class createvarifyservlet
 
@WebServlet("/createvarifyservlet")*/
public class CreatevarifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatevarifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("Hello World");
			String username = request.getParameter("userid");
			String password = request.getParameter("pswd");
			String emp_name = request.getParameter("emp_name");
			String emp_no = request.getParameter("emp_no");
			try {
				//boolean status = checklogin.checkLogin(username,password);
				Class.forName("oracle.jdbc.driver.OracleDriver").newInstance(); 
				 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@10.1.53.10:1521:nflvjpdb", "trainee", "trainee"); 
				 Statement stmt = con.createStatement(); 
				 
				
				if (username!=null || password!=null || emp_name!=null || emp_no!=null) 
				{	 														
						ResultSet rs = stmt.executeQuery("insert into to_login values('"+username+"','"+password+"','"+emp_name+"','"+emp_no+"')");
						
						 rs.next();
						 con.commit();
					/*	 String userid = rs.getString(1);
						 String pswd = rs.getString(2);
						int empno=rs.getInt(3);
						String empnm=rs.getString(4);*/
						//String resultMessage = ""+empno+"";
						
					/*	ResultSet rs1 = stmt.executeQuery("Select count(*) from alertprocess where alertrecievedby='"+username+"' and actiontakenalert is null");
						rs1.next();
						int cnt=rs1.getInt(1);
						String resultMessage1 = ""+cnt+""; */
						//String resultMessage2 = ""+empnm+"";
						//request.setAttribute("Message", resultMessage);
						//request.setAttribute("Message1", resultMessage1);
						//request.setAttribute("Message2", resultMessage2);
						getServletContext().getRequestDispatcher("/to_login.jsp").forward(
			                    request, response);
					}
					
												
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
