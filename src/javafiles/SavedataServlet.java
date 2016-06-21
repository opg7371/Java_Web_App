
package javafiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.lang.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class SavedataServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        ResultSet rs;
       
        try {
            // Apache Commons-Fileupload library classes
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload sfu  = new ServletFileUpload(factory);

            if (! ServletFileUpload.isMultipartContent(request)) {
                System.out.println("sorry. No file uploaded");
                return;
            }
            String userid = request.getParameter("userid").toString();
            List items = sfu.parseRequest(request);
                                    
            FileItem  empno = (FileItem) items.get(0);
            String empcode =  empno.getString();
            
            FileItem  codt = (FileItem) items.get(1);
            String codate =  codt.getString();                             
            
            FileItem  cotype = (FileItem) items.get(2);
            String co_type =  cotype.getString();
                        
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@10.1.53.10:1521:nflvjpdb", "trainee", "trainee");
            con.setAutoCommit(false);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    		
    		PreparedStatement chknit = con.prepareStatement("select count(*) from coearning where emp_code='"+empcode+"' and to_char(co_date,'yyyy-mm-dd')=to_char('"+codate+"','yyyy-mm-dd')");		
    		rs=chknit.executeQuery();    		
    		rs.next();
    		int nitcnt=rs.getInt(1);
    		
    		if(nitcnt>0)
	          {
    			con.close();
    			String resultMessage = "'"+userid+"'";
				request.setAttribute("Message", resultMessage);
				String resultMessage1 = "This emp_code with date already exists..." ;
				request.setAttribute("Message", resultMessage);
				request.setAttribute("Message1", resultMessage1);
				getServletContext().getRequestDispatcher("/Result.jsp").forward(
		                    request, response);
				return;
	          }
    		else
    		  {
    			PreparedStatement ps = con.prepareStatement("insert into coearning(emp_code,co_date,co_type) values(?,?,?)");    			
                ps.setString(1, empcode);
                ps.setDate(2, java.sql.Date.valueOf(codate));                
                ps.setString(3, co_type);                
                ps.executeUpdate();
                con.commit();
                con.close();
                String resultMessage = "'"+userid+"'";
				request.setAttribute("Message", resultMessage);
				String resultMessage1 = "Data Entered" ;
				request.setAttribute("Message", resultMessage);
				request.setAttribute("Message1", resultMessage1);
				getServletContext().getRequestDispatcher("/Result.jsp").forward(
		                    request, response);
				return;
    		  }
    		
                              
        	}	
        catch(Exception ex) {
        	ex.printStackTrace();
    		String abc=ex.toString();
    		System.out.println(abc);
    		out.println( "Data could not be entered...Please try again.");
            //out.println( "Error --> " + ex.getMessage());
        }
    } 
}
