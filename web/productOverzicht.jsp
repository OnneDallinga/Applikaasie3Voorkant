<%-- 
    Document   : productOverzicht
    Created on : Jul 19, 2018, 3:29:13 PM
    Author     : filip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productenoverzicht</title>
    </head>
    <body>
        <div id="productOverzicht"></div>
    </body>
    <script>
        var tabledata = [];
       $("#productOverzicht").tabulator({
            height:650, 
            layout:"fitColumns", 
            columns:[ //Define Table Columns
                {title:"Naam", field:"name"},
                {title:"Prijs", field:"price"},
                {title:"Aantal", field:"stock"},
                {title:"Status", field:"productStatus"},
                {title:"Id", field:"id"}
            ],
            rowClick:function(e, row){ 
                var name = row.getData().name;
                var price = row.getData().price;
                var stock = row.getData().stock;        
                var productStatus = row.getData().productStatus;
                var id = row.getData().id;
                window.open("productDetails.jsp?id=" + id);  
            },
        });
        $.get("http://localhost:8080/Appikaasie/REST/product", function(data,status) {
            console.log("status: " + status)    
            console.log("data: " + data);
            $.each(data, function(index, field) {
                var obj = {name: field.name, price: field.price, stock: field.stock, productStatus: field.productStatus, id: field.id}
                tabledata.push(obj);
            });
            $("#productOverzicht").tabulator("setData", tabledata);
        });
    </script>    
</html>

