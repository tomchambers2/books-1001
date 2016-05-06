

// function initMap() {
// 	console.log('mapping')

$(document).ready(function() {
	console.log($('#map').data());

	console.log('calling')
	var map;
	map = new google.maps.Map(document.getElementById('map'), {
	  center: {lat: -34.397, lng: 150.644},
	  zoom: 8
	});

	console.log(document.getElementById('map'))
	
})
// }