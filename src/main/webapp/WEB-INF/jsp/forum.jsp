<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/newHeader.jsp" />
<h2>QUESTIONS YOU ASKED:</h2>



	 <c:forEach var="question" items="${userQuestions}">
	 		<div><b>RECIPIENT: </b><c:out value="${question.representative}" /></div>
			<div><b>TOPIC: </b><c:out value="${question.topic}" /></div>
			<div><b>QUESTION: </b><br/><c:out value="${question.question}" /></div><br/>
			
	</c:forEach>

<c:import url="/WEB-INF/jsp/footer.jsp" />