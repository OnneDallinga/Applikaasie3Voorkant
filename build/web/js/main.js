/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


// The root URL for the RESTful services
// TODO: Make sure this works
var rootURL = "http://localhost:8080/restresource";

var currentArtikel;


$("#login-link").click(function() {
    console.log("click");
    
    if($("#login-panel").is(":hidden")) {
        $("#login-panel").show();
    }
    if($("#loging-panel").is(":visible")) {
        $("#login-panel").hide();
    }
    var isVisible = $("#login-panel").is(":visible");
    console.log ('isVisible:',isVisible);
    
    
});


$(document).keydown(function (e) {
    if (e.keyCode == 27) {
        $("#login-panel").hide(0);
    }
});