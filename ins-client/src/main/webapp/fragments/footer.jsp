<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<br /><br />
		</div>
	</div>
</div>
<footer class="footer"
	style="position: fixed; bottom: 0; width: 100%; text-align: center; background-color: #e3f2fd;">
	<div class="container">
		<p class="text-muted">&copy; CMS - Powered by PNC Team</p>
	</div>
</footer>


<spring:url value="/webjars/jquery/3.3.1-2/jquery.min.js" var="jqueryJs" />
<spring:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"
	var="bootstrapJs" />


<script src="${jqueryJs}"></script>
<script src="${bootstrapJs}"></script>


