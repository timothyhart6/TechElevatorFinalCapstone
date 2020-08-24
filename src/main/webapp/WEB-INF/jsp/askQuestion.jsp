<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/newHeader.jsp" />
<c:url var="questionUrl" value="/submit"/>
<form class="questions" method="POST" action= "${questionUrl}">
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>


<script>let fullAddress = '${currentUser.address}'</script>
	<h4>Select which of your Representatives you prefer to contact:</h4>
	
	<select name="representative" id="representative">
		<option value="">Representatives:</option>
		<option id="senator1"></option> 
		<option id="senator2"></option>
		<option id="representativeName"></option>
	</select>
	<br/>
	
	<h4>Select topic:</h4>
	
	<select name="topic" id="topic">
		<option value="">Topics:</option>
		<option id="taxQuestion" value="Taxes">Taxes</option> 
		<option id="electionQuestion" value="Election">Election</option>
		<option id="donor" value="Campaign Contributions">Campaign Contributions</option>
		<option id="otherQuestion" value="Other">Other</option>
	</select><br/>
	
	<h4>Enter Your Question here:</h4>
	
	<input type="text" name="question" id="question">
	<div class="submit"><input type="submit" value="Submit"></div>
	
</form>


<c:url value="/js/forum.js" var="forum"/>
<script type="text/javascript" src="${forum}"></script>

<c:import url="/WEB-INF/jsp/footer.jsp" />