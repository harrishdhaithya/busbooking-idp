<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.controllers.Helper,com.controllers.*,java.sql.ResultSet,com.model.*" %>
<%@ include file="header.jsp" %>
<%
String userId = null;
if(session.getAttribute("user_id") != null){
	userId = (String) session.getAttribute("user_id");
}
User user = new User(userId);
%>
<div class="dashboard">
	<div class="box personal_info">
		<h2 class="box_title">Personal Information</h2>
		<table class="table table-bordered">
			<tr>
				<td><strong>Full Name</strong></td>
				<td><%= user.name %></td>
			</tr>
			<tr>
				<td><strong>Email Address</strong></td>
				<td><%= user.email %></td>
			</tr>
			<tr>
				<td><strong>Cell Phone Number</strong></td>
				<td><%= user.phone %></td>
			</tr>
			<tr>
				<td><strong>Address</strong></td>
				<td><%= user.address %></td>
			</tr>
		</table>
	</div>
	<div class="box successfully_purschase_ticket">
		<h2 class="box_title">Successful Purchase Information</h2>
		<table class="table table-bordered">
			<tr>
				<td>Bus Name</td>
				<td>Coach/Class</td>
				<td>Purchase Date</td>
				<td>Journey Date</td>
				<td>Station From</td>
				<td>Station To</td>
				<td>Total Seat</td>
			</tr>
			<%
			Booking booking = new Booking();
			// Passenger
			if(user.rule.equals("passenger")) {
				ResultSet bookedTicket = booking.FindByUser(user.id);
				while(bookedTicket.next()){
					Destination tempDestination = new Destination(bookedTicket.getString("destination_id"));
					bus trnTemp = new bus(tempDestination.bus_id);
					Station stationFromTemp = new Stations().getStation(tempDestination.station_from);
					Station stationToTemp = new Stations().getStation(tempDestination.station_to);
					%>
					<tr>
						<td><%= trnTemp.name %></td>
						<td><%= trnTemp.type %></td>
						<td><%= bookedTicket.getString("booking_date") %></td>
						<td><%= bookedTicket.getString("journey_date") %></td>
						<td><%= stationFromTemp.name %></td>
						<td><%= stationToTemp.name %></td>
						<td><%= bookedTicket.getString("number_of_seat") %></td>
						
					</tr>
					<%
				}	
			} else {
				// Admin
				ResultSet bookedTicketAdmin = booking.FindAllBookings();
				while(bookedTicketAdmin.next()){
					Destination tempDestination = new Destination(bookedTicketAdmin.getString("destination_id"));
					bus trnTemp = new bus(tempDestination.bus_id);
					Station stationFromTemp = new Stations().getStation(tempDestination.station_from);
					Station stationToTemp = new Stations().getStation(tempDestination.station_to);
					%>
					<tr>
						<td><%= trnTemp.name %></td>
						<td><%= trnTemp.type %></td>
						<td><%= bookedTicketAdmin.getString("booking_date") %></td>
						<td><%= bookedTicketAdmin.getString("journey_date") %></td>
						<td><%= stationFromTemp.name %></td>
						<td><%= stationToTemp.name %></td>
						<td><%= bookedTicketAdmin.getString("number_of_seat") %></td>
						
					</tr>
					<%
				}	
			}
			%>
			
		</table>
	</div>
</div>
<%@ include file="footer.jsp" %>