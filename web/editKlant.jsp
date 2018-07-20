<%-- 
    Document   : editKlant
    Created on : Jul 19, 2018, 1:59:33 PM
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
                    <label for="firstName">Voornaam</label>
                    <input type="text" name="firstName" id="voornaam" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label for="lastName">Achternaam</label>
                    <input type="text" name="lastName" id="achternaam" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label for="lastNamePrefix">Toevoegsel</label>
                    <input type="text" name="lastNamePerfix" id="toevoegsel" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <input type="hidden" name="id" id="id" class="form-control"  />
                </div>
            </div>
            <button type="submit" id="submit" class="btn btn-primary btn-lg">Submit</button>
        </form>
        
    </body>
    <script>
        var id;
        var pageUrl = window.location.search.substring(1);
        var urlVariables = pageUrl.split('&');
        for(var i = 0; i < urlVariables.length; i++) {
            var urlVariable = urlVariables[i].split('=');
            if(urlVariable[1] != "undefined" || urlVariable[1] != null) {
                document.getElementById(urlVariable[0]).value = urlVariable[1];
            } 
        }      
        $("#form").submit(function(e) {
            var frm = $("#form");
            var data = {};
            var id;
            $.each(this, function(i, v) {
                var input = $(v);
                data[input.attr("name")] = input.val();
                delete data["undefined"];
            });
            id = data.id;
            $.ajax({ 
                contentType: 'application/json',
                type: "put", 
                url: "http://localhost:8080/Appikaasie/REST/customer/" + id, 
                dataType: 'json', 
                data: JSON.stringify(data), 
                success: function () {           
                    alert("gewjzigd met succes!");
                },
                error: function () {
                    alert("er is iets misgegaan!");
                }
            });
        });
    </script>

</html>
