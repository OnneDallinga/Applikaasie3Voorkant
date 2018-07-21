<%-- 
    Document   : adresFormulier
    Created on : Jul 20, 2018, 3:01:53 PM
    Author     : marko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="form" class="form-signin">
            <h2 class="form-signin-heading">Invullen:</h2>
            <div class="form-group">
                <div class="row">    
                    <select name="addressType" id="addressType">
                        <option value="1">woonadres</option>
                        <option value="2">zendadres</option>
                        <option value="3">rekeningadres</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label for="streetname">Straatnaam</label>
                    <input type="text" name="streetname" id="streetname" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label for="number">Nummer</label>
                    <input type="text" name="number" id="number" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label for="postalcode">Postcode</label>
                    <input type="text" name="postalcode" id="postalcode" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label for="city">Stad</label>
                    <input type="text" name="city" id="city" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <button type="submit" id="submit" class="btn btn-primary btn-lg">Submit</button>
                </div>
            </div>
        </form>
        <script> 
            $(document).ready(function(){
                var pageUrl = window.location.search.substring(1);
                var customerId = findCustomerId(pageUrl);
                var customerObj = {};
               $("#form").submit(function(e) {
                    var data = {};
                    $.each(this, function(i, v) {
                        var input = $(v);
                        data[input.attr("name")] = input.val();
                        delete data["undefined"];
                    });
                    if(checkAdres(data.addresType, customerId)) {
                        alert("Adres type: " + data.addresType + " is al aanwezig");
                        window.location.assign("/Applikaasie3Voorkant/adresOverzicht.jsp");
                    };
                    $.get("http://localhost:8080/Appikaasie/REST/customer" + customerId, function(customerData,status) {
                        alert("customerData: "+ customerData.firstName + " " +customerData.id);
                        customerObj = {voornaam: customerData.firstName, achternaam: customerData.lastName, toevoegsel: customerData.toevoegsel, email: customerData.email, id: customerData.id}
                    });
                    data.customerId = customerObj;
                    $.ajax({    
                        contentType: 'application/json',
                        type: "post", 
                        url: "http://localhost:8080/Appikaasie/REST/address", 
                        dataType: 'json', 
                        data: JSON.stringify(data), 
                        success: function () {           
                            alert("Adres opgeslagen!");
                        },
                        error: function () {
                            alert("Er is iets misgegaan!");
                        },
                        complete: function () {
                            window.location.assign("/Applikaasie3Voorkant/adresOverzicht.jsp");
                        }
                    });
                });
                function findCustomerId(pageUrl) {
                    var urlVariables = pageUrl.split('&');
                    for(var i = 0; i < urlVariables.length; i++) {
                        var urlVariable = urlVariables[i].split('=');
                        if (urlVariable[0] == "customerId") {
                            return urlVariable[1];
                        }
                    }
                    return "undefined";
                }
                
                function checkAdres(addressType, costumerId) {
                    $.get("http://localhost:8080/Appikaasie/REST/customer", function(data,status) {
                        $.each(data, function(index, field) {
                            if(field.customerId == customerId || field.addressType == addressType) {
                               return true;
                            }
                        });
                    });
                    return false;
                };
            });
        </script>
    </body>
</html>
