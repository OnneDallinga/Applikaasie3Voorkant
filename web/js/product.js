var rootURL = "http://localhost:8080/Appikaasie/REST";

$(document).ready(function() {
//    findAllProducts();
    checkHref();
    showCorrectButton();
});

$('#btnSave').click(function() {
	if ($('#productId').val() === '')
		addProduct();
	else
		updateProduct();
	return false;
});

$('#btnActiveer').click(function() {
	//TODO implementeer artikel activeren
});

$('#btnDeactiveer').click(function() {
	//TODO implementeer artikel deactiveren
});

//$('#btnDelete').click(function() {
//	deleteProduct();
//	return false;
//});

//Laat de activerings- of deactiveringsknop zien afhankelijk van de productStatus
//(een nieuw product/leeg formulier verstopt beide knoppen)
function showCorrectButton() {    
    var activeerbutton = document.getElementById("btnActiveer");
    var deactiveerbutton = document.getElementById("btnDeactiveer");
    var productStatus = $('#productStatus').val();
    
    if (productStatus !== null)
        if (productStatus === 0)
            deactiveerbutton.style.display = 'none';
        else
            activeerbutton.style.display = 'none';
    else
        deactiveerbutton.style.display = 'none';
        activeerbutton.style.display = 'none';
}

function checkHref() {
    var query = window.location.search.substring(1);
    if (query !== "") {
        var productId = query.substr(3);
        console.log(productId);
        findProductById(productId);
    } else {
        return 0;
    }
}

function fillFormWithProduct(data) {
    var inputs = Array.prototype.slice.call(document.querySelectorAll('form input'));

        Object.keys(data).map(function (dataItem) {
          inputs.map(function (inputItem) {
            return (inputItem.name === dataItem) ? (inputItem.value = data[dataItem]) : false;
          });
        });
    
}

//function findAllProducts() {
//    console.log('findAllProducts');
//	$.ajax({
//		type: 'GET',
//		url: rootURL + "/product",
//		dataType: "json", // data type of response
//		error: function() {
//                    console.log("Error");
//                },
//                success: function(data) {
//                    addArtikelenToList(data);
//                }
//	});
//}

//function addArtikelenToList(artikelen) {
//    var node = document.getElementById("artikelen");
//    while (node.firstChild) {
//        node.removeChild(node.firstChild);
//    }
//    $.each(artikelen, function(index, artikel) {
//        $("#artikelen").append("<li> <a href=./product.jsp?id=" + artikel.id + ">" + artikel.name + "</a></li>"); 
//    });
//}

function findProductByName(searchKey) {
	console.log('findProductByName: ' + searchKey);
	$.ajax({
		type: 'GET',
		url: rootURL + '/search/' + searchKey,
		dataType: "json",
		success: renderList 
	});
}

function findProductById(searchKey) {
	console.log('findProductById: ' + searchKey);
	$.ajax({
		type: 'GET',
		url: rootURL + '/product/' + searchKey,
		dataType: "json",
		error: function() {
                    console.log("Error");
                },
                success: function(data) {
                    fillFormWithProduct(data);
                } 
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
		url: rootURL + "/product",
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
//        findAllProducts();
        
}

function updateProduct() {
	console.log('updateProduct');
	$.ajax({
		type: 'PUT',
		contentType: 'application/json',
		url: rootURL + '/product/' + $('#productId').val(),
		dataType: "json",
		data: formToJSON(),
		success: function(data, textStatus, jqXHR){
                    alert('Product updated successfully');
		},
		error: function(jqXHR, textStatus, errorThrown){
                    alert('updateProduct error: ' + textStatus);
		}
	});
//    findAllProducts();
    checkHref();    
}

function deleteProduct() {
	console.log('deleteProduct');
	$.ajax({
		type: 'DELETE',
		url: rootURL + '/product/' + $('#productId').val(),
		success: function(data, textStatus, jqXHR){
			alert('Product deleted successfully');
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert('deleteProduct error');
		}
	});
}

