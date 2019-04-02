<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<html lang="en">
<body>
	<jsp:include page="../fragments/menulessheader.jsp" />
	<div class="container">

		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card bg-light mb-3">
					<div class="card-header text-info"
						style="font-weight: bold; font-style: italic;">Sign-in</div>
					<div class="card-body">

						<form action="login" method='post'>
							<div class="form-group">
								<label for="exampleInputEmail1">User Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter username"
									name="username">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password">
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>


					</div>
					<c:if test="${not empty errorMessge}">
						<div class="card-footer text-danger">${errorMessge}</div>
					</c:if>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>