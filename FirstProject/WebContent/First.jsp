<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList,com.firstproject.model.Message"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>:: Title ::</title>
</head>
<body>

	<%-- This is a JSP example with scriplets, comments , expressions --%>
	<%
		out.println("This is First JSP Example");
	%>
	<%
	Message msg1 = new Message();
	msg1.setId(1);
	msg1.setMsg("Hello");
	
	Message msg2 = new Message();
	msg2.setId(2);
	msg2.setMsg("World");
	
	ArrayList<Message> nameList = new ArrayList();
	nameList.add(msg1);
	nameList.add(msg2);
	request.getAttribute("studentList");
	%>
	<table>
	<tr><td>ID</td><td>Messsage</td><td>Action</td></tr>
	<% for(Message msg:nameList){ %>
	<tr><td><%=msg.getId() %></td><td><%=msg.getMsg() %></td><td><a href="EditStudent?id=<%=msg.getId() %>">Edit</a> &nbsp;<a href="DeleteStudent?id=<%=msg.getId() %>">Delete</a><a href="StudentDetail?id=<%=msg.getId() %>">View Ifno</a> </td></tr>
	<%} %>
	</table>
</body>
</html>