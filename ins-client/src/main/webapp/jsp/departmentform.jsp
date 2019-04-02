<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>:: CMS ::</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel='stylesheet'
	href='../webjars/bootstrap/4.3.1/css/bootstrap.min.css'>
<style type="text/css">
table.table-bordered {
	border: 1px solid #7abaff;
	margin-top: 20px;
}

table.table-bordered>thead>tr>th {
	border: 1px solid #7abaff;
	text-align: center;
}

table.table-bordered>tbody>tr>td {
	border: 1px solid #7abaff;
}
</style>
</head>
<body>

	<form:form action="/department/add" method="post"
		modelAttribute="department">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
						<div class="panel-heading"
							style="background-color: #9df776; text-align: center;">
							<h3 class="panel-title">
								Welcome to <b style="color: #f7f7f9;">${institueModel.name}</b>
								powered by <i style="color: #dcf9d9">CMS</i>!!!
							</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered" style="width: 50%"
					align="center">
					<thead>
						<tr class="table-primary">
							<th colspan="2" style="text-align: center;">Add a new
								Department to <b><i> ${institueModel.shortName}</i></b>
							</th>
						</tr>
					</thead>
					<tr>
						<td class="colTitle" width="30%">Name</td>
						<td><form:input path="name" /></td>
					</tr>
					<tr>
						<td class="colTitle" width="30%">Short Name</td>
						<td><form:input path="shortName" /></td>
					</tr>
					<tr>
						<td class="colTitle" width="30%">E-Mail</td>
						<td><form:input type="email" path="email" /></td>
					</tr>
					<tr>
						<td class="colTitle">Started On</td>
						<td><form:input type="date" path="startOn" /></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input
							type="submit" value="Create" name="addDpt"
							class="btn btn-primary" /> <input type="submit" value="Cancel"
							name="clearForm" class="btn btn-secondary" /></td>
					</tr>


				</table>

			</div>
		</div>
	</form:form>
</body>
</html>