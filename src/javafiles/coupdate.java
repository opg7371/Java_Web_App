package javafiles;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class coupdate {

public static boolean coupdate(String userid){
	boolean status=false;
	ResultSet rs;
	int i;
	int j;
	Connection con=GetCon.getCon();	
	try {				
		
		PreparedStatement insertavdt = con.prepareStatement("insert into coavail_jsp(emp_code,avail_date) select emp_code,leavedts from jsp_leave_dts where emp_code =?");
		insertavdt.setString(1,userid);
	    rs=insertavdt.executeQuery();
	    status=rs.next();
	    con.commit();
	    
		PreparedStatement ps=con.prepareStatement("Select to_date(l_date_to)-to_date(l_date_from)+1 from lrmonth_jsp where emp_code = ? and flag is null");		
		ps.setString(1,userid);	
		rs=ps.executeQuery();
		status=rs.next();
		j=rs.getInt(1);				
		
		System.out.println("Number of entries is  '"+j+"'");
		for(i=0;i<j;i++)
		{
		  
			PreparedStatement ps1 = con.prepareStatement("update coavail_jsp set co_date=(select min(co_date) from coearning_jsp where emp_code=? and co_chkd_flag is not null and upflag is null) where emp_code=? and avail_date=(select min(avail_date) from coavail_jsp where emp_code=? and flag is null)");
			ps1.setString(1,userid);
			ps1.setString(2,userid);
			ps1.setString(3,userid);
		    rs=ps1.executeQuery();
		    status=rs.next();
		    con.commit();
		    
		    PreparedStatement ps11 = con.prepareStatement("update coavail_jsp set flag='S' where emp_code=? and co_date=(select min(co_date) from coearning_jsp where emp_code=? and co_chkd_flag is not null and upflag is null)");
			ps11.setString(1,userid);
			ps11.setString(2,userid);
		    rs=ps11.executeQuery();
		    status=rs.next();
		    con.commit();
		    
		    PreparedStatement ps12 = con.prepareStatement("update coearning_jsp set upflag='A' where emp_code=? and co_date=(select min(co_date) from coearning_jsp where emp_code=? and co_chkd_flag is not null and upflag is null)");
			ps12.setString(1,userid);
			ps12.setString(2,userid);
		    rs=ps12.executeQuery();
		    status=rs.next();
		    con.commit();
		}		
		//System.out.println("Here it is");
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return status;
}
}


