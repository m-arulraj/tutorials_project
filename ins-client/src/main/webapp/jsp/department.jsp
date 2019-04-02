<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<body>
	<jsp:include page="../fragments/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card text-center bg-light mb-3">
					<div class="card-header text-info" style="font-weight: bold;">
						Departments from -<i class="text-success">
							${institueModel.shortName}</i> (${institueModel.name})!!!
					</div>
					<div class="card-body">
						<form:form action="departmentController" method="post">
							<div class="row">
								<table class="table table-bordered">
									<thead>


										<tr class="table-primary">
											<td class="colTitle">Department Id</td>
											<td class="colTitle">Department Name</td>
											<td class="colTitle">Department HOD</td>
											<td class="colTitle">Started on</td>
											<td class="colTitle">Action</td>
										</tr>
									</thead>
									<c:forEach items="${dptList}" var="dpt">
										<tr>
											<td><a href="#"
												onclick="setActions('dpt','get');submitForm('departmentForm');">
													${dpt.id}</a><input type="hidden" name="dptId" id="dptId"
												value="${dpt.id}" /></td>
											<td><a href="#" onclick="setActions('dpt','get')">${dpt.shortName}</a>
												- ${dpt.name}</td>
											<td>${dpt.hodName}</td>
											<td>${dpt.startOn}</td>
											<td>
												<button type="button" class="btn btn-success">Update</button>
												<button type="button" class="btn btn-danger">Delete</button>

												<button type="button" class="btn btn-info">Details</button>
											</td>
										</tr>
									</c:forEach>


								</table>

							</div>
						</form:form>
					</div>
					<div class="card-footer text-danger">
						<button type="button" class="btn btn-primary">Add
							Department</button>

						<button type="button" class="btn btn-success">Activate
							Staff</button>
						<button type="button" class="btn btn-dark">Activate Staff</button>
						<button type="button" class="btn btn-secondary">User List</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>