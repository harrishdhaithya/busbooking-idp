<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.controllers.*,com.model.*" %>
<%@page import="java.time.LocalDateTime" %>

<%
	String userid = null;
	if(session.getAttribute("user_id") != null){
		userid = (String) session.getAttribute("user_id");
	}
	User userDetails = new User(userid);
	String dest = (String)session.getAttribute("destination");
	String totalseat = (String)session.getAttribute("totalSeat");
	String datetime = (String)session.getAttribute("date");
	Booking bookings = new Booking();
	Stations tempstation = new Stations();
	HashMap<String,String> tickdetails = bookings.Find(dest, datetime, totalseat);
	double totalamount = Double.parseDouble(tickdetails.get("fare")) * Double.parseDouble(totalseat);
	Station stationfrom = tempstation.getStation(tickdetails.get("from"));
	Station stationto = tempstation.getStation(tickdetails.get("to"));
%>
<style><%@include file="css/main.css"%></style>
<div class="ticket_print_section">
	<div class="rs_shadow single_ticket" style="background-image: url('images/ticket_bg.jpg');">
		<div class="ticket_header">
			<h2>Tamil Nadu Bus Ticket</h2>
		</div>
		<div class="ticket_inner" style="display: flex;">
			<div class="customer_part">
				<h4>
					<strong style="font-weight: bold">Name of passenger</strong>
					<%= userDetails.name %>
				</h4>

				<div class="ticket_col_1">
					<table>
						<tr>
							<td>
								<strong>Bus Name</strong>
								<span><%= tickdetails.get("bus_name") %></span>
								<strong>From</strong>
								<span><%= stationfrom.name %></span>
								<strong>To</strong>
								<span><%= stationto.name %></span>
							</td>
							<td class="wd_100px text_center">
								<strong>Bus No</strong>
								<%= tickdetails.get("bus_code")%>
							</td>
							<td class="wd_100px text_center">
								<strong>Journey Date</strong>
								<%= tickdetails.get("j_date") %>
							</td>
							<td class="wd_100px text_center">
								<strong>Time</strong>
								<%= tickdetails.get("time")%>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td>
								<strong>Class/Coach</strong>
								<span><%= tickdetails.get("bus_type") %></span>
							</td>
							<td  class="wd_100px text_center">
								<strong>Total Seats</strong>
								<%= totalseat %>
							</td>
							<td  class="text_center">
								<strong>Issue Date & Time</strong>
								<%=java.time.LocalDate.now() %>
							</td>
							<td  class="wd_100px text_center">
								<strong>Fare</strong>
								<%= (totalamount)+ " "+ Helper.Currency %>
							</td>
							<td width="90"  class="text_center">
								<img class="qr_code" src="images/qr.png" alt="">
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="company_part">
				<h4>
					<strong>Name of passenger</strong>
					<%= userDetails.name %>
				</h4>
				<strong>Bus Name</strong>
				<span><%= tickdetails.get("bus_name") %></span>
				<strong>Journey</strong>
				<span><%= stationfrom.name %> To <%= stationto.name %></span>
				<table>
					<tr>
						<td>
							<strong>Total Seats</strong>
							<%= totalseat %>
						</td>
						<td style="font-size: 12px;">
							<strong>Date</strong>
							<%= tickdetails.get("j_date") %>
						</td>
						<td>
							<strong>Time</strong>
							<%= tickdetails.get("time")%>
						</td>
					</tr>
					<tr>
						<td>
							<strong>Fare</strong>
							<%= (totalamount)+ " "+ Helper.Currency %>
						</td>
						<td>
							<strong>Issue Date</strong>
							<span  style="font-size: 12px"><%=java.time.LocalDate.now() %></span>
						</td>
						
						<td>
						</td>
					</tr>
				</table>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="ticet_footer">
			<span>Have a nice journey.</span>
		</div>
	</div>
</div>