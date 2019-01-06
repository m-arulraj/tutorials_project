<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.text.SimpleDateFormat;" isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	Date:
	<jsp:include page="Date.jsp" flush="true"></jsp:include><br />
	<jsp:useBean id="message" class="com.firstproject.model.Message">
	</jsp:useBean><br /> Message:
	<jsp:getProperty property="msg" name="message" /><br />
	<jsp:setProperty property="msg" name="message" value="Hello" /><br />
	Message:
	<jsp:getProperty property="msg" name="message" /><br />
</body>
</html>