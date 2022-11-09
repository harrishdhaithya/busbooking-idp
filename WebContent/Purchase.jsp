<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*,com.controllers.*,com.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	Stations stations = new Stations();
	ArrayList<Station> allStations = stations.getAll();
%>

<%@ include file="header.jsp" %>
<div class="signpage">
	<form class="register_form" style="max-width:400px;" action="<%= Helper.baseUrl %>TicketDisplay.jsp" method="post">
		<div class="rs_form_box">
			<h3 class="form_section_title">
				 PURCHASE TICKET
			</h3>
			<div class="form-group">
				<label>Station From :</label>
				<div id="from-div">
					<select class="form-control" name="from" id="from_where_select" onchange="handleFromList(event)">
					<%
					for(int i =0; i<allStations.size(); i++){
						Station stn = allStations.get(i);
						%>
						<option value="<%= stn.id %>"><%= stn.name %></option>
						<%
					}
					%>
				</select>
				</div>
				
			</div>
			
			<div class="form-group">
				<label>Journey Date</label>
				<input class="form-control" name="journey_date" id="from_where_select" type="date"/>
			</div>
			
			<div class="form-group">
				<label>Station To :</label>
				<div id="to-div">
					<select class="form-control" name="to" id="from_where_select date">
					<%
					for(int i=1; i<allStations.size(); i++){
						Station stn = allStations.get(i);
						%>
						<option value="<%= stn.id %>"><%= stn.name %></option>
						<%
					}
					%>
				</select>
				</div>
			</div>
			
			<div class="form-group">
				<label>Coach Type :</label>
				<select class="form-control" name="coach" id="from_where_select" >
				<option value="any">Any Coach</option>
				<%
				HashMap<String,String> coach = Helper.BusCoach();
				for(Map.Entry<String, String> temp:coach.entrySet()){
					%>
					<option value="<%= temp.getKey() %>"><%= temp.getValue() %></option>
					<%
				}
				%>
				</select>
			</div>

		</div>
		<div class="text-center">
			<div class="rs_btn_group">
				<button class="btn btn-default" type="submit">Search</button>
			</div>
		</div>
	</form>
</div>
 <script type="text/javascript">
	 var today = new Date().toISOString().slice(0, 10);
	 document.getElementsByName("journey_date")[0].value = today;
	 document.getElementsByName("journey_date")[0].min = today;
	 console.log(today);
	 function handleFromList(event){
		 var stations = [];
		 fetch('GetStations').then(resp=>resp.json()).then(json=>{
			 stations = json;
		 }).then(()=>{
			 var fromOpts = document.getElementsByName("from")[0].options;
			 const newSelect = document.createElement("select");
			 newSelect.onchange=handleFromList;
			 newSelect.name="from";
			 newSelect.classList.add("form-control");
			 for(let i=0;i<stations.length;i++){
				 if(stations[i].id!=event.target.value){
					 const option = document.createElement("option");
					 option.value=stations[i].id;
					 option.text=stations[i].name;
					 newSelect.appendChild(option);
				 }
			 }
			 const formDiv = document.getElementById("to-div");
			 formDiv.removeChild(formDiv.firstElementChild);
			 formDiv.appendChild(newSelect);
		 })
		 
		 
	 }
</script>
<%@ include file='footer.jsp' %>