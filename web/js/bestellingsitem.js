/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function() { 
    findAllProducts(); 
}); 

function findAllProducts() { 
    console.log('findAllProducts'); 
  $.ajax({ 
    type: 'GET', 
    url: rootURL + "/product", 
    dataType: "json", // data type of response 
    error: function() { 
                    console.log("Error"); 
                }, 
    success: function(data) { 
        addProductenToDropdown(data); 
    } 
  }); 
} 

function addProductenToDropdown(producten) { 
    $.each(producten, function(index, product) { 
        $("#productNaam").append("<option value='" + product.id +"' >" + product.name + "</option>"); 
    }); 
    if ($('#productId').val() !== "") 
        select_option(); 
    else 
        return false; 
} 

function select_option() { 
    return $('span#productNaam select option[value="' + $('#productId').val() + '"]').html(); 
}
