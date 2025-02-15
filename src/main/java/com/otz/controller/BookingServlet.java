package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.Booking;
import com.otz.dao.BookingDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String event =	request.getParameter("event");
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		if(event.equals("BookFlight")) {
			int members=Integer.parseInt(request.getParameter("adults"));
			int unitPrice=Integer.parseInt(request.getParameter("unitPrice"));
			int ticketPrice=members*unitPrice;
			String cardNumber=request.getParameter("cardNumber");
			String cardHolderName=request.getParameter("cardHolderName");
			String cvv=request.getParameter("cvv");
			String expiryDate=request.getParameter("expiryDate");
			int scdlId=Integer.parseInt(request.getParameter("scldId"));
			int fId=Integer.parseInt(request.getParameter("fId"));
			String bClass=request.getParameter("seatCategory");
			HttpSession session=request.getSession();
			 int uId=(int) session.getAttribute("uId");
			Booking booking =new Booking();
			booking.setMembers(members);
			booking.setUnitPrice(unitPrice);
			booking.setTotalPrice(ticketPrice);
			booking.setCardNo(cardNumber);
			booking.setCardName(cardHolderName);
			booking.setCvv(cvv);
			booking.setExpDate(expiryDate);
			booking.setScldId(scdlId);
			booking.setFId(fId);
			booking.setBClass(bClass);
			booking.setUId(uId);
			BookingDao bookingdao=new BookingDao();
			int bookId=bookingdao.bookFlight(booking);
			if(bookId>0) {
			int totalSeat=bookingdao.getTotalSeat(scdlId);
			int finalseat=totalSeat-members;
				if(totalSeat>0) {
					bookingdao.bookFlightfinalSeatUpdate(finalseat,scdlId);
					response.sendRedirect("ticket.jsp?bookId=" + bookId);
				  }
			}else {
				out.print("bookingfailed");
			}
		}else if(event.equals("getScdlFlightBybookId")) {
			int bookId=Integer.parseInt(request.getParameter("bookId"));
			BookingDao bk=new BookingDao();
			Booking booking=bk.getScdlFlightBybookId(bookId);
			
			GsonBuilder gsonBuilder = new GsonBuilder();
			gsonBuilder.registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter());
			Gson gson = gsonBuilder.create();
			String jsonResponse = gson.toJson(booking);
			out.print(jsonResponse);
		}else if(event.equals("bookinghistory")) {
			HttpSession session = request.getSession(true); 
			int uId=(int) session.getAttribute("uId");
			BookingDao bk=new BookingDao();
			 List<Booking> booking=bk.getAllBookingList(uId);
			GsonBuilder gsonBuilder = new GsonBuilder();
			gsonBuilder.registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter());
			Gson gson = gsonBuilder.create();
			String jsonResponse = gson.toJson(booking);
			out.print(jsonResponse);
		}
	}

}
