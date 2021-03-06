var map;
var localSearch = new GlocalSearch();


function processAndRedirect(lat,lng) {
    window.location.replace("http://localhost:3000/?lat=" + 
        lat + "&lng=" + 
        lng + "&length_of_stay=" + 
        $("#length_of_stay_select :selected").val());
}

function usePointFromPostcode(postcode, callbackFunction) {
	
	localSearch.setSearchCompleteCallback(null, 
		function() {
			
			if (localSearch.results[0])
			{	
				var resultLat = localSearch.results[0].lat;
				var resultLng = localSearch.results[0].lng;
				//var point = new GLatLng(resultLat,resultLng);
				processAndRedirect(resultLat,resultLng);
			}else{
				alert("Postcode not found!");
			}
		});	
		
	localSearch.execute(postcode + ", UK");
}


