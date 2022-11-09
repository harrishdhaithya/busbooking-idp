package com.controllers;

import java.util.HashMap;

public class Helper {
	public static String baseUrl = "http://localhost:9090/Bus_Ticket_Booking_System/";
	public static String TestName="Harrish";
	public static String Currency = "Rs";
	public static HashMap<String,String> BusCoach(){
		HashMap<String,String> coach = new HashMap<String,String>();
		coach.put("Coach / Motor coach", "Coach / Motor coach");
		coach.put("Minicoach", "Minicoach");
		coach.put("Double-decker bus", "Double-decker bus");
		coach.put("Single-decker bus", "Single-decker bus");
		coach.put("Low-floor bus", "Low-floor bus");
		coach.put("Shuttle bus", "Shuttle bus");
		return coach;
	}
}
