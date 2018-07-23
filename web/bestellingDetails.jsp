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
             
                <%--  add/edit product here --%> 
 
                
                <input id="bestellingId" name="id" type="text" disabled hidden/> 
                
                 
                <div class="form-group"> 
                <div class="row"> 
                <label>Geplaatst op:</label> 
                <input id="dateTime" name="dateTime" type="date"  class="form-control"/> 
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
                <input type="text" id="orderStatus" name="orderStatus" disabled class="form-control"/> 
                </div> 
                </div> 
                
                <h2>Inhoud van bestelling:</h2>
                
                <div id="bestellingsItemOverzicht"></div>
                
                <div class="form-group"> 
                <div class="row"> 
                <label>Totaalprijs:</label> 
                <input type="text" id="totalPrice" name="totalPrice" disabled class="form-control"/> 
                </div> 
                </div> 
                
                <button id="btnNieuweBestelRegel" class="btn btn-primary btn-sm" type="button">Product(en) toevoegen</button>
                <button id="btnSave" class="btn btn-primary btn-sm" type="button">Opslaan</button>
                <button id="btnDelete" class="btn btn-primary btn-sm" type="button">Verwijderen</button>
                <button id="btnReset" type="reset" value="Reset" class="btn btn-primary btn-sm">Reset</button>
            
        </form>
        <script src="js/bestelling.js"></script>
        
    </body>
</html>