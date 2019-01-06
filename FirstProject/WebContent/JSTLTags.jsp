<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ taglib uri="WEB-INF/mytags.tld" prefix="m" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:out value="${'Welcome to Core Tags'}" />
	<br />
	<br />
	<c:import var="data" url="http://www.google.com" />
	<c:out value="${data}" />
	<br />
	<br />
	<c:set var="Income" scope="session" value="${4000*4}" />
	<c:out value="${Income}" />
	<br />
	<br />
	<c:set var="income" scope="session" value="${4000*4}" />
	<p>
		Before Remove Value is:
		<c:out value="${income}" />
	</p>
	<c:remove var="income" />
	<p>
		After Remove Value is:
		<c:out value="${income}" />
	</p>
	<br />
	<br />
	<c:catch var="catchtheException">
		<%
			int x = 2 / 0;
		%>
	</c:catch>

	<c:if test="${catchtheException != null}">
		<p>
			The type of exception is : ${catchtheException} <br /> There is an
			exception: ${catchtheException.message}
		</p>
	</c:if>
	<br />
	<br />
	<c:set var="income" scope="session" value="${4000*4}" />
	<c:if test="${income > 8000}">
		<p>
			My income is:
			<c:out value="${income}" />
		<p>
	</c:if>
	<br />
	<br />
	<c:set var="income" scope="session" value="${4000*4}" />
	<p>
		Your income is :
		<c:out value="${income}" />
	</p>
	<c:choose>
		<c:when test="${income <= 1000}">  
       Income is not good.  
    </c:when>
		<c:when test="${income > 10000}">  
        Income is very good.  
    </c:when>
		<c:otherwise>  
       Income is undetermined...  
    </c:otherwise>
	</c:choose>
	<br />
	<br />
	<c:forEach var="j" begin="1" end="3">  
   Item <c:out value="${j}" />
		<p>
	</c:forEach>
	<br />
	<br />
	<c:forTokens items="Rahul-Nakul-Rajesh" delims="-" var="name">
		<c:out value="${name}" />
		<p>
	</c:forTokens>
	<br />
	<br />
	<c:url value="/index1.jsp" var="completeURL">
		<c:param name="trackingId" value="786" />
		<c:param name="user" value="Nakul" />
	</c:url>
	${completeURL}
	<br />
	<br />
	<c:set var="url" value="0" scope="request" />
	<c:if test="${url<1}">
		<%-- <c:redirect url="http://javatpoint.com" /> --%>
	</c:if>
	<c:if test="${url>1}">
		<%-- <c:redirect url="http://facebook.com" /> --%>
	</c:if>
	<br />
	<br />
	<c:url value="/RegisterDao.jsp" />
	<br />
	<br />
	<c:out value="${'Welcome to Function Tags'}" />
	<br />
	<br />
	<c:set var="String" value="Welcome to javatpoint" />

	<c:if test="${fn:contains(String, 'javatpoint')}">
		<p>Found javatpoint string
		<p>
	</c:if>

	<c:if test="${fn:contains(String, 'JAVATPOINT')}">
		<p>Found JAVATPOINT string
		<p>
	</c:if>

	<br />
	<br />
	<c:set var="String" value="Welcome to javatpoint" />

	<c:if test="${fn:containsIgnoreCase(String, 'javatpoint')}">
		<p>Found javatpoint string
		<p>
	</c:if>

	<c:if test="${fn:containsIgnoreCase(String, 'JAVATPOINT')}">
		<p>Found JAVATPOINT string
		<p>
	</c:if>

	<br />
	<br />
	<c:set var="String" value="Welcome to JSP programming" />

	<c:if test="${fn:endsWith(String, 'programming')}">
		<p>String ends with programming
		<p>
	</c:if>

	<c:if test="${fn:endsWith(String, 'JSP')}">
		<p>String ends with JSP
		<p>
	</c:if>

	<br />
	<br />
	<c:set var="string1" value="It is first String." />
	<c:set var="string2" value="It is <xyz>second String.</xyz>" />

	<p>With escapeXml() Function:</p>
	<p>string-1 : ${fn:escapeXml(string1)}</p>
	<p>string-2 : ${fn:escapeXml(string2)}</p>

	<p>Without escapeXml() Function:</p>
	<p>string-1 : ${string1}</p>
	<p>string-2 : ${string2}</p>
	<br />
	<br />
	<c:set var="string1" value="It is first String." />
	<c:set var="string2" value="It is <xyz>second String.</xyz>" />

	<p>Index-1 : ${fn:indexOf(string1, "first")}</p>
	<p>Index-2 : ${fn:indexOf(string2, "second")}</p>
	<br />
	<br />
	<c:set var="str1" value="Welcome to JSP        programming         " />
	<p>String-1 Length is : ${fn:length(str1)}</p>

	<c:set var="str2" value="${fn:trim(str1)}" />
	<p>String-2 Length is : ${fn:length(str2)}</p>
	<p>Final value of string is : ${str2}</p>
	<br />
	<br />
	<c:set var="msg" value="The Example of JSTL fn:startsWith() Function" />
	The string starts with "The": ${fn:startsWith(msg, 'The')}
	<br>The string starts with "Example": ${fn:startsWith(msg, 'Example')}
	<br />
	<br />
	<c:set var="str1" value="Welcome-to-JSP-Programming." />
	<c:set var="str2" value="${fn:split(str1, '-')}" />
	<c:set var="str3" value="${fn:join(str2, ' ')}" />

	<p>String-3 : ${str3}</p>
	<c:set var="str4" value="${fn:split(str3, ' ')}" />
	<c:set var="str5" value="${fn:join(str4, '-')}" />
	<br />
	<br />
	<c:set var="string" value="Welcome to JSP Programming" />
	${fn:toLowerCase("HELLO,")} ${fn:toLowerCase(string)}

	<br />
	<br />
	<c:set var="site" value="JSTL Samples" />
	<c:set var="author" value="Arul" />
	Hi, This is ${fn:toUpperCase(site)} developed by
	${fn:toUpperCase(author)}.
	<br />
	<br />
	<c:set var="string" value="This is the first string." />
	${fn:substring(string, 5, 17)}
	<br />
	<br />
	<c:set var="string" value="Nakul Jain" />
	${fn:substringAfter(string, "Nakul")}
	<br />
	<br />
	<c:set var="string"
		value="Hi, This is JAVATPOINT.COM developed by SONOO JAISWAL." />
	${fn:substringBefore(string, "developed")}
	<br />
	<br />
	<c:set var="str1" value="This is first string" />
	<c:set var="str2" value="Hello" />
	Length of the String-1 is: ${fn:length(str1)}
	<br> Length of the String-2 is: ${fn:length(str2)}
	<br />
	<br />
	<c:set var="author" value="Ramesh Kumar" />
	<c:set var="string" value="pqr xyz abc PQR" />
	${fn:replace(author, "Ramesh", "Suresh")} ${fn:replace(string, "pqr", "hello")}
	<br />
	<br />
	<c:out value="${'Formats Tags starts....'}"></c:out>
	<br />
	<br />
	<c:set var="Amount" value="786.970" />

	<fmt:parseNumber var="j" type="number" value="${Amount}" />
	<p>
		<i>Amount is:</i>
		<c:out value="${j}" />
	</p>

	<fmt:parseNumber var="j" integerOnly="true" type="number"
		value="${Amount}" />
	<p>
		<i>Amount is:</i>
		<c:out value="${j}" />
	</p>
	<br />
	<br />
	<c:set var="str" value="<%=new java.util.Date()%>" />
	<table border="2" width="100%">
		<tr>
			<td width="100%" colspan="2" bgcolor="#FF7F50">
				<p align="center">
					<b> <font color="#000000" size="6">Formatting: <fmt:formatDate
								value="${str}" type="both" timeStyle="long" dateStyle="long" />
					</font>
					</b>
				</p>
			</td>
		</tr>

		<c:forEach var="zone"
			items="<%=java.util.TimeZone.getAvailableIDs()%>">
			<tr>
				<td width="50%" bgcolor="#C0C0C0"><c:out value="${zone}" /></td>
				<td width="50%" bgcolor="#FFEBCD"><fmt:timeZone value="${zone}">
						<fmt:formatDate value="${str}" timeZone="${zn}" type="both" />
					</fmt:timeZone></td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<br />
	<h3>Formatting of Number:</h3>
	<c:set var="Amount" value="9850.14115" />
	<p>
		Formatted Number-1:
		<fmt:formatNumber value="${Amount}" type="currency" />
	</p>
	<p>
		Formatted Number-2:
		<fmt:formatNumber type="number" groupingUsed="true" value="${Amount}" />
	</p>
	<p>
		Formatted Number-3:
		<fmt:formatNumber type="number" maxIntegerDigits="3" value="${Amount}" />
	</p>
	<p>
		Formatted Number-4:
		<fmt:formatNumber type="number" maxFractionDigits="6"
			value="${Amount}" />
	</p>
	<p>
		Formatted Number-5:
		<fmt:formatNumber type="percent" maxIntegerDigits="4"
			value="${Amount}" />
	</p>
	<p>
		Formatted Number-6:
		<fmt:formatNumber type="number" pattern="###.###$" value="${Amount}" />
	</p>
	<br />
	<br />
	<h3>Parsed Date:</h3>
	<c:set var="date" value="12-08-2016" />

	<fmt:parseDate value="${date}" var="parsedDate" pattern="dd-MM-yyyy" />
	<p>
		<c:out value="${parsedDate}" />
	</p>
	<br />
	<br />
	<c:set var="date" value="<%=new java.util.Date()%>" />
	<p>
		<b>Date and Time in Indian Standard Time(IST) Zone:</b>
		<fmt:formatDate value="${date}" type="both" timeStyle="long"
			dateStyle="long" />
	</p>
	<fmt:setTimeZone value="GMT-10" />
	<p>
		<b>Date and Time in GMT-10 time Zone: </b>
		<fmt:formatDate value="${date}" type="both" timeStyle="long"
			dateStyle="long" />
	</p>
	<br />
	<br />
	<h2>Different Formats of the Date</h2>
	<c:set var="Date" value="<%=new java.util.Date()%>" />
	<p>
		Formatted Time :
		<fmt:formatDate type="time" value="${Date}" />
	</p>
	<p>
		Formatted Date :
		<fmt:formatDate type="date" value="${Date}" />
	</p>
	<p>
		Formatted Date and Time :
		<fmt:formatDate type="both" value="${Date}" />
	</p>
	<p>
		Formatted Date and Time in short style :
		<fmt:formatDate type="both" dateStyle="short" timeStyle="short"
			value="${Date}" />
	</p>
	<p>
		Formatted Date and Time in medium style :
		<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium"
			value="${Date}" />
	</p>
	<p>
		Formatted Date and Time in long style :
		<fmt:formatDate type="both" dateStyle="long" timeStyle="long"
			value="${Date}" />
	</p>
	<br />
	<br />
	<h2>SQL Tags</h2>
	<br />
	<br />
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/sms" user="root" password="admin" />
	<br />
	<br />
	<sql:query dataSource="${db}" var="rs">  
SELECT * from student;  
</sql:query>
	<br />
	<br />
	<table border="2" width="100%">
		<tr>
			<th>Student ID</th>
			<th>Name</th>
			<th>Phone</th>
			<th>Email</th>
		</tr>
		<c:forEach var="table" items="${rs.rows}">
			<tr>
				<td><c:out value="${table.id}" /></td>
				<td><c:out value="${table.name}" /></td>
				<td><c:out value="${table.phone}" /></td>
				<td><c:out value="${table.email}" /></td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<h2>Custom Tags</h2>
	<br />
	<br />
	<h3>Current Date and Time is: <m:today/>  </h3>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>