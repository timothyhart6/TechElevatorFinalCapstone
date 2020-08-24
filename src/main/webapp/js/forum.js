$(document).ready(function () {

	
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
    		$("#senator1").html(data.officials[2].name);
    		$("#senator2").html(data.officials[3].name);
    		$("#representativeName").html(data.officials[4].name);
    	} else {
    		//Washington DC
    		alert("Taxation Without Representation");
    		$("#senator1").html("Washington D.C. has no Sentators");
    	}
    }).fail(function (xhr, status, error) {
        console.log(error);
    });
});