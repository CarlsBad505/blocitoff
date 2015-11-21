//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

var blocmetrics = {};
  blocmetrics.report = function(event){
    var event = {event: { name: event}};
    var request = new XMLHttpRequest();
    request.open("POST", "https://bloc-foundation-carlsbad505.c9.io:8081/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  };