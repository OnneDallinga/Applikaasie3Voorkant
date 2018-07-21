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
 
                <div class="form-group"> 
                <div class="row"> 
                <label>Id:</label> 
                <input id="bestellingId" name="id" type="text" disabled /> 
                </div> 
                </div> 
                 
                <div class="form-group"> 
                <div class="row"> 
                <label>Geplaatst op:</label> 
                <input id="dateTime" name="dateTime" type="text" disabled /> 
                </div> 
                </div> 
 
                <div class="form-group"> 
                <div class="row"> 
                <label>Klant:</label> 
                <input type="text" id="klantId" name="klantId" disabled> 
                <select type="text" id="klantNaam" name="Klant" > 
                    <option>Kies een klant</option>
                </select> 
                </div> 
                </div> 
 
                <div class="form-group"> 
                <div class="row"> 
                <label>Totaalprijs:</label> 
                <input type="text" id="totalPrice" name="totalPrice" disabled/> 
                </div> 
                </div> 
 
                <div class="form-group"> 
                <div class="row"> 
                <label>Status</label> 
                <input type="text" id="orderStatus" name="orderStatus" disabled/> 
                </div> 
                </div> 
                
                <div id="bestellingsItemOverzicht"></div>
                
                <button id="btnSave">Opslaan</button>
                <button id="btnDelete">Verwijderen</button>
                <button id="btnReset" type="reset" value="Reset">Reset</button>
            </div>
        </form>
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
