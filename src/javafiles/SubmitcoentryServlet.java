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

public class SubmitcoentryServlet extends HttpServlet {
    
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
                                    
            FileItem  nitrefno = (FileItem) items.get(0);
            String nitrefnum =  nitrefno.getString();
            
            FileItem  nitrefdt = (FileItem) items.get(1);
            String nitrefdate =  nitrefdt.getString();                             
            
            FileItem  pbopdt = (FileItem) items.get(2);
            String pbopdate =  pbopdt.getString();
            
            FileItem  emdamt = (FileItem) items.get(3);
            String emdamount =  emdamt.getString();
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@10.1.53.10:1521:nflvjpdb", "timeoffice", "timeoffice");
            con.setAutoCommit(false);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    		
    		PreparedStatement chknit = con.prepareStatement("select count(*) from nit_detail where nitreferencenumber='"+nitrefnum+"' and to_char(nitreferencedate,'yyyy-mm-dd')='"+nitrefdate+"'");		
    		rs=chknit.executeQuery();    		
    		rs.next();
    		int nitcnt=rs.getInt(1);
    		
    		if(nitcnt>0)
	          {
    			con.close();
    			String resultMessage = "'"+userid+"'";
				request.setAttribute("Message", resultMessage);
				String resultMessage1 = "This NIT with date already exists..." ;
				request.setAttribute("Message", resultMessage);
				request.setAttribute("Message1", resultMessage1);
				getServletContext().getRequestDispatcher("/Result.jsp").forward(
		                    request, response);
				return;
	          }
    		else
    		  {
    			PreparedStatement ps = con.prepareStatement("insert into nit_detail(nitreferencenumber,nitreferencedate,bid_opening_date,adduser,emd_amt) values(?,?,?,?,?)");    			
                ps.setString(1, nitrefnum);
                ps.setDate(2, java.sql.Date.valueOf(nitrefdate));
                ps.setDate(3, java.sql.Date.valueOf(pbopdate));
                ps.setString(4, userid);
                ps.setDouble(5, java.lang.Double.parseDouble(emdamount));
                ps.executeUpdate();
                con.commit();
                con.close();
                String resultMessage = "'"+userid+"'";
				request.setAttribute("Message", resultMessage);
				String resultMessage1 = "NIT Reference Number '"+nitrefnum+"' with date '"+nitrefdate+"' Entered Successfully..." ;
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
