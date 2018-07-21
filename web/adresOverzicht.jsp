<%-- 
    Document   : adresOverzicht
    Created on : Jul 20, 2018, 2:29:05 PM
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
        <div id="adresOverzicht"></div>
        <div class="btn-group">
            <button type="button" id="addressToevoegen" class="btn btn-primary">Toevoegen adress</button>
            <button type="button" class="btn btn-primary">Terug naar klant overzicht</button>
        </div>
    </body>
    <script>
        var tabledata = [];
        var pageUrl = window.location.search.substring(1);
        var customerId = findCustomerId(pageUrl);
        $("#adresOverzicht").tabulator({
            height: 150, 
            layout:"fitColumns", 
            columns:[ //Define Table Columns
                {title:"AdresType", field:"adrestype"},
                {title:"Straatnaam", field:"straatnaam"},
                {title:"Nummer", field:"nummer"},
                {title:"Postcode", field:"postcode"},
                {title:"Stad", field:"stad"},
                {title:"KlantId", field:"klantid"},
                {title:"Id", field:"id"}
            ],
            rowClick:function(e, row){ 
                var adrestype = row.getData().adrestype;
                var straatnaam = row.getData().straatnaam;
                var nummer = row.getData().nummer;        
                var postcode = row.getData().postcode;
                var stad = row.getData().stad;
                var klantid = row.getData().klantid;
                var id = row.getData().id;
                window.open("adresDetails.jsp?adrestype=" + adrestype + "&straatnaam=" + straatnaam + "&nummer=" + nummer +"&postcode=" + postcode + "&stad=" + stad + "&klantid=" + klantid + "&id=" + id, "_self");  
            },
        });
        $.get("http://localhost:8080/Appikaasie/REST/address", function(data,status) {
            $.each(data, function(index, field) {
                if(field.customerId == customerId) {
                    var obj = {adrestype: field.addressType, straatnaam: field.streetname, nummer: field.number, postcode: field.postalcode, stad: field.city, klantid: field.customerId, id: field.id}
                    tabledata.push(obj);
                }
            });
            $("#adresOverzicht").tabulator("setData", tabledata);
        });
        $("#addressToevoegen").click(function() {
            window.open("adresFormulier.jsp?customerId=" + customerId, "_self");
        });
        function findCustomerId(pageUrl) {
            var urlVariables = pageUrl.split('&');
            for(var i = 0; i < urlVariables.length; i++) {
                var urlVariable = urlVariables[i].split('=');
                if (urlVariable[0] == "customerId") {
                    return urlVariable[1];
                }
            }
            return "undefined";
        }
    </script>    
</html>
