<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,com.digitalbd.*,AllLayout.*" %>
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

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="css/assets/owl.carousel.min.css"/>
    <link rel="stylesheet" href="css/assets/owl.theme.default.css"/>
    <link rel="stylesheet" href="css/main.css"/>
  </head>
  <body>
	<div class="ticket_print_section html-content">
		<div class="rs_shadow single_ticket" style="background-image: url('images/ticket_bg.jpg');">
			<div class="ticket_header">
				<h2>Tamil Nadu Bus Ticket</h2>
			</div>
			<div class="ticket_inner" style="display: flex;">
				<div class="customer_part">
					<h4>
						<strong>Name of passenger</strong>
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
	<div style="display: flex; justify-content: center; margin: auto; margin-top: 10px">
		<button style="border: none; padding: 10px; font-weight: bold; margin-right: 20px; cursor: pointer" class="print-btn">Download</button>
		<button style="border: none; padding: 10px; font-weight: bold; cursor: pointer" class="back-home">Home</button>
	</div>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
	<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
	<script>
		const element = document.getElementsByClassName('print-btn');
		const homeElement = document.getElementsByClassName('back-home');
		element[0].addEventListener('click', CreatePDFfromHTML);
		homeElement[0].addEventListener('click', home);
		console.log(element[0],home[0])
		function home() {
			window.location.replace("http://localhost:8080/Bus_Ticket_Booking_System/Dashboard.jsp");
		}
		function CreatePDFfromHTML() {
		    var HTML_Width = $(".html-content").width();
		    var HTML_Height = $(".html-content").height();
		    var top_left_margin = 15;
		    var PDF_Width = HTML_Width + (top_left_margin * 2);
		    var PDF_Height = (PDF_Width * 1.5) + (top_left_margin * 2);
		    var canvas_image_width = HTML_Width;
		    var canvas_image_height = HTML_Height;
	
		    var totalPDFPages = Math.ceil(HTML_Height / PDF_Height) - 1;
	
		    html2canvas($(".html-content")[0]).then(function (canvas) {
		        var imgData = canvas.toDataURL("image/jpeg", 1.0);
		        var pdf = new jsPDF('p', 'pt', [PDF_Width, PDF_Height]);
		        pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin, canvas_image_width, canvas_image_height);
		        for (var i = 1; i <= totalPDFPages; i++) { 
		            pdf.addPage(PDF_Width, PDF_Height);
		            pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height*i)+(top_left_margin*4),canvas_image_width,canvas_image_height);
		        }
		        pdf.save("ticket.pdf");
		    });
		}
	</script>

</body>
</html>