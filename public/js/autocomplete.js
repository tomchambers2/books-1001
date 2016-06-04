$(document).on('ready', function() {
	var autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'), {types: ['geocode']});

	autocomplete.addListener('place_changed', function() {
		var place = autocomplete.getPlace();

		console.log(place.geometry.location)

		document.getElementById('geo_location_lat').value = autocomplete.getPlace().geometry.location.lat()
		document.getElementById('geo_location_lng').value = autocomplete.getPlace().geometry.location.lng()
	});
});
