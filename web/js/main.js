/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


// The root URL for the RESTful services
// TODO: Make sure this works
var rootURL = "http://localhost:8080/restresource";

var currentArtikel;


$("#login-link").click(function () {
    $("#login-panel").show();
})

$(document).keydown(function (e) {
    if (e.keyCode == 27) {
        $("#login-panel").hide(0);
    }
});