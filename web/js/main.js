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

function findAllProducts() {
    console.log('findAllProducts');
	$.ajax({
		type: 'GET',
		url: rootURL,
		dataType: "json", // data type of response
		success: renderList
	});
}

function findProductByName(searchKey) {
	console.log('findProductByName: ' + searchKey);
	$.ajax({
		type: 'GET',
		url: rootURL + '/search/' + searchKey,
		dataType: "json",
		success: renderList 
	});
}

function renderDetails(product) {
	$('#wineId').val(product.id);
	$('#name').val(product.name);
        $('#price').val(product.price);
        $('#stockQuantity').val(product.stockQuantity);
        $('#productStatus').val(product.productStatus);
}

function formToJSON() {
	var productId = $('#productId').val();
	return JSON.stringify({
		"id": productId == "" ? null : productId, 
		"name": $('#name').val(), 
                "price": $('#price').val(),
                "stockQuantity": $('stockQuantity').val(),
                "productStatus": $('productStatus').val()
		});
}