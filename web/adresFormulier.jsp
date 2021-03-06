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
                $.get("http://localhost:8080/Appikaasie/REST/customer/" + customerId , function(customerData, status) {
                        alert("customerData: "+ customerData.firstName + " " +customerData.id);
                        customerObj = {voornaam: customerData.firstName, achternaam: customerData.lastName, toevoegsel: customerData.toevoegsel, email: customerData.email, id: customerData.id}
                        customerObj.addressCollection = [];
                });       
                $("#form").submit(function(e) {
                    var data = {};
                    $.each(this, function(i, v) {
                        var input = $(v);
                        data[input.attr("name")] = input.val();
                        delete data["undefined"];
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
                            doAjaxForCostumer(data);
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
                /**
                function doAjaxForCostumer(data) {
                    customerObj.addressCollection[customerObj.addressCollection.length] = data;
                    $.ajax({    
                        contentType: 'application/json',
                        type: "put", 
                        url: "http://localhost:8080/Appikaasie/REST/customer/" + customerId, 
                        dataType: 'json', 
                        data: JSON.stringify(customerObj), 
                        success: function () {           
                            alert("gewjzigd met succes!");
                            //window.location.assign("/Applikaasie3Voorkant/adresOverzicht.jsp");
                            window.open("/adresOverzicht.jsp", "_self");
                        },
                        error: function () {
                            alert("er is iets misgegaan!");
                            //window.location.assign("/Applikaasie3Voorkant/adresOverzicht.jsp");
                            window.open("/adresOverzicht.jsp", "_self");
                        },
                        complete: function () {
                            //window.location.assign("/Applikaasie3Voorkant/adresOverzicht.jsp");
                            window.open("/adresOverzicht.jsp", "_self");
                        }
                    });
                };*/
            });
        </script>
    </body>
</html>
