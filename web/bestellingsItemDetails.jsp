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

        

        <form id="orderItemForm">
            <div class="mainArea">
                <%--  add/edit product here --%>

                <label>Product:</label>
                <input id="product_id" name="product_id" type="text" required />
                
                <label>Aantal:</label>
                <input id="amount" name="amount" type="text" required />

                <label>Subtotaal:</label>
                <input type="text" id="sub_total" name="sub_total" required>

                <label>Order Id:</label>
                <input type="text" id="order_id" name="order_id" disabled/>

                <label>Id:</label>
                <input type="text" id="id" name="id" disabled/>

                <button id="btnSave" class="btn btn-primary btn-lg" type="button">Opslaan</button>
                <button id="btnDelete" class="btn btn-primary btn-lg" type="button">Verwijderen</button>
                <button id="btnReset" class="btn btn-primary btn-lg"type="reset" value="Reset">Reset</button>

            </div>
        </form>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/product.js"></script>
    </body>
    

</html>
