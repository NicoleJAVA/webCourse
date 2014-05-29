<%@language=jscript%>

<br> This is slave. My only love is main.asp <BR>

<%

a = Request.ServerVariables("HTTP_REFERER")
Response.write( "click through : " + a + "<br><br>");
/**/
if ( a != "http://localhost/asp/main.asp" ){
    Response.write("<br><font size=6>Sorry! Only allow main.asp<br>Please Wait for 5 seconds</font>");
    //setTimeout( redirect1(), 50000 );
    // setTimeout is too difficult to use
    Response.AddHeader("REFRESH", "5;URL=http://localhost/asp/main.asp"); 
}
else{

	Response.write("<font size=6> the content of slave.asp</font>");
}

function redirect1(){
	Response.Redirect("http://localhost/asp/main.asp");
}
/**/

%>