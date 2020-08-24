<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/newHeader.jsp" />

 	<h3><span id="stateName"></span>:</h3>

	<div class="senator"> <h4>Senators:</h4> 
		<b><div id="senator1"/></div></b>
		<div id=senator1Party /></div>
		<div id="senator1Address" /></div>
		<div id="senator1PhoneNumber" /></div>
		<div id="senator1WebSite" /></div>
		<div id="senator1" /></div>
		<!-- <img src="senator1Image"/> -->
	</div>
	<br/>
	<div class="senator">
		<b><div id="senator2" /></div></b>
		<div id="senator2Party" /></div>
		<div id="senator2Address" /></div>
		<div id="senator2PhoneNumber" /></div>
		<div id="senator2WebSite" /></div>
		<div id="senator2" /></div>
		<!-- <img src="senator2Image"/> -->
	</div>
	<br/>
	<div class="representatives"><h4>Your Representative:</h4>
		<b><div id="representativeName"></div></b>
    	<div id="representativeParty"></div>
   		<div id="representativePhoneNumber"></div>
   		<div id="representativeWebSite"></div> 
<!--    		<div>https://www.facebook.com/<span id="representativeFB"></span></div>
   		<div>https://twitter.com/<span id="representativeTwitter"></span></div>
   		<div>https://www.youtube.com/results?search_query=UCtVl3kb7Xvt3pY7l6x-M6LA<span id="representativeYouTube"></span></div>
   		<div>https://plus.google.com/<span id="representativeGooglePlus"></span></div> -->
   	</div>
    

  <c:url value="/js/district.js" var="district"/>
<script type="text/javascript" src="${district}"></script>









     	
<c:import url="/WEB-INF/jsp/footer.jsp" />