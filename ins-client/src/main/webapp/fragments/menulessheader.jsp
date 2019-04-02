<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<head>
<title>:: CMS ::</title>
<spring:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"
	var="bootstrapCss" />
<spring:url value="/resources/cms.css" var="cmsCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
</head>

<spring:url value="/" var="urlHome" />

<nav class="navbar navbar-light navbar-fixed-top"
	style="background-color: #e3f2fd; border-bottom: medium;">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="${urlHome}">College Management
				System</a>
		</div>
		<div id="navbar">
			<form class="form-inline" action="users/add" method="get">
				<input class="btn btn-sm btn-primary" type="submit"
					value="User Sign-Up" /> &nbsp;
				<spring:url value="/login" var="loginUrl" />
				<input class="btn btn-sm  btn-success" type="button"
					onclick="location.href='${loginUrl}'" value="Login" />

			</form>

		</div>
	</div>
</nav>
<br />
