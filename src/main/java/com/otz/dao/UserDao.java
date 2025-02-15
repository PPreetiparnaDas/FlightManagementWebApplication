package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.User;
import com.otz.util.DbConnection;
public class UserDao {
	public  int saveUser(User u) {
		int status=0;
		try {
			Connection con=DbConnection.getCon();
			String query="insert into user(uName,uEmail,uPass,uAdd,uPhone,redgDate,roleId)values(?,?,?,?,?,now(),?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, u.getuName());
			ps.setString(2, u.getuEmail());
			ps.setString(3, u.getuPass());
			ps.setString(4, u.getuAdd());
			ps.setString(5, u.getuPhone());
			ps.setInt(6, 2);
			status=ps.executeUpdate();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public List<User> viewUser(){
		List<User> listu=new ArrayList<User>();
		try {
			Connection con=DbConnection.getCon();
			String Query="select uId,uName,uEmail,uPass,uAdd,uPhone,redgDate,status from user where roleId=2";
			PreparedStatement ps=con.prepareStatement(Query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				User u=new User();
				u.setuId(rs.getInt(1));
				u.setuName(rs.getString(2));
				u.setuEmail(rs.getString(3));
				u.setuPass(rs.getString(4));
				u.setuAdd(rs.getString(5));
				u.setuPhone(rs.getString(6));
				u.setRedgDate(rs.getString(7));
				u.setStatus(rs.getString(8));
				listu.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listu;
	}
	public int deactivateCustomer(int uId) {
		int status=0;
		try {
			Connection con=DbConnection.getCon();
			String query="update user  set status='inactive' where uId=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, uId);
			status=ps.executeUpdate();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
		public User getCustomerById(int uId) {
			User u=new User();;
			try {
				Connection con=DbConnection.getCon();
				String Query="select uid,uName,uEmail,uPass,uAdd,uPhone,status from user where roleId=2 and uId = ?";
				PreparedStatement ps=con.prepareStatement(Query);
				ps.setInt(1, uId);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					u.setuId(rs.getInt(1));
					u.setuName(rs.getString(2));
					u.setuEmail(rs.getString(3));
					u.setuPass(rs.getString(4));
					u.setuAdd(rs.getString(5));
					u.setuPhone(rs.getString(6));
					u.setStatus(rs.getString(7));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return u;
	}
		public int updateUser(User u) {
			int status=0;
			try {
				Connection con=DbConnection.getCon();
				String query="UPDATE user SET uName = ?, uEmail = ?, uPass = ?, uAdd = ?, uPhone = ?, status = ? WHERE roleId = 2 AND uId = ?";
				PreparedStatement ps=con.prepareStatement(query);
				
				ps.setString(1, u.getuName());
				ps.setString(2, u.getuEmail());
				ps.setString(3, u.getuPass());
				ps.setString(4, u.getuAdd());
				ps.setString(5, u.getuPhone());
				ps.setString(6, u.getStatus());
				ps.setInt(7, u.getuId());
				status=ps.executeUpdate();
				ps.close();
				con.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return status;
		}
		public int checkUserExits(String uEmail, String uPass) {
			int status=0;
			try {
				Connection con=DbConnection.getCon();
				String query="SELECT count(*) FROM flightbooking.user WHERE uemail = ? AND upass = ?";
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, uEmail);
				ps.setString(2, uPass);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
				status=	rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return status;
		}
		public User getUserByEmailAndPassword(String uEmail, String uPass) {
			User u=new User();;
			try {
				Connection con=DbConnection.getCon();
				String Query="select uid,uName,uEmail,uPass,uAdd,uPhone,status,roleId from user where uemail = ? AND upass = ?";
				PreparedStatement ps=con.prepareStatement(Query);
				ps.setString(1, uEmail);
				ps.setString(2, uPass);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					u.setuId(rs.getInt(1));
					u.setuName(rs.getString(2));
					u.setuEmail(rs.getString(3));
					u.setuPass(rs.getString(4));
					u.setuAdd(rs.getString(5));
					u.setuPhone(rs.getString(6));
					u.setStatus(rs.getString(7));
					u.setRoleId(rs.getInt(8));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return u;
		}
		public int editUser(User u) {
			int status=0;
			try {
				Connection con=DbConnection.getCon();
				String query="UPDATE user SET uName = ?, uEmail = ?, uAdd = ?, uPhone = ? WHERE roleId = 2 AND uId = ?";
				PreparedStatement ps=con.prepareStatement(query);
				
				ps.setString(1, u.getuName());
				ps.setString(2, u.getuEmail());
				ps.setString(3, u.getuAdd());
				ps.setString(4, u.getuPhone());
				ps.setInt(5, u.getuId());
				status=ps.executeUpdate();
				ps.close();
				con.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return status;
		}
		public void updatePassword(int uId, String cPass) {
			try {
				Connection con=DbConnection.getCon();
				String query="UPDATE user SET  uPass = ?  WHERE roleId = 2 AND uId = ?";
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, cPass);
				ps.setInt(2, uId);
				ps.executeUpdate();
				ps.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	
	
	
}
