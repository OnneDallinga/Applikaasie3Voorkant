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
                <div class="col-lg-4">
                    <label for="firstName">Voornaam</label>
                    <input type="text" name="firstName" id="firstName" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-4">
                    <label for="lastName">Achternaam</label>
                    <input type="text" name="lastName" id="lastName" class="form-control"  />
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-4">
                    <label for="lastNamePrefix">Toevoegsel</label>
                    <input type="text" id="lastNamePrefix" class="lastNamePrefix"  />
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-4">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" class="form-control"  />
                </div>
            </div>
            <button type="submit" id="submit" class="btn btn-primary btn-lg">Submit</button>
        </form>
        <script>
            /**
            $(document).ready(function() {
                $("button").click(function() {
                    var formData = {
                                        "firstName": $("#voornaam").val(),
                                        "lastName": $("#achternaam").val(),
                                        "email": $("#email").val()
                                    }
                    var formDataJson = JSON.stringify(formData);
                    console.log(formDataJson);
                    $.post("http://localhost:8080/Appikaasie/REST/customer",formDataJson);
                });
            })*/                             
            $(document).ready(function(){
                // click on button submit
               $("#form").submit(function(e) {
                    
                    /**          
                    var data = {
                                        "firstName": $("#firstName").val(),
                                        "lastName": $("#lastName").val(),
                                        "email": $("#email").val()
                                }*/
                    
                    var frm = $("#form");
                    var data = {};
                    $.each(this, function(i, v) {
                        var input = $(v);
                        data[input.attr("name")] = input.val();
                        delete data["undefined"];
                    })
                    
                    $.ajax({
                        
                        contentType: 'application/json',
                        type: "post", 
                        url: "http://localhost:8080/Appikaasie/REST/customer", 
                        dataType: 'json', 
                        data: JSON.stringify(data), 
                        success: function () {           
                            $(this).html("Success!");
                        },
                        error: function () {
                            $(this).html("Error!");
                        }
                        
                    });
                });
            });
        </script>
    </body>
</html>
