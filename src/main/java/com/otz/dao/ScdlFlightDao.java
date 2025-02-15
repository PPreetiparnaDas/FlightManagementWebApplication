package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.ScdlFlight;
import com.otz.util.DbConnection;

public class ScdlFlightDao {

	public int flightScheduled(ScdlFlight scdlflight) {
		 LocalDateTime arrival = scdlflight.getArrival();
		 LocalDateTime departure = scdlflight.getDeparture();
		 // Convert LocalDateTime to Timestamp
		 Timestamp arrivalTimestamp = Timestamp.valueOf(arrival);
		 Timestamp departureTimestamp = Timestamp.valueOf(departure);
		 
		int status=0;
		try {
			Connection con=DbConnection.getCon();
			String query="insert into scdlflight(scdlDate,fsource,destination,seatAvl,ticketPrice,travelTime,travelKm,fId,arrival,departure)values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, scdlflight.getScdlDate());
			ps.setString(2, scdlflight.getSource());
			ps.setString(3, scdlflight.getDestination());
			ps.setInt(4, scdlflight.getSeatAvl());
			ps.setDouble(5, scdlflight.getTicketPrice());
			ps.setString(6, scdlflight.getTravelTime());
			ps.setDouble(7, scdlflight.getTravelKm());
			ps.setInt(8, scdlflight.getFId());
			ps.setTimestamp(9, arrivalTimestamp);
			ps.setTimestamp(10, departureTimestamp);
			status=ps.executeUpdate();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public List<ScdlFlight> viewScdlFlight() {
		List<ScdlFlight> list=new ArrayList<ScdlFlight>();
		try {
			Connection con=DbConnection.getCon();
			String query="select A.scdlId,A.scdlDate,A.fsource,A.destination,A.seatAvl,A.ticketPrice,A.travelTime,A.travelKm,A.status,A.arrival,A.departure,B.fId,B.fName,B.fNo from scdlflight as A INNER JOIN flight as B on A.fId=B.fId ";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ScdlFlight scdlflight=new ScdlFlight();
				scdlflight.setScdlId(rs.getInt(1));
				scdlflight.setScdlDate(rs.getString(2));
				scdlflight.setSource(rs.getString(3));
				scdlflight.setDestination(rs.getString(4));
				scdlflight.setSeatAvl(rs.getInt(5));
				scdlflight.setTicketPrice(rs.getDouble(6));
				scdlflight.setTravelTime(rs.getString(7));
				scdlflight.setTravelKm(rs.getDouble(8));
				scdlflight.setStatus(rs.getString(9));
				 // Handling null values for Timestamp fields
	            Timestamp arrivalTimestamp = rs.getTimestamp(10);
	            if (arrivalTimestamp != null) {
	                scdlflight.setArrival(arrivalTimestamp.toLocalDateTime());
	            }

	            Timestamp departureTimestamp = rs.getTimestamp(11);
	            if (departureTimestamp != null) {
	                scdlflight.setDeparture(departureTimestamp.toLocalDateTime());
	            }
				scdlflight.setFId(rs.getInt(12));
				scdlflight.setFName(rs.getString(13));
				scdlflight.setFNo(rs.getString(14));
				list.add(scdlflight);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<ScdlFlight> viewScdlFlightForCustomer() {
		List<ScdlFlight> list=new ArrayList<ScdlFlight>();
		try {
			Connection con=DbConnection.getCon();
			String query="select A.scdlId,A.scdlDate,A.fsource,A.destination,A.seatAvl,A.ticketPrice,A.travelTime,A.travelKm,A.status,A.arrival,A.departure,B.fId,B.fName,B.fNo from scdlflight as A INNER JOIN flight as B on A.fId=B.fId WHERE A.scdlDate >= CURRENT_DATE";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ScdlFlight scdlflight=new ScdlFlight();
				scdlflight.setScdlId(rs.getInt(1));
				scdlflight.setScdlDate(rs.getString(2));
				scdlflight.setSource(rs.getString(3));
				scdlflight.setDestination(rs.getString(4));
				scdlflight.setSeatAvl(rs.getInt(5));
				scdlflight.setTicketPrice(rs.getDouble(6));
				scdlflight.setTravelTime(rs.getString(7));
				scdlflight.setTravelKm(rs.getDouble(8));
				scdlflight.setStatus(rs.getString(9));
				 // Handling null values for Timestamp fields
	            Timestamp arrivalTimestamp = rs.getTimestamp(10);
	            if (arrivalTimestamp != null) {
	                scdlflight.setArrival(arrivalTimestamp.toLocalDateTime());
	            }

	            Timestamp departureTimestamp = rs.getTimestamp(11);
	            if (departureTimestamp != null) {
	                scdlflight.setDeparture(departureTimestamp.toLocalDateTime());
	            }
				scdlflight.setFId(rs.getInt(12));
				scdlflight.setFName(rs.getString(13));
				scdlflight.setFNo(rs.getString(14));
				list.add(scdlflight);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int deactiveScdlFlight(int scdlId) {
		int status=0;
		try {
			Connection con=DbConnection.getCon();
			String query="update scdlflight  set status='inactive' where scdlId=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, scdlId);
			status=ps.executeUpdate();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public ScdlFlight getScdlFlightById(int scdlId) {
		ScdlFlight scdlflight=new ScdlFlight();
		try {
			Connection con=DbConnection.getCon();
			String query="select A.scdlId,A.scdlDate,A.fsource,A.destination,A.seatAvl,A.ticketPrice,A.travelTime,A.travelKm,A.status,A.arrival,A.departure,B.fId,B.fName,B.fNo from scdlflight as A INNER JOIN flight as B on A.fId=B.fId where A.scdlid=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, scdlId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				scdlflight.setScdlId(rs.getInt(1));
				scdlflight.setScdlDate(rs.getString(2));
				scdlflight.setSource(rs.getString(3));
				scdlflight.setDestination(rs.getString(4));
				scdlflight.setSeatAvl(rs.getInt(5));
				scdlflight.setTicketPrice(rs.getDouble(6));
				scdlflight.setTravelTime(rs.getString(7));
				scdlflight.setTravelKm(rs.getDouble(8));
				scdlflight.setStatus(rs.getString(9));
				 // Handling null values for Timestamp fields
	            Timestamp arrivalTimestamp = rs.getTimestamp(10);
	            if (arrivalTimestamp != null) {
	                scdlflight.setArrival(arrivalTimestamp.toLocalDateTime());
	            }

	            Timestamp departureTimestamp = rs.getTimestamp(11);
	            if (departureTimestamp != null) {
	                scdlflight.setDeparture(departureTimestamp.toLocalDateTime());
	            }
				scdlflight.setFId(rs.getInt(12));
				scdlflight.setFName(rs.getString(13));
				scdlflight.setFNo(rs.getString(14));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return scdlflight;
	}

	public int updateflightScheduled(ScdlFlight scdlflight) {
		int status=0;
		try {
			Connection con=DbConnection.getCon();
			String query="UPDATE scdlflight SET fid = ?, scdldate = ?, fsource = ?, destination = ?, seatavl = ?, ticketprice = ?, traveltime = ?, travelkm = ? ,status=? WHERE scdlid = ?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, scdlflight.getFId());
			ps.setString(2, scdlflight.getScdlDate());
			ps.setString(3, scdlflight.getSource());
			ps.setString(4, scdlflight.getDestination());
			ps.setInt(5, scdlflight.getSeatAvl());
			ps.setDouble(6, scdlflight.getTicketPrice());
			ps.setString(7, scdlflight.getTravelTime());
			ps.setDouble(8, scdlflight.getTravelKm());
			ps.setString(9, scdlflight.getStatus());
			ps.setInt(10, scdlflight.getScdlId());
			
			status=ps.executeUpdate();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public List<ScdlFlight> searchScdlFlight(String source, String destination, String scdlDate) {
		List<ScdlFlight> list=new ArrayList<ScdlFlight>();
		try {
			Connection con=DbConnection.getCon();
			String query="select A.scdlId,A.scdlDate,A.fsource,A.destination,A.seatAvl,A.ticketPrice,A.travelTime,A.travelKm,A.status,A.arrival,A.departure,B.fId,B.fName,B.fNo from scdlflight as A INNER JOIN flight as B on A.fId=B.fId where A.fsource=? and A.destination=? and A.scdlDate=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, source);
			ps.setString(2, destination);
			ps.setString(3, scdlDate);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ScdlFlight scdlflight=new ScdlFlight();
				scdlflight.setScdlId(rs.getInt(1));
				scdlflight.setScdlDate(rs.getString(2));
				scdlflight.setSource(rs.getString(3));
				scdlflight.setDestination(rs.getString(4));
				scdlflight.setSeatAvl(rs.getInt(5));
				scdlflight.setTicketPrice(rs.getDouble(6));
				scdlflight.setTravelTime(rs.getString(7));
				scdlflight.setTravelKm(rs.getDouble(8));
				scdlflight.setStatus(rs.getString(9));
				 // Handling null values for Timestamp fields
	            Timestamp arrivalTimestamp = rs.getTimestamp(10);
	            if (arrivalTimestamp != null) {
	                scdlflight.setArrival(arrivalTimestamp.toLocalDateTime());
	            }

	            Timestamp departureTimestamp = rs.getTimestamp(11);
	            if (departureTimestamp != null) {
	                scdlflight.setDeparture(departureTimestamp.toLocalDateTime());
	            }
				scdlflight.setFId(rs.getInt(12));
				scdlflight.setFName(rs.getString(13));
				scdlflight.setFNo(rs.getString(14));
				list.add(scdlflight);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}


