function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  if (element) {
    var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
  }
}


function parseResultsByType(results,type) {
  for (let i in results) {
   var component = results[i];
   if (results[i].types.includes(type)) {
    return results[i].long_name
   }
  }
}

function onPlaceChanged() {
  let place = this.getPlace();
  let results = place.address_components;
  document.getElementById('route').value = (parseResultsByType(results,'street_number') + ' ' || '')  + parseResultsByType(results,'route');
  document.getElementById('locality').value = parseResultsByType(results,'locality') || '';
  document.getElementById('postal_code').value = parseResultsByType(results,'postal_code') || '';
  document.getElementById('country').value = parseResultsByType(results,'country') || '';
}


function parseResultsByType(results,type) {
  for (let i in results) {
   var component = results[i];
   if (results[i].types.includes(type)) {
    return results[i].long_name
   }
  }
}


function autocomplete () {
google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('route');
});
}

export { autocomplete };
