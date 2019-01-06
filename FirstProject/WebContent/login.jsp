<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="LoginServlet" method="post">
		<table>
			<tr>
				<td colspan="2">
				<c:if test="${errorCode!= null }">
				<ul>
				<c:forEach items="${errorCode}" var="error">
				<li style="color:red"><c:out value="${error}"/></li>
				</c:forEach>
				</ul></c:if>
				</td>
				
			</tr>
			<tr>
				<td>User Id:</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td> <input type="submit" value="Login"> </td>
				<td></td>
			</tr>
		</table>
	</form>
</body>
</html>