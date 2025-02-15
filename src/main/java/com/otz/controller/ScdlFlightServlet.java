package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.ScdlFlight;
import com.otz.dao.ScdlFlightDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ScdlFlightServlet")
public class ScdlFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String event =	request.getParameter("event");
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		if(event.equals("addSchedule")) {
			int fId=Integer.parseInt(request.getParameter("fName"));
			String scdlDate=request.getParameter("scdlDate");
			String source=request.getParameter("source");
			String destination=request.getParameter("destination");
			int seatAvl=Integer.parseInt(request.getParameter("seatAvl"));
			double ticketPrice=Double.parseDouble(request.getParameter("ticketPrice"));
			double travelKm=Double.parseDouble(request.getParameter("travelKm"));

			String arrival=request.getParameter("arrival");
			String deprature=request.getParameter("departure");

			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
			// Parse the strings to LocalDateTime
			LocalDateTime ari = LocalDateTime.parse(arrival, formatter);

			LocalDateTime dep= LocalDateTime.parse(deprature, formatter);
			// Calculate the travel time in hours
			long hours = Duration.between(dep, ari).toHours();
			// Convert hours to String
			String travelTimeInHours = String.valueOf(hours);

			ScdlFlight scdlflight=new ScdlFlight();
			scdlflight.setDestination(destination);
			scdlflight.setFId(fId);
			scdlflight.setScdlDate(scdlDate);
			scdlflight.setSeatAvl(seatAvl);
			scdlflight.setSource(source);
			scdlflight.setTicketPrice(ticketPrice);
			scdlflight.setTravelKm(travelKm);
			scdlflight.setTravelTime(travelTimeInHours);
			scdlflight.setArrival(ari);
			scdlflight.setDeparture(dep);
			ScdlFlightDao sd=new ScdlFlightDao();
			int status=sd.flightScheduled(scdlflight);
			if(status>0) {
				out.print("done");
			}else {
				out.print("false");
			}
		}else if(event.equals("viewScld")) {
			ScdlFlightDao sd = new ScdlFlightDao();
			List<ScdlFlight> list = sd.viewScdlFlight();
			GsonBuilder gsonBuilder = new GsonBuilder();
			gsonBuilder.registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter());
			Gson gson = gsonBuilder.create();
			String jsonResponse = gson.toJson(list);
			out.print(jsonResponse);

		}else if(event.equals("viewScldCust")) {
			ScdlFlightDao sd = new ScdlFlightDao();
			List<ScdlFlight> list = sd.viewScdlFlightForCustomer();
			GsonBuilder gsonBuilder = new GsonBuilder();
			gsonBuilder.registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter());
			Gson gson = gsonBuilder.create();
			String jsonResponse = gson.toJson(list);
			out.print(jsonResponse);
		}else if(event.equals("deactiveScdlFlight")) {
			int scdlId=Integer.parseInt(request.getParameter("scdlId"));
			ScdlFlightDao sd=new ScdlFlightDao();
			int status=sd.deactiveScdlFlight(scdlId);
			if(status>0) {
				out.print("done");
			}else {
				out.print("failed");
			}
		}else if(event.equals("getScdlFlightById")){
			int scdlId=Integer.parseInt(request.getParameter("scdlId"));
			ScdlFlightDao sd=new ScdlFlightDao();
			ScdlFlight scdlflight=sd.getScdlFlightById(scdlId);
			GsonBuilder gsonBuilder = new GsonBuilder();
			gsonBuilder.registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter());
			Gson gson = gsonBuilder.create();
			String jsonResponse = gson.toJson(scdlflight);
			out.print(jsonResponse);
		}else if(event.equals("updateFlightScdl")) {
			int scdlId=Integer.parseInt(request.getParameter("scdlId"));
			int fId=Integer.parseInt(request.getParameter("fName"));
			String scdlDate=request.getParameter("scdlDate");
			String source=request.getParameter("source");
			String destination=request.getParameter("destination");
			int seatAvl=Integer.parseInt(request.getParameter("seatAvl"));
			double ticketPrice=Double.parseDouble(request.getParameter("ticketPrice"));
			String travelTime=request.getParameter("travelTime");
			double travelKm=Double.parseDouble(request.getParameter("travelKm"));
			String status=request.getParameter("status");

			ScdlFlight scdlflight=new ScdlFlight();
			scdlflight.setScdlId(scdlId);
			scdlflight.setDestination(destination);
			scdlflight.setFId(fId);
			scdlflight.setScdlDate(scdlDate);
			scdlflight.setSeatAvl(seatAvl);
			scdlflight.setSource(source);
			scdlflight.setTicketPrice(ticketPrice);
			scdlflight.setTravelKm(travelKm);
			scdlflight.setTravelTime(travelTime);
			scdlflight.setStatus(status);
			ScdlFlightDao sd=new ScdlFlightDao();
			int status1=sd.updateflightScheduled(scdlflight);
			if(status1>0) {
				out.print("done");
			}else {
				out.print("false");
			}
		}else if(event.equals("searchFlight")) {
			String source=request.getParameter("source");
			String destination=request.getParameter("destination");
			String scdlDate=request.getParameter("scdlDate");

			ScdlFlightDao sd=new ScdlFlightDao();
			List<ScdlFlight> list = sd.searchScdlFlight(source,destination,scdlDate);
			GsonBuilder gsonBuilder = new GsonBuilder();
			gsonBuilder.registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter());
			Gson gson = gsonBuilder.create();
			String jsonResponse = gson.toJson(list);
			out.print(jsonResponse);

		}
	}

}
