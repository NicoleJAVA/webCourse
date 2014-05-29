
<%
function listResult2(database, sql){
	//Response.write("<br><br><hr>----------------- in listResult2.asp<br>");
  var  testArray2 = new Array();
	var Conn = Server.CreateObject("ADODB.Connection");
	Conn.ConnectionString = "DBQ=" + Server.MapPath(database) + ";Driver={Microsoft Access Driver (*.mdb)};Driverld=25;FIL=MS Access;";
	Conn.Open();
	var RS = Conn.Execute(sql);
	var kkk = -1;
	kkk = RS.Fields.Count;
	var fID = RS.Fields;
  var  theFieldName0 = RS.Fields(0).Name; 
  //Response.write("<br>kkk is RS.Fields.Count : kkk = "+ kkk +"<br><br><hr>") ;
   var num=0;
    var recordNum = RS.RecordCount;/*Response.write("<br>There are" + recordNum+ " records<Br>" );*/
   
 if(!RS.EOF ){
    var ggg=0;

    var gArray = new Array(num);
    gArray[0] = "FUCK";

   /***************************************/
   /*********** the first while loop ****/
    

  while (!RS.EOF ) {
        num++;
        if( RS.Fields(0).Name==theFieldName0 )
            
    RS.MoveNext();
  }   //   End while-loop /*Response.write( "<bR>RS(0) is" +RS(0)  );*/
    RS.MoveFirst();


  /*******************************  ********/
  /******** the second while loop ********/

	while (!RS.EOF ) {
        num++;
        var tempStr;
      	if( RS.Fields(0).Name==theFieldName0 ){
      		tempStr = RS.Fields(0).value;
      		testArray2[ggg++] = tempStr;    		
            //Response.write( "<Br>"+"testArray2["+ggg+"]"+testArray2[ggg-1]);
            gArray[ggg] = testArray2[ggg];           
        }	      
		RS.MoveNext();

	}   //   End while-loop /*Response.write( "<Br>testArray2[0]"+testArray2[0]+"<Br>");*/

} 
else{
       Response.write("<br>---------listResult2---------------EOF--------------<bR>" + sql + "----------fuck------");
}
	RS.Close();
    Conn.Close();
    return testArray2;

} // End function
%>