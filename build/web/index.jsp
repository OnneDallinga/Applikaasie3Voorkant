<%-- 
    Document   : index
    Created on : Jul 3, 2018, 1:24:56 PM
    Author     : Onne
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Applikaasie</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-dark">
            <div class="container-fluid"> 
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Menu: </a>
                </div>
               
                <ul class="navbar-nav">
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Klant<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="klantOverzicht.jsp">Klantoverzicht</a></li>
                            <li><a href="nieuwklant.jsp">Klant toevoegen</a></li>
                        </ul>
                    </li>
                
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Bestellingen<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="bestellingOverzicht.jsp">Bestellingoverzicht</a></li>
                            <li><a href="bestellingDetails.jsp">Bestelling toevoegen</a></li>
                        </ul>
                    </li>
                
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Produkten<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="productOverzicht.jsp">Produktoverzicht</a></li>
                            <li><a href="productDetails.jsp">Produkt toevoegen</a></li>
                        </ul>
                    </li>   
                </ul>
            </div>
        </nav>
  
    <div class="container">
        <p>Applikaaasie</p>
    </div>
    </body>
</html>
