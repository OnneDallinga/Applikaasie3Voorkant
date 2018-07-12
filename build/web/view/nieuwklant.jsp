<%-- 
    Document   : nieuwklant
    Created on : Jul 12, 2018, 12:10:35 PM
    Author     : marko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="#nogintevullen" method="post">
            <div class="form-group">
                <label for="voornaam">Voornaam</label>
                <input type="text" id="voornaam" class="form-control"  />
            </div>
            <div class="form-group">
                <label for="achternaam">Achternaam</label>
                <input type="text" id="achternaam" class="form-control"  />
            </div>
            <div class="form-group">
                <label for="toevoeging">Toevoegsel</label>
                <input type="text" id="toevoeging" class="form-control"  />
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" class="form-control"  />
            </div>
            <button type="button" class="btn btn-success">Submit</button>
        </form>
    </body>
</html>
