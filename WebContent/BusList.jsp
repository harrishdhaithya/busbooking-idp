<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.controllers.Helper,com.controllers.bus,java.util.ArrayList,com.model.Bus,java.util.Iterator" %>   
<%@ include file="header.jsp" %>
<%

	bus trn = new bus();

	if(request.getParameter("delete") != null){
		String trnId = (String) request.getParameter("delete");
		trn.Delete(trnId);
	}

	ArrayList<Bus> buslist = new ArrayList<Bus>();
	buslist = trn.getAll();
	Iterator trnIt = buslist.iterator();
%>
<div class="text-right">
	<a class="btn btn-success" href="Add.jsp">Create Bus</a>
</div>
<br>
<div class="box successfully_purschase_ticket">
	<h2 class="box_title">All Bus List</h2>
	<table class="table table-bordered">
		<tr>
			<td wide="50">Bus Code</td>
			<td>Name</td>
			<td>Coach</td>
			<td>Total Seat</td>
			<td>Actions</td>
		</tr>
		<%
		while(trnIt.hasNext()){
			Bus trin = (Bus) trnIt.next();
			
			%>
			<tr>
				<td><%= trin.code %></td>
				<td><%= trin.type %></td>
				<td><%= trin.name %></td>
				<td><%= trin.totalSeat %></td>
				<td><a href="?delete=<%= trin.id %>" class="btn btn-sm btn-danger">Delete</a></td>
			</tr>
			<%
		}
		%>
		
	</table>
</div>
<%@ include file="footer.jsp" %>