<%-- 
    Document   : bestellingsItemDetails
    Created on : Jul 20, 2018, 10:55:34 AM
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
        <title>Bestellingsitem Details</title>
    </head>
    <body>

        <form id="orderItemForm" class="form-signin">

            <%--  add/edit product here --%>

            <div class="form-group"> 
                <div class="row"> 
                    <label>Product:</label> 
                    <input type="text" id="productId" name="productId" disabled hidden> 
                    <select type="text" id="productNaam" name="product" > 
                        <option>Kies een product</option>
                    </select> 
                </div> 
            </div>    

            <div class="form-group"> 
                <div class="row">
                    <label>Aantal:</label>
                    <input id="amount" name="amount" type="text" required class="form-control"/>
                </div>
            </div> 

            <div class="form-group"> 
                <div class="row">
                    <label>Subtotaal:</label>
                    <input type="text" id="sub_total" name="sub_total" required disabled class="form-control">
                </div>
            </div> 

            <input type="text" id="order_id" name="order_id" disabled hidden/>

            <input type="text" id="id" name="id" disabled hidden/>

            <button id="btnSave" class="btn btn-primary btn-sm" type="button">Opslaan</button>
            <button id="btnDelete" class="btn btn-primary btn-sm" type="button">Verwijderen</button>
            <button id="btnReset" class="btn btn-primary btn-sm"type="reset" value="Reset">Reset</button>

        </form>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bestellingsitem.js"></script>
    </body>
</html>
