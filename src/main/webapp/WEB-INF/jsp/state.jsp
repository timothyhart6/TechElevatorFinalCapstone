<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="stateCssHref" value="/css/state.css" />
		<link rel="stylesheet" type="text/css" href="${stateCssHref}">

 	<h3><span id="stateName"></span>:</h3>
 	
 	<div class="senator"> <h4>Senators:</h4> 
 		<b><div id="senator1"/></div></b>
  		<div id=senator1Party /></div>
  		<div id="senator1Address" /></div>
  		<div id="senator1PhoneNumber"/></div>
  		<div id="senator1WebSite" /></div>
  		<div id="senator1" /></div>
  		<div><img id="senator1Photo"/></div>
 	</div>
 	<br/>
 	<div class="senator">
 		<b><div id="senator2" /></div></b>
  		<div id="senator2Party" /></div>
  		<div id="senator2Address" /></div>
  		<div id="senator2PhoneNumber" /></div>
  		<div id="senator2WebSite" /></div>
  		<div id="senator2" /></div>
  		<div><img id="senator2Photo"/></div>
 	</div>
 	<br/>
 	<div class="governor"><h4>Governor:</h4>
 		<b><div id="governorName"></div></b>
   		<div id="governorParty"></div>
  		<div id="governorPhoneNumber"></div>
  		<div id="governorWebSite"></div> 
  		<div><img id="governorPhoto"/></div>

 	</div>
 	<br/>

	<div>
		<c:url var="district" value="/districtInput"/>
		<form method="GET" name="" action="${district}">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
			<label for="address">Address:</label>
			<input type="text" id="districtSearch" name="address"/>
			<label for="apt">Apt:</label>
			<input type="text" id="districtSearch" name="apt"/>
			<label for="city">City:</label>
			<input type="text" id="districtSearch" name="city"/>
			<label for="state">State:</label>
			<input type="text" id="districtSearch" name="state"/>
			<label for="zipCode">Zip Code:</label>
			<input type="text" id="districtSearch" name="zipCode"/>
			<button id="districtButtonSearch">Enter your address to find your Reps!</button>
		</form>
	</div>
	
	<h4>Townhalls:</h4>
	<ul>
		<c:forEach var="townhall" items="${townhalls}">
			<li>${townhall.representative} ${townhall.district} ${townhall.dates} ${townhall.times} ${townhall.address}</li>
		</c:forEach>
	</ul>


<%-- 	<c:url var="formAction" value="/district" />
	<form class="districtSearch" method="GET" action=district>
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/> --%>
  <script type="text/javascript" src="${state}"></script>

     	
        

<c:import url="/WEB-INF/jsp/footer.jsp" />