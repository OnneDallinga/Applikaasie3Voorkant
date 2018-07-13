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
        <title>Product information</title>
    </head>
    <body>

        <div class="leftArea">
            <ul id="productList"></ul>
            <%--  list of products here --%>
        </div>

        <form id="productForm">
            <div class="mainArea">
                <%--  add/edit product here --%>

                <label>Id:</label>
                <input id="productId" name="id" type="text" disabled />
                <br>

                <label>Name:</label>
                <input type="text" id="name" name="name" required>
                <br>

                <label>Price:</label>
                <input type="text" id="price" name="price" required/>
                <br>

                <label>Stock Quantity:</label>
                <input type="text" id="stockQuantity" name="stockQuantity" required/>
                <br>

                <button id="btnSave">Save</button>
                <button id="btnDelete">Delete</button>

            </div>
        </form>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
