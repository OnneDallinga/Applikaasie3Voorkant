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
        <title>Bestelling Details</title>
    </head>
    <body>

        

        <form id="orderForm" class="form-signin"> 
            <div class="mainArea"> 
                <%--  add/edit product here --%> 
 
                
                <input id="bestellingId" name="id" type="text" disabled hidden/> 
                
                 
                <div class="form-group"> 
                <div class="row"> 
                <label>Geplaatst op:</label> 
                <input id="dateTime" name="dateTime" type="text" disabled /> 
                </div> 
                </div> 
 
                <div class="form-group"> 
                <div class="row"> 
                <label>Klant:</label> 
                <input type="text" id="klantId" name="klantId" disabled hidden> 
                <select type="text" id="klantNaam" name="Klant" > 
                    <option>Kies een klant</option>
                </select> 
                </div> 
                </div> 
 
                
 
                <div class="form-group"> 
                <div class="row"> 
                <label>Status</label> 
                <input type="text" id="orderStatus" name="orderStatus" disabled/> 
                </div> 
                </div> 
                
                <h2>Inhoud van bestelling:</h2>
                
                <div id="bestellingsItemOverzicht"></div>
                
                <div class="form-group"> 
                <div class="row"> 
                <label>Totaalprijs:</label> 
                <input type="text" id="totalPrice" name="totalPrice" disabled/> 
                </div> 
                </div> 
                
                <button id="btnNieuweBestelRegel" class="btn btn-primary btn-lg">Product(en) toevoegen</button>
                <button id="btnSave" class="btn btn-primary btn-lg">Opslaan</button>
                <button id="btnDelete" class="btn btn-primary btn-lg">Verwijderen</button>
                <button id="btnReset" type="reset" value="Reset" class="btn btn-primary btn-lg">Reset</button>
            </div>
        </form>
        <script src="js/bestelling.js"></script>
        <script>
                $('#bbtnNieuweBestelRegel').click(function() {
                           var order_id = $('#bestellingId').val();
                           window.location = "bestellingsItemDetails.jsp?bestelling=" + order_id;
                });
                
               var tabledata = [];
               $("#bestellingsItemOverzicht").tabulator({
                    height:325, 
                    layout:"fitColumns", 
                    columns:[ //Define Table Columns
                        {title:"Product", field:"productId"},
                        {title:"Aantal", field:"amount"},
                        {title:"Subtotaal", field:"subTotal"},
                        {title:"Order Id", field:"orderId", visible:false},
                        {title:"Id", field:"id", visible:false}
                    ],
                    rowClick:function(e, row){ 
//                        var product_id = row.getData().product_id;
//                        var amount = row.getData().amount;
//                        var sub_total = row.getData().sub_total;        
//                        var order_id = row.getData().order_id;
                        var id = row.getData().id;
                        window.open("bestellingsItemDetails.jsp?id=" + id);  
                    },
                });
                $.get("http://localhost:8080/Appikaasie/REST/orderitem", function(data,status) {
                    console.log("status: " + status)    
                    console.log("data: " + data);
                    $.each(data, function(index, field) {
                        var obj = {productId: field.productId, amount: field.amount, subTotal: field.subTotal, orderId: field.orderId, id: field.id}
                        tabledata.push(obj);
                    });
                    $("#bestellingsItemOverzicht").tabulator("setData", tabledata);
                });
            </script>
    </body>
</html>