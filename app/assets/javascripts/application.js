var blocmetrics = {};
  blocmetrics.report = function(items){
    var event = {event: { name: items}};
    var request = new XMLHttpRequest();
    request.open("POST", "https://bloc-foundation-carlsbad505.c9.io:8081/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  };
  
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
