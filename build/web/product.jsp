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
        <title>Producten overzicht</title>
    </head>
    <body>

        <div class="leftArea">
            <ul id="artikelen"></ul>
        </div>

        <form id="productForm">
            <div class="mainArea">
                <%--  add/edit product here --%>

                <label>Id:</label>
                <input id="productId" name="id" type="text" disabled />

                <label>Name:</label>
                <input type="text" id="name" name="name" required>

                <label>Price:</label>
                <input type="text" id="price" name="price" required/>

                <label>Stock:</label>
                <input type="text" id="stock" name="stock" required/>

                <button id="btnSave">Save</button>
                <button id="btnDelete">Delete</button>
                <button id="btnReset" type="reset" value="Reset">Reset</button>

            </div>
        </form>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>