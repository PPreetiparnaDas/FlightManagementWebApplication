package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.User;
import com.otz.dao.AdminDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String event =	request.getParameter("event");
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		if(event.equals("addAdmin")) {
			String uName=request.getParameter("uName");
			String uEmail=request.getParameter("uEmail");
			String uPass=request.getParameter("uPass");
			String uPhone=request.getParameter("uPhone");
			String uAdd=request.getParameter("uAdd");
			
			User user=new User();
			user.setuName(uName);
			user.setuEmail(uEmail);
			user.setuPass(uPass);
			user.setuPhone(uPhone);
			user.setuAdd(uAdd);
			
			AdminDao ad=new AdminDao();
			int status=ad.addAdmin(user);
			if(status>0) {
				pw.print("done");
			}else {
				pw.print("failed");
			}
		}else if(event.equals("viewAdmin")) {
			AdminDao ad=new AdminDao();
			List<User> li=ad.viewAdmin();
			
			GsonBuilder gsonBuilder=new GsonBuilder();
			Gson gson=gsonBuilder.create();
			String JSONObject=gson.toJson(li);
			pw.print(JSONObject);
		}else if(event.equals("deactiveAdmin")) {
			int uId=Integer.parseInt(request.getParameter("uId"));
			AdminDao ad=new AdminDao();
			int status=ad.deactiveAdmin(uId);
			if(status>0) {
				pw.print("done");
			}else {
				pw.print("failed");
			}
			
		}else if(event.equals("getAdminById")){
			int uId=Integer.parseInt(request.getParameter("uId"));
			AdminDao ed=new AdminDao();
			User u=ed.getAdminById(uId);
		
			GsonBuilder gsonBuilder=new GsonBuilder();
			Gson gson=gsonBuilder.create();
			String JSONObject=gson.toJson(u);
			pw.print(JSONObject);
		}else if(event.equals("updateAdmin")) {
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
			AdminDao ed=new AdminDao();
			int res=ed.updateAdmin(u);
			if(res>0) {
				pw.print("done");
			}else {
				pw.print("failed");
			}
		}	
	}
}
