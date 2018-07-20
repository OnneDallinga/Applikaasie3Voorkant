<%-- 
    Document   : product
    Created on : Jul 13, 2018, 3:50:48 PM
    Author     : Onne
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/applikaasie.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/tabulator/3.5.3/css/tabulator.min.css" rel="stylesheet">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tabulator/3.5.3/js/tabulator.min.js"></script>
        <title>Product Details</title>
    </head>
    <body>

        

        <form id="productForm">
            <div class="mainArea">
                <%--  add/edit product here --%>

                <label>Id:</label>
                <input id="productId" name="id" type="text" disabled />
                
                <label>Status:</label>
                <input id="productStatus" name="productStatus" type="text" disabled />

                <label>Naam:</label>
                <input type="text" id="name" name="name" required>

                <label>Prijs:</label>
                <input type="text" id="price" name="price" required/>

                <label>Voorraad:</label>
                <input type="text" id="stock" name="stock" required/>

                <button id="btnSave">Opslaan</button>
                <button id="btnActiveer">Activeer</button>
                <button id="btnDeactiveer">Deactiveer</button>
                <button id="btnReset" type="reset" value="Reset">Reset</button>

            </div>
        </form>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/product.js"></script>
    </body>
    

</html>