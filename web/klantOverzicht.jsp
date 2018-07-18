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
       //create Tabulator on DOM element with id "example-table"
       $("#klantOverzicht").tabulator({
            height:205, 
            layout:"fitColumns", 
            columns:[ //Define Table Columns
                {title:"Voornaam", field:"voornaam", width:150},
                {title:"Achternaam", field:"achternaam"},
                {title:"Email", field:"email"},
            ],
            rowClick:function(e, row){ //trigger an alert message when the row is clicked
                alert("Row " + row.getData().id + " Clicked!!!!");
            },
        });
        
        $.get("http://localhost:8080/Appikaasie/REST/customer", function(data,status) {
            console.log("status: " + status)    
            console.log("data: " + data);
            $.each(data, function(index, field) {
                console.log(field.firstName);
                var obj = {voornaam: field.firstName, achternaam: field.lastName, email: field.email}
                tabledata.push(obj);
            });
            $("#klantOverzicht").tabulator("setData", tabledata);
        });
        
        
        
        //define some sample data
    /**    
    var tabledata = [
            {voornaam:"marko", achternaam:"med", email:"medjedo@gmail.com"},
            {voornaam:"filip", achternaam:"ved", email:"filip@gmail.com"},
        ];*/

        //load sample data into the table
        
    </script>    
</html>
