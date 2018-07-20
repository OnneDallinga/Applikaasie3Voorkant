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
            <button type="button" id="toevoegen" class="btn btn-primary">Toevoegen adress</button>
            <button type="button" class="btn btn-primary">Samsung</button>
            <button type="button" class="btn btn-primary">Sony</button>
        </div>
    </body>
    <script>
        var tabledata = [];
       $("#adresOverzicht").tabulator({
            height:650, 
            layout:"fitColumns", 
            columns:[ //Define Table Columns
                {title:"AdresType", field:"adrestype"},
                {title:"Straatnaam", field:"straatnaam"},
                {title:"Nummer", field:"nummer"},
                {title:"Postcode", field:"postcode"},
                {title:"Stad", field:"stad"},
                {title:"KlantId", field:"klantid"}
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
                window.open("klantDetails.jsp?adrestype=" + adrestype + "&straatnaam=" + straatnaam + "&nummer=" + nummer +"&postcode=" + postcode + "&stad=" + stad + "&klantid=" + klantid + "&id=" + id, "_self");  
            },
        });
        $.get("http://localhost:8080/Appikaasie/REST/customer", function(data,status) {
            $.each(data, function(index, field) {
                var obj = {adrestype: field.addressType, straatnaam: field.streetname, nummer: field.number, postcode: field.postalcode, stad: field.city, klantid: field.customerId, id: field.id}
                tabledata.push(obj);
            });
            $("#adresOverzicht").tabulator("setData", tabledata);
        });
        $("#toevoegen").click(function() {
            window.open("adresFormulier.jsp");
        }) 
    </script>    
</html>
