<%-- 
    Document   : klantOverzicht
    Created on : Jul 18, 2018, 12:56:30 PM
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
        <div id="klantOverzicht"></div>
    </body>
    <script>
        var tabledata = [];
       $("#klantOverzicht").tabulator({
            height:350, 
            layout:"fitColumns", 
            columns:[ //Define Table Columns
                {title:"Voornaam", field:"voornaam"},
                {title:"Achternaam", field:"achternaam"},
                {title:"Toevoegsel", field:"toevoegsel"},
                {title:"Email", field:"email"},
                {title:"Id", field:"id"}
            ],
            rowClick:function(e, row){ 
                var voornaam = row.getData().voornaam;
                var achternaam = row.getData().achternaam;
                var toevoegsel = row.getData().toevoegsel;        
                var email = row.getData().email;
                var id = row.getData().id;
                window.open("klantDetails.jsp?voornaam=" + voornaam + "&achternaam=" + achternaam + "&toevoegsel=" + toevoegsel +"&email=" + email + "&id=" + id, "_self");  
            },
        });
        $.get("http://localhost:8080/Appikaasie/REST/customer", function(data,status) {
            console.log("status: " + status)    
            console.log("data: " + data);
            $.each(data, function(index, field) {
                var obj = {voornaam: field.firstName, achternaam: field.lastName, toevoegsel: field.toevoegsel, email: field.email, id: field.id}
                tabledata.push(obj);
            });
            $("#klantOverzicht").tabulator("setData", tabledata);
        });
    </script>    
</html>
