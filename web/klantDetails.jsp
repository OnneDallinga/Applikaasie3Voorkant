<%-- 
    Document   : klantDetails
    Created on : Jul 19, 2018, 10:40:49 AM
    Author     : marko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>-->
    <body>
        <div class="container">
            <div>
                <h3>Klant info:</h3>
                <p class="text-left">Voornaam: <b><span id="voornaam"></span></b></p>
                <p class="text-left">Achternaam: <b><span id="achternaam"></span></b></p>
                <p class="text-left">Toevoegsel: <b><span id="toevoegsel"></span></b></p>
                <p class="text-left">Email: <b><span id="email"></span></b></p>
                <div class="btn-group align-left" >
                    <button type="button" class="btn btn-primary" id="editProfile">Edit profile</button>
                    <button type="button" class="btn btn-primary" id="adres">Adressen bekijken</button>
                    <button type="button" class="btn btn-primary" id="terug">Terug naar overzicht</button>
                </div>
            </div>
        </div>
    </body>
    <script>
        var id;
        var pageUrl = window.location.search.substring(1);
        var urlVariables = pageUrl.split('&');
        for(var i = 0; i < urlVariables.length; i++) {
            var urlVariable = urlVariables[i].split('=');
        if(urlVariable[0] == "id") {
            id = urlVariable[1]
        }else if(urlVariable[1] != "undefined") {
                document.getElementById(urlVariable[0]).innerHTML = urlVariable[1];
            } 
        }
        $("#editProfile").click(function() {
            var voornaam = document.getElementById("voornaam").textContent;
            var achternaam = document.getElementById("achternaam").textContent;
            var toevoegsel = document.getElementById("toevoegsel").textContent;
            var email = document.getElementById("email").textContent;
            window.open("editKlant.jsp?voornaam=" + voornaam + "&achternaam=" + achternaam + "&toevoegsel=" + toevoegsel + "&email=" + email + "&id=" + id, "_self");
        });
        $("#adres").click(function() {
            window.open("adresOverzicht.jsp?customerId=" + id, "_self");
        });
    </script>
</html>
