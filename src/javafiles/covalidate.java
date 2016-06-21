package javafiles;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class covalidate {

public static boolean covalidate(String userid,String ltype){
	boolean status=false;
	ResultSet rs;	
	int k;
	int l;
	Connection con=GetCon.getCon();	
	try {
		PreparedStatement ps3=con.prepareStatement("Select count(*) from jsp_leave_dts where emp_code = ?");		
		ps3.setString(1,userid);		
		rs=ps3.executeQuery();
		status=rs.next();
		k=rs.getInt(1); 
		System.out.println("No of DCO Availing is  '"+k+"'");
		PreparedStatement ps4=con.prepareStatement("Select count(*) from coearning_jsp where emp_code = ? and co_type=? and upflag is null and co_chkd_flag is not null and co_date<(select max(leavedts) from jsp_leave_dts)");		
		ps4.setString(1,userid);
		ps4.setString(2,ltype);
		rs=ps4.executeQuery();
		status=rs.next();
		l=rs.getInt(1);
				
		System.out.println("Number of Balance DCO is  '"+l+"'");
		if(l<k)
		{
			status=false;
		}
		else
		{			
			status=true;
		}
		//System.out.println("Here it is");
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return status;
}
}


