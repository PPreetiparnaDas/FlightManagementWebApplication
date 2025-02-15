package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.Flight;
import com.otz.bean.User;
import com.otz.util.DbConnection;

public class FlightDao {

	public int addFlight(Flight flight) {
		int status=0;
		try {
			Connection con=DbConnection.getCon();
			String query="insert into flight(fName,fNo,totalSeats,fredgdate) values(?,?,?,now())";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, flight.getFName());
			ps.setString(2, flight.getFNo());
			ps.setInt(3, flight.getTotalSeats());
			status=ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		return status;
	}

	public List<Flight> viewFlight() {
		List<Flight> list=new ArrayList<Flight>();
		try {
			Connection con=DbConnection.getCon();
			String query="select fId,fName,fNo,totalSeats,fredgdate,status from flight";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Flight flight=new Flight();
				flight.setFId(rs.getInt(1));
				flight.setFName(rs.getString(2));
				flight.setFNo(rs.getString(3));
				flight.setTotalSeats(rs.getInt(4));
				flight.setFredgdate(rs.getString(5));
				flight.setStatus(rs.getString(6));
				
				list.add(flight);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int deactiveFlight(int fId) {
		int status=0;
		try {
			Connection con=DbConnection.getCon();
			String query="update flight  set status='inactive' where fId=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, fId);
			status=ps.executeUpdate();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public Flight getFlightById(int fId) {
		Flight flight=new Flight();
		try {
			Connection con=DbConnection.getCon();
			String query="select fId,fName,fNo,totalSeats,fredgdate,status from flight where fId=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, fId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				flight.setFId(rs.getInt(1));
				flight.setFName(rs.getString(2));
				flight.setFNo(rs.getString(3));
				flight.setTotalSeats(rs.getInt(4));
				flight.setFredgdate(rs.getString(5));
				flight.setStatus(rs.getString(6));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flight;
	}

	public int updateFlight(Flight flight) {
		int status=0;
		try {
			Connection con=DbConnection.getCon();
			String query="UPDATE flight SET fName = ?, fNo = ?, totalSeats = ?, fredgdate = ?, status = ? WHERE  fId = ?";
			PreparedStatement ps=con.prepareStatement(query);
			
			ps.setString(1, flight.getFName());
			ps.setString(2, flight.getFNo());
			ps.setInt(3, flight.getTotalSeats());
			ps.setString(4, flight.getFredgdate());
			ps.setString(5, flight.getStatus());
			ps.setInt(6, flight.getFId());
			
			status=ps.executeUpdate();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

}
