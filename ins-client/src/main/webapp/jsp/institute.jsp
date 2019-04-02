<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<body>
	<sec:authorize access="hasRole('USER')">
		<jsp:include page="../fragments/header.jsp" />
		<div class="container">

			<spring:url value="/institutes" var="institutesUrl" />
			<form:form class="form-horizontal" method="post"
				modelAttribute="institueForm" action="${institutesUrl}">

				<div class="card  bg-light mb-3">
					<div class="card-header"
						style="font-weight: bold; font-style: italic;">Select an
						Institute &amp; an Action to proceed further</div>
					<div class="card-body">
						<br />
						<spring:bind path="id">
							<div class="form-group row">
								<label class="col-sm-2 control-label">Institute Name :</label>
								<div class="col-sm-5">
									<form:select path="id" class="form-control">
										<form:option value="0"
											label="----------- Select an Institute --------" />
										<c:forEach items="${instLst}" var="inst">
											<form:option value="${inst.getId()}"
												label="${inst.shortName}-
										${inst.name}" />
										</c:forEach>

									</form:select>
									<form:errors path="id" class="control-label text-danger" />
								</div>
								<div class="col-sm-5"></div>
							</div>
						</spring:bind>

						<br /> <br /> <br />

						<div class="form-group row">
							<label class="col-sm-2 control-label">Action :</label>
							<div class="col-sm-10">
								<input type="submit" value="List Departments"
									class="btn btn-sm btn-primary" name="departmentList" />
								<sec:authorize access="hasRole('ROLE_ADMIN')">
								&nbsp;&nbsp;&nbsp;<input type="submit" value="List Users"
										class="btn btn-sm btn-info" name="userList" />
								&nbsp;&nbsp;&nbsp;<input type="submit"
										class="btn  btn-sm btn-success" value="Activate Staff"
										onClick="setActions('staff','add')" />&nbsp;&nbsp;&nbsp; <input
										type="submit" value="Activate Student"
										onClick="setActions('student','add')"
										class="btn  btn-sm btn-secondary" />
								</sec:authorize>
							</div>

						</div>
					</div>
				</div>
			</form:form>
		</div>

		<jsp:include page="../fragments/footer.jsp" />
	</sec:authorize>
</body>
</html>