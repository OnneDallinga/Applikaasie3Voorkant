/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() { 
    findAllKlanten(); 
}); 

$('#btnNieuweBestelRegel').click(function() {
            window.location = "bestellingsItemDetails.jsp";

});

$('#btnNieuweBestelling').click(function() {
           window.location = "bestellingDetails.jsp";
});

$('#btnSave').click(function() {
	if ($('#productId').val() === '')
		addOrder();
	else
		updateOrder();
	return false;
});

function findAllKlanten() { 
    console.log('findAllKlanten'); 
  $.ajax({ 
    type: 'GET', 
    url: rootURL + "/customer", 
    dataType: "json", // data type of response 
    error: function() { 
                    console.log("Error"); 
                }, 
    success: function(data) { 
        addKlantnamenToDropdown(data); 
    } 
  }); 
} 

function addKlantnamenToDropdown(klanten) { 
    $.each(klanten, function(index, klant) { 
        $("#klantNaam").append("<option value='" + klant.id +"' >" + klant.lastName +  
                ", " + klant.firstName + " " + klant.lastNamePrefix + "</option>"); 
    }); 
    if ($('#klantId').val() !== "") 
        select_option(); 
    else 
        return false; 
} 

function select_option() { 
    return $('span#klantNaam select option[value="' + $('#klantId').val() + '"]').html(); 
}

function renderDetails(order) {
	$('#orderId').val(order.id);
	$('#dateTime').val(order.dateTime);
        $('#orderStatus').val(order.orderStatus);
        $('#totalPrice').val(order.totalPrice);
        $('#customerId').val(order.customerId);
}

function formToJSON() {
	var orderId = $('#orderId').val();
	return JSON.stringify({
		"id": orderId == "" ? null : orderId, 
		"dateTime": $('#dateTime').val(), 
                "orderStatus": $('#orderStatus').val(),
                "totalPrice": $('#totalPrice').val(),
                "customerId": $('#customerId').val()
		});
}

function addOrder() {
	console.log('addOrder');
	$.ajax({
		type: 'POST',
		contentType: 'application/json',
		url: rootURL + "/order1",
		dataType: "json",
		data: formToJSON(),
		success: function(data, textStatus, jqXHR){
			alert('Order created successfully');
			$('#btnDelete').show();
			$('#orderId').val(data.id);
                         
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert('addOrder error: ' + textStatus);
		}
	});
}

function updateOrder() {
	console.log('updateOrder');
	$.ajax({
		type: 'PUT',
		contentType: 'application/json',
		url: rootURL + '/order1/' + $('#orderId').val(),
		dataType: "json",
		data: formToJSON(),
		success: function(data, textStatus, jqXHR){
                    alert('Order updated successfully');
		},
		error: function(jqXHR, textStatus, errorThrown){
                    alert('updateOrder error: ' + textStatus);
		}
	});
    checkHref();    
}

function deleteOrder() {
	console.log('deleteOrder');
	$.ajax({
		type: 'DELETE',
		url: rootURL + '/order1/' + $('#orderId').val(),
		success: function(data, textStatus, jqXHR){
			alert('Order deleted successfully');
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert('deleteOrder error: ' + textStatus);
		}
	});
}

function checkHref() {
    //TODO: implement
}

//Tabulator stuff
var tabledata = [];
$("#bestellingsItemOverzicht").tabulator({
    height:325, 
    layout:"fitColumns", 
    columns:[ //Define Table Columns
        {title:"Product", field:"productId"},
        {title:"Aantal", field:"amount"},
        {title:"Subtotaal", field:"subTotal"},
        {title:"Order Id", field:"orderId", visible:false},
        {title:"Id", field:"id", visible:false}
    ],
    rowClick:function(e, row){ 
        var id = row.getData().id;
        window.open("bestellingsItemDetails.jsp?id=" + id);  
    },
});

$.get("http://localhost:8080/Appikaasie/REST/orderitem", function(data,status) {
    console.log("status: " + status)    
    console.log("data: " + data);
    $.each(data, function(index, field) {
        var obj = {productId: field.productId, amount: field.amount, subTotal: field.subTotal, orderId: field.orderId, id: field.id}
        tabledata.push(obj);
    });
    $("#bestellingsItemOverzicht").tabulator("setData", tabledata);
});

var tabledata2 = [];
$("#bestellingOverzicht").tabulator({
    height:650, 
    layout:"fitColumns", 
    columns:[ //Define Table Columns
        {title:"Geplaatst op", field:"date_time"},
        {title:"Klant", field:"customer_id_last_name"},
        {title:"Totaalprijs", field:"total_price"},
        {title:"Status", field:"order_status"},
        {title:"Klant ID", field:"customer_id", visible:false},
        {title:"Id", field:"id", visible:false}
    ],
    rowClick:function(e, row){ 
//                var date_time = row.getData().date_time;
//                var order_status = row.getData().order_status;
//                var total_price = row.getData().total_price;        
//                var customer_id = row.getData().customer_id;
        var id = row.getData().id;
        window.open("bestellingDetails.jsp?id=" + id);  
    },
});
$.get("http://localhost:8080/Appikaasie/REST/order1", function(data,status) {
    console.log("status bestelling: " + status)    
    console.log("data bestelling: " + data);
    $.each(data, function(index, field) {
        var obj = {date_time: field.date_time, 
                   order_status: field.order_status, 
                   total_price: field.total_price, 
                   customer_id: field.customer_id, 
                   id: field.id}
        tabledata2.push(obj);
    });
    $("#bestellingOverzicht").tabulator("setData", tabledata);
});