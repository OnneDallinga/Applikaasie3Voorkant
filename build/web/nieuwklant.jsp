<%-- 
    Document   : nieuwklant
    Created on : Jul 12, 2018, 12:10:35 PM
    Author     : marko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--<script src="js/customerRegister.js"></script>-->
        <title>JSP Page</title>
    </head>
    <body>
        <form id="form" class="form-signin">
            <h2 class="form-signin-heading">Invullen:</h2>
            <div class="form-group">
                <div class="row">
                    <label for="firstName">Voornaam</label>
                    <input type="text" name="firstName" id="firstName" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label for="lastName">Achternaam</label>
                    <input type="text" name="lastName" id="lastName" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label for="lastNamePrefix">Toevoegsel</label>
                    <input type="text" name="lastNamePerfix" id="lastNamePrefix" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" class="form-control"  />
                </div>
            </div>
            <input id="klantId" name="klantId" type="text" disabled hidden />
            <button id="btnAddKlant" class="btn btn-primary btn-lg">Submit</button>
        </form>
        
        <script> 
        
        $('#btnAddKlant').click(function() {
            console.log('buttonClicked');
            addKlant();
            document.getElementById("form").reset();
            return false;
        });
        
        function addKlant() {
            console.log('addKlant');
        
            $.ajax({
                    type: 'POST',
                    contentType: 'application/json',
                    url: "http://localhost:8080/Appikaasie/REST/customer",
                    dataType: "json",
                    data: formToJSON(),
                    success: function(data, textStatus, jqXHR){
                            alert('Klant correct ingevoegd');
                    },
                    error: function(jqXHR, textStatus, errorThrown){
                            alert('Fout: ' + textStatus);
                    }
            });
        }
        
        function formToJSON() {
            console.log('formToJSON');
            var klantId = $('#klantId').val();
            return JSON.stringify({
                    "id": klantId == "" ? null : klantId, 
                    "firstName": $('#firstName').val(), 
                    "lastName": $('#lastName').val(),
                    "lastNamePrefix": $('#lastNamePrefix').val(),
                    "email": $('#email').val()
            });
        }

        </script>