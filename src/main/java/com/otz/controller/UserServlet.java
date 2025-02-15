package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.User;
import com.otz.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String event=request.getParameter("event");
		PrintWriter out=response.getWriter();
		if(event.equals("addUser")) {
			String uName=request.getParameter("uName");
			String uEmail=request.getParameter("uEmail");
			String uPass=request.getParameter("uPass");
			String uAdd=request.getParameter("uAdd");
			String uPhone=request.getParameter("uPhone");

			User u=new User();
			u.setuName(uName);
			u.setuEmail(uEmail);
			u.setuPass(uPass);
			u.setuAdd(uAdd);
			u.setuPhone(uPhone);

			UserDao ed=new UserDao();
			int status=ed.saveUser(u);
			if(status>0) {
				out.print("done");
			}else {
				out.print("failed");
			}
		}else if(event.equals("viewCustomer")) {
			UserDao ed=new UserDao();
			List<User> list=ed.viewUser();

			GsonBuilder gsonBuilder=new GsonBuilder();
			Gson gson=gsonBuilder.create();
			String JSONObject=gson.toJson(list);
			out.print(JSONObject);
		}else if(event.equals("deactiveCustomer")) {
			int uId=Integer.parseInt(request.getParameter("uId"));

			UserDao ed=new UserDao();
			int status=ed.deactivateCustomer(uId);
			if(status>0) {
				out.print("done");
			}else {
				out.print("failed");
			}
		}else if(event.equals("getCustomerById")) {
			int uId=Integer.parseInt(request.getParameter("uId"));
			UserDao ed=new UserDao();
			User u=ed.getCustomerById(uId);

			GsonBuilder gsonBuilder=new GsonBuilder();
			Gson gson=gsonBuilder.create();
			String JSONObject=gson.toJson(u);
			out.print(JSONObject);
		}else if(event.equals("getCust")) {
			HttpSession session=request.getSession(true);
			int uId=(int) session.getAttribute("uId");
			UserDao ed=new UserDao();
			User u=ed.getCustomerById(uId);

			GsonBuilder gsonBuilder=new GsonBuilder();
			Gson gson=gsonBuilder.create();
			String JSONObject=gson.toJson(u);
			out.print(JSONObject);
		}else if(event.equals("updateCustomer")) {
			int uId=Integer.parseInt(request.getParameter("uId"));
			String uName=request.getParameter("uName");
			String uEmail=request.getParameter("uEmail");
			String uPass=request.getParameter("uPass");
			String uAdd=request.getParameter("uAdd");
			String uPhone=request.getParameter("uPhone");
			String status=request.getParameter("status");

			User u=new User();
			u.setuId(uId);
			u.setuName(uName);
			u.setuEmail(uEmail);
			u.setuPass(uPass);
			u.setuAdd(uAdd);
			u.setuPhone(uPhone);
			u.setStatus(status);
			UserDao ed=new UserDao();
			int res=ed.updateUser(u);
			if(res>0) {
				out.print("done");
			}else {
				out.print("failed");
			}
		}else if(event.equals("Edituser")) {
			HttpSession session=request.getSession(true);
			int uId=(int) session.getAttribute("uId");
			String uName=request.getParameter("FullName");
			String uEmail=request.getParameter("email");
			String uAdd=request.getParameter("address");
			String uPhone=request.getParameter("Phone");
		

			User u=new User();
			u.setuId(uId);
			u.setuName(uName);
			u.setuEmail(uEmail);
			u.setuAdd(uAdd);
			u.setuPhone(uPhone);
			UserDao ed=new UserDao();
			int res=ed.editUser(u);
			if(res>0) {
				out.print("done");
			}else {
				out.print("failed");
			}
		}else if(event.equals("changePassword")) {
			HttpSession session = request.getSession(true); 
			int uId=(int) session.getAttribute("uId");
			String oPass=request.getParameter("oPass");
			String nPass=request.getParameter("nPass");
			String cPass=request.getParameter("cPass");
			
			UserDao ed=new UserDao();
			User u=ed.getCustomerById(uId);
			String avlPass=u.getuPass();
			if(oPass.equals(avlPass)) {
				if (nPass.equals(cPass)) {
					ed.updatePassword(uId,cPass);
					out.print("updatedSuccessfully");
					
				} else {
					out.print("NPandCPnotMatch");
				}
			}else {
				out.print("wrongoldpassword");
			}
		}else if(event.equals("tempCloseAccount")) {
			HttpSession session = request.getSession(true); 
			int uId=(int) session.getAttribute("uId");
			String oPass=request.getParameter("password");
			UserDao ed=new UserDao();
			User u=ed.getCustomerById(uId);
			String avlPass=u.getuPass();
			if(oPass.equals(avlPass)) {
			     int status=ed.deactivateCustomer(uId);
				 if(status>0) {
					session.invalidate();
					out.print("done");
				 }
			}else {
				out.print("wrongoldpassword");
			}
		}	
	}
}

