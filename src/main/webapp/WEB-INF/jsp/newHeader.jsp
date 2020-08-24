<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html>
	<head>
		<title>Alpha Voting App</title>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
	    <script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
	    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	    <c:url value="js/main.js" var="mainjs"/>
	    <script src="${mainjs}"></script>
	    <c:url var="cssHref" value="/css/voterInformation.css" />
		<link rel="stylesheet" type="text/css" href="${cssHref}">

		<c:url value="/js/state.js" var="senators"/>
		<script type="text/javascript" src="${senators}"></script>

		<script type="text/javascript">
			const contextPath= '${pageContext.servletContext.contextPath}';
			$(document).ready(function() {
				$("time.timeago").timeago();
				
				$("#logoutLink").click(function(event){
					$("#logoutForm").submit();
				});
				
				var pathname = window.location.pathname;
				$("nav a[href='"+pathname+"']").parent().addClass("active");
			});
		</script>
	</head>
	
	
	<body>
	
		<nav class="navbar navbar-default">
			<div>
				<ul class="nav navbar-nav">
					<c:url var="homePageHref" value="/main" />
					<li><a href="${homePageHref}"><b>Home</b></a></li>
					<c:if test="${not empty currentUser}">
						<%-- <c:url var="dashboardHref" value="/users/${currentUser}" />
						<li><a href="${dashboardHref}">Private Messages</a></li> --%>
						<c:url var="newMessageHref" value="/users/${currentUser}/messages/new" />
						<li><a href="${newMessageHref}">Message Your Representative!</a></li>
						<c:url var="sentMessagesHref" value="/users/${currentUser}/messages" />
						<li><a href="${sentMessagesHref}">Forum</a></li>
<%-- 						<c:url var="changePasswordHref" value="/users/${currentUser}/changePassword" />
						<li><a href="${changePasswordHref}">Change Password</a></li> --%>
					</c:if>
				</ul>
				
				
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty currentUser}">
							<c:url var="newUserHref" value="/users/new" />
							<li><a href="${newUserHref}">Sign Up</a></li>
							<c:url var="loginHref" value="/login" />
							<li><a href="${loginHref}">Log In</a></li>
						</c:when>
						
						
						<c:otherwise>
						<c:url var="statePageAction" value="/state" />
							<form id="statePageForm" action="${statePageAction}" method="GET">
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
							</form>
							<li><a id="statePageLink" href="${statePageAction}">Your State</a></li>
							
							<c:url var="logoutAction" value="/logout" />
							<form id="logoutForm" action="${logoutAction}" method="POST">
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
							</form>
							<li><a id="logoutLink" href="#">Log Out</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
		<c:if test="${not empty currentUser}">
			<p id="currentUser">Current User: ${currentUser.userName}</p>
		</c:if>		
		<div class="container"> 