package javafiles;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class checkleaventry {

public static boolean checkleaventry(String userid,String dt1,String lastdtcmon,String lastdtpmon){
	boolean status=true;
	ResultSet rs;
	ResultSet rs1;
	
	int k;
	int l;
	int m;
	int n;
	int o;
	int p;
	int q;
	int r;
	int s;
	int t;
	Connection con=GetCon.getCon();	
	try {
		System.out.println("Here is entered for leave entry check");
		PreparedStatement ps=con.prepareStatement("Select count(*) from lrmonth_jsp where emp_code = ? and to_char(l_date_from,'yyyy-mm-dd')=? and flag is not null and approval_flag='N'");		
		ps.setString(1,userid);
		ps.setString(2,dt1);
		rs=ps.executeQuery();
		status=rs.next();
		k=rs.getInt(1);
		
		PreparedStatement psgetmon=con.prepareStatement("Select to_char(l_date_of_month,'yyyy-mm') from lrmonth_jsp where emp_code = ? and approval_flag='N' and l_rec_no=1");		
	    psgetmon.setString(1,userid);				
	    rs=psgetmon.executeQuery();
	    status=rs.next();
	    String mon=rs.getString(1);
	    
	    PreparedStatement ps1=con.prepareStatement("Select count(*) from lrmonth_jsp where emp_code = ? and to_char(l_date_of_month,'yyyy-mm')<>'"+mon+"' and approval_flag='Y' and accepted_appl is null");		
		ps1.setString(1,userid);		
		rs=ps1.executeQuery();
		status=rs.next();
		n=rs.getInt(1);
		
		PreparedStatement ps11=con.prepareStatement("Select count(*) from lrmonth_jsp where emp_code = ? and to_char(l_date_of_month,'yyyy-mm')='"+mon+"' and approval_flag='Y' and rev_flag='R'");		
		ps11.setString(1,userid);		
		rs=ps11.executeQuery();
		status=rs.next();
		t=rs.getInt(1);
		
		System.out.println("Count of old entries is "+k+"");
		if(k>0 || n>0 || t>0)
		{
			status=false;// with an instruction to drop earlier entered data
		}
		else	
		{
			System.out.println("Here entered for next");		
			PreparedStatement ps2=con.prepareStatement("Select count(*) from lrmonth_jsp where emp_code = ? and to_char(l_date_of_month,'yyyy-mm-dd')=? and approval_flag='Y'");		
			ps2.setString(1,userid);
			ps2.setString(2,lastdtcmon);
			rs=ps2.executeQuery();
			status=rs.next();
			l=rs.getInt(1);
			System.out.println("Count of old leave entries is "+l+"");
			if(l>0)				
			{							    
				PreparedStatement pst1=con.prepareStatement("Select count(*) from lrmonth_jsp_temp where emp_code = ?");		
				pst1.setString(1,userid);				
				rs=pst1.executeQuery();
				status=rs.next();
				m=rs.getInt(1);
				System.out.println("Value of m in leaveentrycheck is "+m+"");
				if(m==0)
				{
					PreparedStatement pst=con.prepareStatement("insert into lrmonth_jsp_temp select emp_code,emp_name,l_date_from,l_date_to,type_leave,leave_days,l_date_of_month,temp_flag1 from lrmonth_jsp where emp_code = ? and to_char(l_date_of_month,'yyyy-mm-dd')=? and approval_flag='Y'");		
					pst.setString(1,userid);					
					pst.setString(2,lastdtcmon);
					rs1=pst.executeQuery();
					status=rs1.next();
					con.commit();			
			        PreparedStatement ps31=con.prepareStatement("delete from cl_rh_mast_jsp_s where emp_code = ?");		
			        ps31.setString(1,userid);					
			        rs1=ps31.executeQuery();
			        status=rs1.next();
			        con.commit();
			        PreparedStatement ps32=con.prepareStatement("insert into cl_rh_mast_jsp_s select * from cl_rh_mast_jsp where emp_code = ?");		
				    ps32.setString(1,userid);					
				    rs1=ps32.executeQuery();
				    status=rs1.next();
				    con.commit();
				    
				    
					
					PreparedStatement ps34=con.prepareStatement("Select count(*) from coearning_jsp_rev where emp_code = ?");		
					ps34.setString(1,userid);				
					rs=ps34.executeQuery();
					status=rs.next();
					p=rs.getInt(1);
					System.out.println("Value of p in leaveentrycheck is "+p+"");
					if(p>0)
					{
						PreparedStatement ps6=con.prepareStatement("delete from coearning_jsp_rev where emp_code = ?");		
						ps6.setString(1,userid);					
						rs1=ps6.executeQuery();
						status=rs1.next();
						con.commit();
					}
					PreparedStatement ps8=con.prepareStatement("insert into coearning_jsp_rev select * from coearning_jsp where emp_code = ?");		
					ps8.setString(1,userid);					
					rs1=ps8.executeQuery();
					status=rs1.next();
					con.commit();
					
					PreparedStatement ps37=con.prepareStatement("select count(*) from coearning_jsp_rev where emp_code = ? and co_date in (select co_date from coavail_jsp where to_char(avail_date,'yyyy-mm')='"+mon+"')");		
					ps37.setString(1,userid);				
					rs=ps37.executeQuery();
					status=rs.next();
					s=rs.getInt(1);
					if(s>0)
					{
						PreparedStatement pscoearnupd=con.prepareStatement("update coearning_jsp_rev set upflag=null where emp_code = ? and co_date in (select co_date from coavail_jsp where to_char(avail_date,'yyyy-mm')='"+mon+"')");		
						pscoearnupd.setString(1,userid);									    				    
						rs1=pscoearnupd.executeQuery();
						status=rs1.next();
						con.commit();
					}
					
					PreparedStatement ps33=con.prepareStatement("Select count(*) from coavail_jsp_rev where emp_code = ?");		
					ps33.setString(1,userid);				
					rs=ps33.executeQuery();
					status=rs.next();
					o=rs.getInt(1);
					System.out.println("Value of o in leaveentrycheck is "+o+"");
					if(o>0)
					{
						PreparedStatement ps5=con.prepareStatement("delete from coavail_jsp_rev where emp_code = ?");		
						ps5.setString(1,userid);					
						rs1=ps5.executeQuery();
						status=rs1.next();
						con.commit();
					}
					PreparedStatement ps7=con.prepareStatement("insert into coavail_jsp_rev select * from coavail_jsp where emp_code = ?");		
					ps7.setString(1,userid);					
					rs1=ps7.executeQuery();
					status=rs1.next();
					con.commit();
						
					PreparedStatement pscoavupd=con.prepareStatement("delete from coavail_jsp_rev where emp_code = ? and to_char(avail_date,'yyyy-mm')='"+mon+"'");		
					pscoavupd.setString(1,userid);					
					rs1=pscoavupd.executeQuery();
					status=rs1.next();
					con.commit();
					
					PreparedStatement ps35=con.prepareStatement("Select count(*) from lrmonth_jsp_temp where emp_code = ? and type_leave='CL'");		
					ps35.setString(1,userid);				
					rs=ps35.executeQuery();
					status=rs.next();
					q=rs.getInt(1);
					System.out.println("Value of q in leaveentrycheck is "+q+"");
					if(q>0)
					{
						PreparedStatement pstcl=con.prepareStatement("Select sum(leave_days) from lrmonth_jsp_temp where emp_code = ? and type_leave='CL'");		
						pstcl.setString(1,userid);				
						rs=pstcl.executeQuery();
						status=rs.next();
						double cldays=rs.getDouble(1);
						System.out.println("Value of cldays in leaveentrycheck is "+cldays+"");
						PreparedStatement psclupd=con.prepareStatement("update cl_rh_mast_jsp_s set cl_bal=cl_bal+"+cldays+" where emp_code = ? and cl_rh='CL'");		
					    psclupd.setString(1,userid);				    
					    rs1=psclupd.executeQuery();
					    status=rs1.next();
					    con.commit();
					}
					PreparedStatement ps36=con.prepareStatement("Select count(*) from lrmonth_jsp_temp where emp_code = ? and type_leave='RH'");		
					ps36.setString(1,userid);				
					rs=ps36.executeQuery();
					status=rs.next();
					r=rs.getInt(1);
					System.out.println("Value of r in leaveentrycheck is "+r+"");
					if(r>0)
					{
						PreparedStatement pstrh=con.prepareStatement("Select sum(leave_days) from lrmonth_jsp_temp where emp_code = ? and type_leave='RH'");		
						pstrh.setString(1,userid);				
						rs=pstrh.executeQuery();
						status=rs.next();
						int rhdays=rs.getInt(1);
						System.out.println("Value of rhdays in leaveentrycheck is "+rhdays+"");		    
						PreparedStatement psrhupd=con.prepareStatement("update cl_rh_mast_jsp_s set cl_bal=cl_bal+"+rhdays+" where emp_code = ? and cl_rh='RH'");		
						psrhupd.setString(1,userid);				
						rs1=psrhupd.executeQuery();
						status=rs1.next();				    				    
						con.commit();
					}
									    					
				}				
		  }
			
			status=true;
		}	
		//System.out.println("Here it is");
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return status;
}
}


