package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.Booking;
import com.otz.util.DbConnection;

public class BookingDao {

	public int bookFlight(Booking booking) {
		int bookId=0;
		try {
			Connection con=DbConnection.getCon();
			String query="insert into bookflight( members, unitPrice, totalPrice, date, cardNo, cardName, cvv, expDate, fId, scldId, uId,bClass)values(?,?,?,now(),?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, booking.getMembers());
			ps.setInt(2, booking.getUnitPrice());
			ps.setInt(3, booking.getTotalPrice());
			ps.setString(4 ,booking.getCardNo());
			ps.setString(5 ,booking.getCardName());
			ps.setString(6 ,booking.getCvv());
			ps.setString(7 ,booking.getExpDate());
			ps.setInt(8 ,booking.getFId());
			ps.setInt(9,booking.getScldId());
			ps.setInt(10, booking.getUId());
			ps.setString(11, booking.getBClass());
			ps.executeUpdate();
			ResultSet rs=ps.getGeneratedKeys();
			while(rs.next()) {
			 bookId=rs.getInt(1);
			}
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bookId;
	}

	public Booking getScdlFlightBybookId(int bookId) {
	    Booking booking = new Booking();
	    try {
	        Connection con = DbConnection.getCon();
	        String query = "SELECT b.bookId, u.uName, s.departure, s.fsource, s.destination, f.fName, f.fNo FROM bookflight b INNER JOIN ScdlFlight s ON b.scldId = s.scdlId INNER JOIN Flight f ON s.fId = f.fId INNER JOIN User u ON b.uId = u.uId WHERE b.bookId = ?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, bookId);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            
	            booking.setBookId(rs.getInt(1)); 
	            booking.setUName(rs.getString(2));
	            booking.setDeparture(rs.getObject(3, LocalDateTime.class));
	            booking.setSource(rs.getString(4)); 
	            booking.setDestination(rs.getString(5));
	            booking.setFName(rs.getString(6));
	            booking.setFNo( rs.getString(7));
	        }
	        rs.close();
	        ps.close();
	        con.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return booking;
	}

	public List<Booking> getAllBookingList(int uId) {
		List<Booking> list=new ArrayList<>();
		    try {
		        Connection con = DbConnection.getCon();
		        String query = "SELECT b.bookId ,b.totalPrice,b.bclass,b.date,b.members,  s.departure,s.arrival ,s.fsource, s.destination, f.fName, f.fNo FROM bookflight b INNER JOIN ScdlFlight s ON b.scldId = s.scdlId INNER JOIN Flight f ON s.fId = f.fId   WHERE b.uId = ?";
		        PreparedStatement ps = con.prepareStatement(query);
		        ps.setInt(1, uId);
		        ResultSet rs = ps.executeQuery();
		        while(rs.next()) {
		            Booking booking = new Booking();
		            booking.setBookId(rs.getInt(1)); 
		            booking.setTotalPrice(rs.getInt(2));
		            booking.setBClass(rs.getString(3));
		            booking.setDate(rs.getString(4));
		            booking.setMembers(rs.getInt(5));
		            booking.setDeparture(rs.getObject(6, LocalDateTime.class));
		            booking.setArrival(rs.getObject(7, LocalDateTime.class));
		            booking.setSource(rs.getString(8)); 
		            booking.setDestination(rs.getString(9));
		            booking.setFName(rs.getString(10));
		            booking.setFNo( rs.getString(11));
		            list.add(booking);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return list;
	}

	public int getTotalSeat(int scdlId) {
		int totalSeat=0;
		try {
			Connection con = DbConnection.getCon();
	        String query ="select seatAvl from ScdlFlight where scdlId=?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, scdlId);
	        ResultSet rs = ps.executeQuery();
	        while(rs.next()) {
	        	totalSeat=rs.getInt(1);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalSeat;
	}

	
	public void bookFlightfinalSeatUpdate(int finalseat, int scdlId) {
		try {
			Connection con = DbConnection.getCon();
	        String query ="Update ScdlFlight set seatAvl=? where scdlId=?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, finalseat);
	        ps.setInt(2, scdlId);
	        ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}


