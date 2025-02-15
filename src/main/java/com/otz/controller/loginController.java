package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.otz.bean.User;
import com.otz.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/loginController")
public class loginController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");

		//we receive  Email and password
		String uEmail=request.getParameter("username").trim();
		String uPass=request.getParameter("upass").trim();
		//check the email and password exist or not 
		UserDao ed=new UserDao();
		int status=ed.checkUserExits(uEmail,uPass);
		//if that email and password is matched
		
		if(status>0) {
			User user=ed.getUserByEmailAndPassword(uEmail, uPass);
			//if the condition is true then we will fetch the user details 
			String uName=user.getuName();
			int uId=user.getuId();
			int roleId=user.getRoleId();
			String status1=user.getStatus().trim();
			HttpSession session = request.getSession(true); 
			//check the user active or not
			if(status1.equals("active")&& roleId==1) {
				//if that user is active then we set uId and uName  in the session
				session.setAttribute("uId", uId);
				session.setAttribute("uName", uName);
			    session.setMaxInactiveInterval(900);
				out.print("adminSuccessfull");
			}else if(status1.equals("active")&& roleId==2) {
				//if that user is active then we set uId and uName  in the session
				session.setAttribute("uId", uId);
				session.setAttribute("uName", uName);
				session.setMaxInactiveInterval(900);
				out.print("UserSuccessfull");
			}else if(status1.equals("inactive")) {
				out.print("usernotactive");
			}
		}else {
			//else we send invalid credential
			out.print("invalidCredentials");
		}
	}
}

