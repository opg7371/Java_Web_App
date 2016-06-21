package javafiles;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class checklogin {

public static boolean checkLogin(String username,String password){
	boolean status=false;
	
	Connection con=GetCon.getCon();	
	try {		
		PreparedStatement ps=con.prepareStatement("Select * from to_login where userid = ? and pswd = ?");		
		ps.setString(1,username);
		ps.setString(2,password);
		
		ResultSet rs=ps.executeQuery();
		status=rs.next();
		//System.out.println("Here it is");
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return status;
}
}


