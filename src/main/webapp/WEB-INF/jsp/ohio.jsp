<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<p><c:out value="${selectedState.newState}" /> <c:out value="${selectedState.state}" />test

    <h1>API Test</h1>
    <div class="container">
            <input type="text" id="locationName" />
            <button id="btnSearch" class="btn btn-success">SEARCH</button>
    </div>
   	<h3>The Senators for the State of <span id="stateName"></span>:</h3>
   		<div class="senator">
   			<div id="senator1"/></div>
	   		<div id=senator1Party /></div>
	   		<div id="senator1Address" /></div>
	   		<div id="senator1PhoneNumber" /></div>
	   		<div id="senator1WebSite" /></div>
	   		<div id="senator1" /></div>
	   		<!-- <img src="senator1Image"/> -->
   		</div>
   		<br/>
   		<br/>
   		<div class="senator">
   			<div id="senator2" /></div>
	   		<div id="senator2Party" /></div>
	   		<div id="senator2Address" /></div>
	   		<div id="senator2PhoneNumber" /></div>
	   		<div id="senator2WebSite" /></div>
	   		<div id="senator2" /></div>
	   		<!-- <img src="senator2Image"/> -->
   		</div>
   		<br/>
   		<br/>
   		<h3>Representative for <span id ="districtName"></span>:</h3>
   		<div class="representatives">
   		   	<div id="representativeName"></div>
	    	<div id="representativeParty"></div>
	   		<div id="representativePhoneNumber"></div>
	   		<div id="representativeWebSite"></div> 
	   		<div>https://www.facebook.com/<span id="representativeFB"></span></div>
	   		<div>https://twitter.com/<span id="representativeTwitter"></span></div>
	   		<div>https://www.youtube.com/results?search_query=UCtVl3kb7Xvt3pY7l6x-M6LA<span id="representativeYouTube"></span></div>
	   		<div>https://plus.google.com/<span id="representativeGooglePlus"></span></div>
   		</div>
   		<br/>
   		<br/>

    
    
     	
        

<c:import url="/WEB-INF/jsp/footer.jsp" />