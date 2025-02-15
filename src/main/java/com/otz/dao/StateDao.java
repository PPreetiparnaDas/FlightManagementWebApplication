package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.Flight;
import com.otz.bean.State;
import com.otz.util.DbConnection;

public class StateDao {

	public int addState(State state) {
		int status=0;
		try {
			Connection con=DbConnection.getCon();
			String query="INSERT INTO state (sName) VALUES (?);";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, state.getSName());
			
			status=ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		return status;
	}

	public List<State> viewState() {
		List<State> list=new ArrayList<State>();
		try {
			Connection con=DbConnection.getCon();
			String query="select sId,sName from state";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				State state=new State();
				state.setSId(rs.getInt(1));
				state.setSName(rs.getString(2));
				
				
				list.add(state);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int deleteState(int sId) {
		 int status = 0;
		    try {
		    	Connection con=DbConnection.getCon();
				String query="DELETE FROM state WHERE sId = ?;";
				PreparedStatement ps=con.prepareStatement(query);
		        ps.setInt(1, sId);
		        status = ps.executeUpdate();
		        ps.close();
		        con.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return status;
	}

	public State getStateById(int sId) {
		State state=new State();
		try {
			Connection con=DbConnection.getCon();
			String query="select sId,sName from state where sId=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, sId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				state.setSId(rs.getInt(1));
				state.setSName(rs.getString(2));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return state;
	}

	public int updateState(State state) {
		int status=0;
		try {
			Connection con=DbConnection.getCon();
			String query="UPDATE state SET sName = ? WHERE  sId = ?";
			PreparedStatement ps=con.prepareStatement(query);
			
			ps.setString(1, state.getSName());
			ps.setInt(2, state.getSId());
			
			status=ps.executeUpdate();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

}
