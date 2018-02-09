<%language="Vbscript"
	
    nome = request.form("nome")
    cognome = request.form("cognome")
    via = request.form("via")
	n_civico = request.form("n_civico")
    data_nascita = request.form("data_nascita")
	residenza = request.form("residenza")
    cod_fiscale = request.form("cod_fiscale")
	cod_carta_identita = request.form("cod_carta_identita")
    n_telefono = request.form("n_telefono")
	email = request.form("email")
	password = request.form("password")
	
	Set connessione = Server.CreateObject("ADODB.Connection")
	Set recordset = Server.CreateObject("ADODB.Recordset")
	
    connection_string="Driver={MariaDB ODBC 3.0 Driver};Server=localhost;DB=test;Port=3306;"
	
	connessione.open connection_string
	
	if err.number <> 0 then
        Set connessione = nothing
	    Set recordset = nothing
		response.redirect("errore.html")
	end if
	
	str_sql = "INSERT INTO UTENTE (COD_CARTA_IDENTITA, COD_FISCALE, NOME, COGNOME, DATA_NASCITA, VIA, N_CIVICO, RESIDENZA) VALUES ("
	str_sql = str_sql & "'" & cod_carta_identita & "'
    str_sql = str_sql & "'" & cod_fiscale & "'
    str_sql = str_sql & "'" & nome & "',"
	str_sql = str_sql & "'" & cognome & "',"
	str_sql = str_sql & "'" & data_nascita & "',"
	str_sql = str_sql & "'" & via & "',"
    str_sql = str_sql & n_civico & ","
	str_sql = str_sql & "'" & residenza & "');"

    str_sql = "INSERT INTO CLIENTE (EMAIL, PASSWORD, NUM_TEL, COD_FISCALE) VALUES ("
	str_sql = str_sql & "'" & email & "'
    str_sql = str_sql & "'" & password & "'
    str_sql = str_sql & n_telefono & ","
	str_sql = str_sql & "'" & cod_fiscale & "');"
	
	connessione.execute str_sql
	
	connessione.close

	Set connessione = nothing
	Set recordset = nothing
	
    '"index.html" DA CAMBIARE IN PAGINA DI "REGISTRAZIONE AVVENUTA CON SUCCESSO" E POI MOSTRARGLI SE VUOLE COLLEGARE ALL'ACCOUNT UN CONTO    
	response.redirect("index.html")

%>
