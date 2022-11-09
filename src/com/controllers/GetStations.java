package com.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.model.Station;

/**
 * Servlet implementation class GetStations
 */
@WebServlet("/GetStations")
public class GetStations extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Stations stat = new Stations();
		List<Station> stations = stat.getAll();
		JSONArray jarr = new JSONArray();
		for(Station s:stations) {
			JSONObject jobj = new JSONObject();
			try {
				jobj.put("id", s.id);
				jobj.put("name", s.name);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			jarr.put(jobj);
		}
		response.setContentType("application/json");
		response.setStatus(200);
		response.getWriter().println(jarr.toString());
	}

	

}
