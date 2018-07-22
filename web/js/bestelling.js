/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() { 
    findAllKlanten(); 
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


