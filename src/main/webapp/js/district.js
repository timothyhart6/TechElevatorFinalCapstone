$(document).ready(function () {
 
	//function to get the selected state name from the URL
	function getQueryVariable(variable) {
	       var query = window.location.search.substring(1);
	       var vars = query.split("&");
	       for (var i=0;i<vars.length;i++) {
	               var pair = vars[i].split("=");
	               if(pair[0] == variable){return pair[1];}
	       }
	       return(false);
	}
	
	let userAddress = getQueryVariable("address");
	let userApt = getQueryVariable("apt");
	let userCity = getQueryVariable("city");
	let userState = getQueryVariable("state");
	let userZipCode = getQueryVariable("zipCode");
	let fullAddress = userAddress + " " + userApt + " " + userCity + " " + userState + " "+ userZipCode;
	//let fullAddress = "1275 Kinnear Rd, Columbus, OH 43212";
	//google's civic API
    var apiUrl = "https://www.googleapis.com/civicinfo/v2/representatives";
	
	//connects to the API and gets desired data
    $.ajax({
        url: apiUrl,
        data: {
        	address: fullAddress,
            key: "AIzaSyCZom8UkHqmSzLcAWfnfL41vOfirikaS3w"
        },
        type: "GET",
        dataType: "json"
    }).done(function (data) {
    	console.log(data);
    	$("#stateName").html(data.divisions[data.offices[2].divisionId].name);
    	//checks input is not Washington DC
    	if (data.normalizedInput.state != "DC") {
    	//Senator #1
        $("#senator1").html(data.officials[2].name);
        $("#senator1WebSite").html(data.officials[2].urls);
        $("#senator1Party").html(data.officials[2].party);
        $("#senator1PhoneNumber").html(data.officials[2].phones);
        $("#senator1Address").html(data.officials[2].address);
        //$("#senator1Image").html(data.officials[2].photoUrl);
    	
    	//Senator #2
        $("#senator2").html(data.officials[3].name);
        $("#senator2WebSite").html(data.officials[3].urls);
        $("#senator2Party").html(data.officials[3].party);
        $("#senator2PhoneNumber").html(data.officials[3].phones);
        $("#senator2Address").html(data.officials[3].address);
       // $("#senator2Image").html(data.officials[3].photoUrl);
        
        //Governor
        $("representativeName").html(data.divisions[data.offices[3].divisionId].name);
        $("#representativeName").html(data.officials[4].name);
       $("#representativeWebSite").html(data.officials[4].urls);
        $("#representativeParty").html(data.officials[4].party);
        $("#representativePhoneNumber").html(data.officials[4].phones);
        $("#representativeFB").html(data.officials[4].channels[0].id);
        $("#representativeTwitter").html(data.officials[4].channels[1].id);
        $("#representativeYouTube").html(data.officials[4].channels[2].id);
       $("#representativeGooglePlus").html(data.officials[4].channels[3].id);
       //$("#governorImage").html(data.officials[4].photoUrl);
    	} else {
    		//Washington DC
    		alert("Taxation Without Representation");
    		$("#senator1").html("Washington D.C. has no Sentators");
    	}
    }).fail(function (xhr, status, error) {
        console.log(error);
    });
});