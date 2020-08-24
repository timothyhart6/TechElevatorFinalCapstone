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
	
	let selectedState = getQueryVariable("locationName");
	
	//google's civic API
    var apiUrl = "https://www.googleapis.com/civicinfo/v2/representatives";
	
	//connects to the API and gets desired data
    $.ajax({
        url: apiUrl,
        data: {
        	address: selectedState,
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
        
        var website1 = $("<a>").attr("href", data.officials[2].urls); //senator 1 website hyperlink
        website1.attr("target","_blank").text(data.officials[2].urls);
        $("#senator1WebSite").append(website1);
        
        $("#senator1Party").html(data.officials[2].party); //senator 1 party affiliation
        
        $("#senator1PhoneNumber").html(data.officials[2].phones); //senator 1 phone number
        
        $("#senator1Address").html(data.officials[2].address); //senator 1 address

        
        $("#senator1Photo").attr("src", data.officials[2].photoUrl); // senator 1 photo
            	
    	//Senator #2
        $("#senator2").html(data.officials[3].name); //senator 2 name
        
        var website2 = $("<a>").attr("href", data.officials[3].urls); //senator 2 website hyperlink
        website2.attr("target","_blank").text(data.officials[3].urls);
        $("#senator2WebSite").append(website2); 
        
        
        $("#senator2Party").html(data.officials[3].party); //senator 2 party affiliation
        
        $("#senator2PhoneNumber").html(data.officials[3].phones); //senator 2 phone number
        
        $("#senator2Address").html(data.officials[3].address); //senator 2 address
        
        $("#senator2Photo").attr("src", data.officials[3].photoUrl); // senator 2 photo

        
        //Governor
        $("governorName").html(data.divisions[data.offices[3].divisionId].name);
        
        
        $("#governorName").html(data.officials[4].name);
        
        
        var website3 = $("<a>").attr("href", data.officials[4].urls); //governor website hyperlink
        website3.attr("target","_blank").text(data.officials[4].urls);
        $("#governorWebSite").append(website3); 
       
       
        $("#governorParty").html(data.officials[4].party);
        
        
        $("#governorPhoneNumber").html(data.officials[4].phones);
        
        var website4 = $("<a>").attr("href", data.officials[4].channels[0].id); //governor website hyperlink
        website4.attr("target","_blank").text(data.officials[4].channels[0].id);
        $("#governorFB").append(website4); 
        
        
        $("#governorTwitter").html(data.officials[4].channels[1].id);
        
        
        $("#governorYouTube").html(data.officials[4].channels[2].id);
        
        
       $("#governorGooglePlus").html(data.officials[4].channels[3].id);
       
       
       
       $("#governorPhoto").attr("src", data.officials[4].photoUrl); // state governor photo

    	} else {
    		//Washington DC
    		alert("Taxation Without Representation");
    		$("#senator1").html("Washington D.C. has no Sentators");
    	}
    }).fail(function (xhr, status, error) {
        console.log(error);
    });
});