package com.controllers;
import java.sql.*;
public class Database {
	private String hostName = "jdbc:mysql://localhost:3306/bus_ticket_booking_system?autoReconnect=true&useSSL=false";
	private String userName = "root";
	private String userPassword = "1234";
	public Statement statement;
	public Connection con;
	public Database() {
		this.con = null;
		this.statement = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.con = DriverManager.getConnection(hostName,userName,userPassword);
			this.statement = this.con.createStatement();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
