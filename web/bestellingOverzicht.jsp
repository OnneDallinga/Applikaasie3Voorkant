<%-- 
    Document   : bestellingOverzicht
    Created on : Jul 20, 2018, 10:18:02 AM
    Author     : filip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bestellingenoverzicht</title>
    </head>
    <body>
        <div id="bestellingOverzicht"></div>
    </body>
    <script>
        var tabledata = [];
       $("#bestellingOverzicht").tabulator({
            height:650, 
            layout:"fitColumns", 
            columns:[ //Define Table Columns
                {title:"Geplaatst op", field:"date_time"},
                {title:"Status", field:"order_status"},
                {title:"Totaalprijs", field:"total_price"},
                {title:"Klant ID", field:"customer_id"},
                {title:"Id", field:"id"}
            ],
            rowClick:function(e, row){ 
                var date_time = row.getData().date_time;
                var order_status = row.getData().order_status;
                var total_price = row.getData().total_price;        
                var customer_id = row.getData().customer_id;
                var id = row.getData().id;
                window.open("bestellingDetails.jsp?id=" + id);  
            },
        });
        $.get("http://localhost:8080/Appikaasie/REST/order1", function(data,status) {
            console.log("status: " + status)    
            console.log("data: " + data);
            $.each(data, function(index, field) {
                var obj = {date_time: field.date_time, order_status: field.order_status, total_price: field.total_price, customer_id: field.customer_id, id: field.id}
                tabledata.push(obj);
            });
            $("#bestellingOverzicht").tabulator("setData", tabledata);
        });
    </script>    
</html>
