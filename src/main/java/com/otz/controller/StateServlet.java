package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.Flight;
import com.otz.bean.State;
import com.otz.dao.FlightDao;
import com.otz.dao.StateDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StateServlet")
public class StateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String event =	request.getParameter("event");
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		if(event.equals("addState")) {
			String sName=request.getParameter("sName");

			State state=new State();
			state.setSName(sName);

			StateDao sataedao=new StateDao();
			int status=sataedao.addState(state);
			if(status>0) {
				pw.print("done");
			}else {
				pw.print("failed");
			}
		}else if(event.equals("viewState")) {
			StateDao sataedao=new StateDao();
			List<State> list=sataedao.viewState();

			GsonBuilder gsonBuilder=new GsonBuilder();
			Gson gson=gsonBuilder.create();
			String JSONObject=gson.toJson(list);
			pw.print(JSONObject);
		}else if(event.equals("DeleteState")) {
			int sId=Integer.parseInt(request.getParameter("sId"));
			StateDao sataedao=new StateDao();
			int status=sataedao.deleteState(sId);
			if(status>0) {
				pw.print("done");
			}else {
				pw.print("failed");
			}

		}else if(event.equals("getStateById")){
			int sId=Integer.parseInt(request.getParameter("sId"));
			StateDao sataedao=new StateDao();
			
			State state =sataedao.getStateById(sId);

			GsonBuilder gsonBuilder=new GsonBuilder();
			Gson gson=gsonBuilder.create();
			String JSONObject=gson.toJson(state);
			pw.print(JSONObject);
		}else if(event.equals("updateState")) {
			String sName=request.getParameter("sName");
			int sId=Integer.parseInt(request.getParameter("sId"));


			State state=new State();
			state.setSName(sName);
			state.setSId(sId);
			StateDao sataedao=new StateDao();
			int status1=sataedao.updateState(state);
			if(status1>0) {
				pw.print("done");
			}else {
				pw.print("failed");
			}
		}
	}
}


