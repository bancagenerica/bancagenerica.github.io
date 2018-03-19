<%language="Vbscript"
	
	email = request.form("email")
	password = request.form("password")
	
	Set connessione = Server.CreateObject("ADODB.Connection")
	Set recordset = Server.CreateObject("ADODB.Recordset")
	
    connection_string="Driver={MariaDB ODBC 3.0 Driver};Server=sql11.freemysqlhosting.net;Port=3306;DB=sql11226831;UID=sql11226831;pwd=ZINHQ74sTg;option=3;"
	
	connessione.open connection_string
	
	if err.number <> 0 then
		response.redirect("errore.html")
	end if
	
	str_sql = "SELECT COD_CLIENTE FROM CLIENTE WHERE EMAIL =" & email & "AND PASSWORD =" & password & ";"
	
	'response.write str_sql
	'response.end
	
	recordset.open str_sql, connessione

    if err.number <> 0 then
        'cercare come far visualizzare il massaggio di errore
		connessione.close
	    Set connessione = nothing
	    Set recordset = nothing
    else
        connessione.close
	    Set connessione = nothing
	    Set recordset = nothing

        'da cambire qui sotto "index.html" e reindirizzare alla pagina dove viene visualizzati i dati del conto.
	    response.redirect("index.html")
	end if

%>
