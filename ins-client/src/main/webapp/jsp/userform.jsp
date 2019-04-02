<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<body>
	<jsp:include page="../fragments/menulessheader.jsp" />
	<spring:url value="/users/add" var="userActionUrl" />
	<div class="container">
		<div class="card  bg-light mb-3">
			<div class="card-header "
				style="font-weight: bold; font-style: italic;">
				<c:choose>
					<c:when test="${userForm['new']}">
						<h3 class="text-info">Add User</h3>
					</c:when>
					<c:otherwise>
						<h3>Update User</h3>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="card-body">
				<div class="bd-callout bd-callout-info">
					<form:form class="form-horizontal" method="post"
						modelAttribute="userForm" action="${userActionUrl}">

						<br />
						<form:hidden path="id" />
						<spring:bind path="institueId">
							<div class="form-group row ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Institute : </label>
								<div class="col-sm-5">
									<form:select path="institueId" class="form-control">
										<form:option value="0"
											label="----------- Select an Institute --------" />
										<c:forEach items="${instLst}" var="inst">
											<form:option value="${inst.getId()}"
												label="${inst.shortName} - ${inst.name}" />
										</c:forEach>

									</form:select>
									<form:errors path="institueId"
										class="control-label text-danger" />
								</div>
								<div class="col-sm-5"></div>
							</div>
						</spring:bind>
						<spring:bind path="name">
							<div class="form-group row ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Name : </label>
								<div class="col-sm-10">
									<form:input path="name" type="text" class="form-control "
										id="name" placeholder="Name" />
									<form:errors path="name" class="control-label text-danger" />
								</div>
							</div>
						</spring:bind>
						<spring:bind path="email">
							<div class="form-group row ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Email : </label>
								<div class="col-sm-10">
									<form:input path="email" class="form-control" id="email"
										placeholder="Email" />
									<form:errors path="email" class="control-label text-danger" />
								</div>
							</div>
						</spring:bind>
						<spring:bind path="userName">
							<div class="form-group row ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">User Name : </label>
								<div class="col-sm-10">
									<form:input path="userName" class="form-control" id="userName"
										placeholder="User Name" />
									<form:errors path="userName" class="control-label text-danger" />
								</div>
							</div>
						</spring:bind>
						<spring:bind path="password">
							<div class="form-group row ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Password : </label>
								<div class="col-sm-10">
									<form:password path="password" class="form-control"
										id="password" placeholder="password" />
									<form:errors path="password" class="control-label text-danger" />
								</div>
							</div>
						</spring:bind>
						<spring:bind path="confirmPassword">
							<div class="form-group row ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Confirm Password :
								</label>
								<div class="col-sm-10">
									<form:password path="confirmPassword" class="form-control"
										id="password" placeholder="Confirm Password" />
									<form:errors path="confirmPassword"
										class="control-label text-danger" />
								</div>
							</div>
						</spring:bind>
						<spring:bind path="dob">
							<div class="form-group row ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Date of Birth : </label>
								<div class="col-sm-3">
									<form:input type="date" path="dob" class="form-control" />
									<form:errors path="dob" class="control-label text-danger" />

								</div>
								<div class="col-sm-7"></div>
							</div>
						</spring:bind>
						<spring:bind path="address">
							<div class="form-group row ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Address : </label>
								<div class="col-sm-10">
									<form:textarea path="address" rows="5" class="form-control"
										id="address" placeholder="address" />
									<form:errors path="address" class="control-label text-danger" />
								</div>
							</div>
						</spring:bind>
						<spring:bind path="type">
							<div class="form-group row ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Type : </label>
								<div class="col-sm-10">
									<label class="radio-inline"> <form:radiobutton
											path="type" value="T" /> Staff
									</label> <label class="radio-inline"> <form:radiobutton
											path="type" value="S" /> Student
									</label> <br />
									<form:errors path="type" class="control-label text-danger" />
								</div>
							</div>
						</spring:bind>
						<spring:bind path="sex">
							<div class="form-group row ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Sex : </label>
								<div class="col-sm-10">
									<label class="radio-inline"> <form:radiobutton
											path="sex" value="M" /> Male
									</label> <label class="radio-inline"> <form:radiobutton
											path="sex" value="F" /> Female
									</label> <br />
									<form:errors path="sex" class="control-label text-danger" />
								</div>
							</div>
						</spring:bind>


						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<c:choose>
									<c:when test="${userForm['new']}">
										<button type="submit" class="btn-lg btn-primary pull-right">Add</button>
									</c:when>
									<c:otherwise>
										<button type="submit" class="btn-lg btn-primary pull-right">Update</button>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>


	</div>

	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>