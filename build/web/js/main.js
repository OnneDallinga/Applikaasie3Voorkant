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

$('#btnSave').click(function() {
	if ($('#productId').val() == '')
		addProduct();
	else
		updateProduct();
	return false;
});

$('#btnDelete').click(function() {
	deleteProduct();
	return false;
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
	$('#productId').val(product.id);
	$('#name').val(product.name);
        $('#price').val(product.price);
        $('#stock').val(product.stock);
        $('#productStatus').val(product.productStatus);
}

function formToJSON() {
	var productId = $('#productId').val();
	return JSON.stringify({
		"id": productId == "" ? null : productId, 
		"name": $('#name').val(), 
                "price": $('#price').val(),
                "stock": $('#stock').val(),
                "productStatus": $('productStatus').val()
		});
}

function addProduct() {
	console.log('addProduct');
	$.ajax({
		type: 'POST',
		contentType: 'application/json',
		url: "http://localhost:8080/Appikaasie/REST/product",
		dataType: "json",
		data: formToJSON(),
		success: function(data, textStatus, jqXHR){
			alert('Product created successfully');
			$('#btnDelete').show();
			$('#productId').val(data.id);
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert('addProduct error: ' + textStatus);
		}
	});
}

function updateProduct() {
	console.log('updateProduct');
	$.ajax({
		type: 'PUT',
		contentType: 'application/json',
		url: rootURL + '/' + $('#productId').val(),
		dataType: "json",
		data: formToJSON(),
		success: function(data, textStatus, jqXHR){
			alert('Product updated successfully');
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert('updateProduct error: ' + textStatus);
		}
	});
}

function deleteProduct() {
	console.log('deleteProduct');
	$.ajax({
		type: 'DELETE',
		url: rootURL + '/' + $('#productId').val(),
		success: function(data, textStatus, jqXHR){
			alert('Product deleted successfully');
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert('deleteProduct error');
		}
	});
}
