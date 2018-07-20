<%-- 
    Document   : bestellingDetails
    Created on : Jul 20, 2018, 10:18:33 AM
    Author     : filip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/applikaasie.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/tabulator/3.5.3/css/tabulator.min.css" rel="stylesheet">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tabulator/3.5.3/js/tabulator.min.js"></script>
        <title>Bestelling Details</title>
    </head>
    <body>

        

        <form id="orderForm">
            <div class="mainArea">
                <%--  add/edit product here --%>

                <label>Id:</label>
                <input id="bestellingId" name="id" type="text" disabled />
                
                <label>Geplaatst op:</label>
                <input id="dateTime" name="dateTime" type="text" disabled />

                <label>Klant:</label>
                <input type="text" id="klantId" name="klantId" disabled>

                <label>Totaalprijs:</label>
                <input type="text" id="totalPrice" name="totalPrice" disabled/>

                <label>Status</label>
                <input type="text" id="orderStatus" name="orderStatus" disabled/>
                
                <div id="bestellingsItemOverzicht"></div>
                
                <button id="btnSave">Opslaan</button>
                <button id="btnDelete">Verwijderen</button>
                <button id="btnReset" type="reset" value="Reset">Reset</button>
            </div>
        </form>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bestelling.js"></script>
        <script>
                var tabledata = [];
               $("#bestellingsItemOverzicht").tabulator({
                    height:650, 
                    layout:"fitColumns", 
                    columns:[ //Define Table Columns
                        {title:"Product", field:"product_id"},
                        {title:"Aantal", field:"amount"},
                        {title:"Subtotaal", field:"sub_total"},
                        {title:"Order Id", field:"order_id"},
                        {title:"Id", field:"id"}
                    ],
                    rowClick:function(e, row){ 
                        var product_id = row.getData().product_id;
                        var amount = row.getData().amount;
                        var sub_total = row.getData().sub_total;        
                        var order_id = row.getData().order_id;
                        var id = row.getData().id;
                        window.open("bestellingsItemDetails.jsp?id=" + id);  
                    },
                });
                $.get("http://localhost:8080/Appikaasie/REST/orderitem", function(data,status) {
                    console.log("status: " + status)    
                    console.log("data: " + data);
                    $.each(data, function(index, field) {
                        var obj = {product_id: field.product_id, amount: field.amount, sub_total: field.sub_total, order_id: field.order_id, id: field.id}
                        tabledata.push(obj);
                    });
                    $("#bestellingsItemOverzicht").tabulator("setData", tabledata);
                });
            </script>
    </body>
    

</html>
