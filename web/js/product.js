var rootURL = "http://localhost:8080/Appikaasie/REST";

$(document).ready(function() {
//    findAllProducts();
    checkHref();
});

$('#btnSave').click(function() {
	if ($('#productId').val() === '')
		addProduct();
	else
		updateProduct();
	return false;
});

$('#btnActiveer').click(function() {
	productActiverenDeactiveren();
        return false;
});

$('#btnReset').click(function() {
	checkHref();
        return false;
});

$('#btnBack').click(function() {
           window.location = "productOverzicht.jsp";
});

$('#btnNieuwProduct').click(function() {
   window.location = "productDetails.jsp";
});

function productActiverenDeactiveren() {
        if ($('#productStatus').val() === '0') {
		
                console.log('productActiveren');
                $.ajax({
                        type: 'PUT',
                        contentType: 'application/json',
                        url: rootURL + '/product/' + $('#productId').val(),
                        dataType: "json",
                        data: activeerProductJSON(),
                        success: function(data, textStatus, jqXHR){
                            console.log('Product activated successfully');
                            location.reload(); 
                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            alert('updateProduct error: ' + textStatus);
                        }
                });
                
        } else {
		console.log('productDeactiveren');
                $.ajax({
                        type: 'PUT',
                        contentType: 'application/json',
                        url: rootURL + '/product/' + $('#productId').val(),
                        dataType: "json",
                        data: deactiveerProductJSON(),
                        success: function(data, textStatus, jqXHR){
                            console.log('Product deactivated successfully');
                            location.reload(); 
                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            alert('updateProduct error: ' + textStatus);
                        }
                });
        }
}

function activeerProductJSON() {
    return JSON.stringify({
            "id": $('#productId').val(), 
            "name": $('#name').val(), 
            "price": $('#price').val(),
            "stock": $('#stock').val(),
            "productStatus": "1"
    });
}

function deactiveerProductJSON() {
    return JSON.stringify({
            "id": $('#productId').val(), 
            "name": $('#name').val(), 
            "price": $('#price').val(),
            "stock": $('#stock').val(),
            "productStatus": "0"
    });
}

//$('#btnDelete').click(function() {
//	deleteProduct();
//	return false;
//});

//Laat de activerings- of deactiveringsknop zien afhankelijk van de productStatus
//(een nieuw product/leeg formulier verstopt beide knoppen)
//function showCorrectButton() {    
//    var productStatus = $('#productStatus').val();
//    
//    if (productStatus !== '') {
//        if (productStatus == "0")
//            $('#btnDeactiveer').hide();
//        else
//            $('#btnActiveer').hide();
//    } else {
//            $('#btnActiveer').hide();
//            $('#btnDeactiveer').hide();
//    }    
//}

function checkHref() {
    var query = window.location.search.substring(1);
    if (query !== "") {
        var productId = query.substr(3);
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
    if ($('#productStatus').val() === '0')
            $('#productStatusText').val("Inactief");
    else
            $('#productStatusText').val("Actief");
    return false;
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
                "productStatus": "1"
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

var tabledata = [];
$("#productOverzicht").tabulator({
    height:650, 
    layout:"fitColumns", 
    columns:[ //Define Table Columns
        {title:"Naam", field:"name"},
        {title:"Prijs", field:"price"},
        {title:"Aantal", field:"stock"},
        {title:"Status", field:"productStatus"},
        {title:"Id", field:"id", visible:false}
    ],
    rowClick:function(e, row){ 
        var name = row.getData().name;
        var price = row.getData().price;
        var stock = row.getData().stock;        
        var productStatus = row.getData().productStatus;
        var id = row.getData().id;
        window.location = "productDetails.jsp?id=" + id;  
    },
});

$.get("http://localhost:8080/Appikaasie/REST/product", function(data,status) {
    console.log("status: " + status)    
    console.log("data: " + data);
    $.each(data, function(index, field) {
        var obj = {name: field.name, 
                   price: field.price, 
                   stock: field.stock, 
                   productStatus: field.productStatus, 
                   id: field.id}
        console.log(obj.productStatus);
        if (obj.productStatus == "0")
            obj.productStatus = "Inactief";
        else
            obj.productStatus = "Actief";
        tabledata.push(obj);
    });
    
    $("#productOverzicht").tabulator("setData", tabledata);
});