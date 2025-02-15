package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.Flight;
import com.otz.bean.User;
import com.otz.dao.AdminDao;
import com.otz.dao.FlightDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/FlightServlet")
public class FlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String event =	request.getParameter("event");
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		if(event.equals("addFlight")) {
			String fName=request.getParameter("fName");
			String fNo=request.getParameter("fNo");
			int totalSeats=Integer.parseInt(request.getParameter("totalSeats"));
			
			Flight flight=new Flight();
			flight.setFName(fName);
			flight.setFNo(fNo);
			flight.setTotalSeats(totalSeats);
			
			FlightDao flightdao=new FlightDao();
			int status=flightdao.addFlight(flight);
			if(status>0) {
				pw.print("done");
			}else {
				pw.print("failed");
			}
		}else if(event.equals("viewFlight")) {
			FlightDao flightdao=new FlightDao();
			List<Flight> list=flightdao.viewFlight();
			
			GsonBuilder gsonBuilder=new GsonBuilder();
			Gson gson=gsonBuilder.create();
			String JSONObject=gson.toJson(list);
			pw.print(JSONObject);
		}else if(event.equals("deactiveFlight")) {
			int fId=Integer.parseInt(request.getParameter("fId"));
			FlightDao flightdao=new FlightDao();
			int status=flightdao.deactiveFlight(fId);
			if(status>0) {
				pw.print("done");
			}else {
				pw.print("failed");
			}
			
		}else if(event.equals("getFlightById")){
			int fId=Integer.parseInt(request.getParameter("fId"));
			FlightDao flightdao=new FlightDao();
			Flight flight =flightdao.getFlightById(fId);
		
			GsonBuilder gsonBuilder=new GsonBuilder();
			Gson gson=gsonBuilder.create();
			String JSONObject=gson.toJson(flight);
			pw.print(JSONObject);
		}else if(event.equals("updateFlight")) {
			String fName=request.getParameter("fName");
			String fNo=request.getParameter("fNo");
			int totalSeats=Integer.parseInt(request.getParameter("totalSeats"));
			String status=request.getParameter("status");
			String fredgdate=request.getParameter("fredgdate");
			int fId=Integer.parseInt(request.getParameter("fId"));

			
			Flight flight=new Flight();
			flight.setFName(fName);
			flight.setFNo(fNo);
			flight.setTotalSeats(totalSeats);
			flight.setStatus(status);
			flight.setFredgdate(fredgdate);
			flight.setFId(fId);
			
			FlightDao flightdao=new FlightDao();
			int status1=flightdao.updateFlight(flight);
			if(status1>0) {
				pw.print("done");
			}else {
				pw.print("failed");
			}
		}
	}

}
