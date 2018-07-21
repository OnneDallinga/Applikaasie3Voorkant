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

        

        <form id="productForm" class="form-signin">
            <div class="mainArea">
            <div class="form-group">
                <%--  add/edit product here --%>

                <div class="row">
                    <label>Id:</label>
                    <input id="productId" name="id" type="text" disabled />
                </div>
                
                <div class="row">
                    <label>Status:</label>
                    <input id="productStatusText" name="productStatusText" type="text" disabled />
                </div>    

                <input id="productStatus" name="productStatus" type="hidden" disabled />

                <div class="row">
                    <label>Naam:</label>
                    <input type="text" id="name" name="name" required>
                </div>

                <div class="row">
                    <label>Prijs:</label>
                    <input type="text" id="price" name="price" required/>
                </div>

                <div class="row">
                    <label>Voorraad:</label>
                    <input type="text" id="stock" name="stock" required/>
                </div>

                <button id="btnSave" class="btn btn-primary btn-lg">Opslaan</button>
                <button id="btnActiveer" class="btn btn-primary btn-lg">Activeer/Deactiveer</button>
                <button id="btnReset" class="btn btn-primary btn-lg">Reset</button>
                <button id="btnBack" class="btn btn-primary btn-lg">Terug naar overzicht</button>
            </div>
            </div>
        </form>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/product.js"></script>
