<%@ language="jscript" %>
<%Response.Charset="Big5"%>
<!--#include file="listResult2.asp"-->
<!-- saved from url=(0111)file:///C:/Users/stday/Documents/Nicole/Web%20%E7%B6%B2%E7%AB%99/jsBook/javaScript/example/dynamicListBox03.htm -->
<!--  <% language="jscript"; codepage=65001%> -->
<% database = "song.mdb"; %>
<% table1 = "Singer"; %>
<% table2 = "Song"; %>
<% table3 = "Midi"; %>
<!--#include file="languageStr.asp"-->
<%

%>



<%

SQL = "SELECT * FROM Song where SingerSSN = 773";
mydb ="song.mdb";
SQL2 = "SELECT DISTINCT C.Name FROM Singer AS C LEFT JOIN Song AS X on C.SSN = X.SingerSSN WHERE X.Language='"+ ChineseStr +"' ";
SQLEng = "SELECT DISTINCT C.Name FROM Singer AS C LEFT JOIN Song AS X on C.SSN = X.SingerSSN WHERE X.Language='"+ EngStr +"' ";
SQLTW = "SELECT DISTINCT C.Name FROM Singer AS C LEFT JOIN Song AS X on C.SSN = X.SingerSSN WHERE X.Language='" + twStr + "' ";
SQLHK = "SELECT DISTINCT C.Name FROM Singer AS C LEFT JOIN Song AS X on C.SSN = X.SingerSSN WHERE X.Language='" + HKStr + "' ";
//SQL33 = "SELECT X.Name FROM Song AS X LEFT JOIN Singer AS C  on C.SSN = X.SingerSSN WHERE C.Name='' ";

SQL4 =  "SELECT G.Name FROM Song AS G LEFT JOIN Singer AS W on W.SSN = G.SingerSSN ";
//SQL2 = "SELECT * FROM Singer AS C LEFT JOIN Song on C.SSN = Song.SingerSSN"
chineseArr = new Array();
//SongArr = new Array();

<!-- <script runat=server language=jscript> </script> -->

%>


<%
function listResult(database, sql){

	var Conn = Server.CreateObject("ADODB.Connection");
	Conn.ConnectionString = "DBQ=" + Server.MapPath(database) + ";Driver={Microsoft Access Driver (*.mdb)};Driverld=25;FIL=MS Access;";
	Conn.Open();
	var RS = Conn.Execute(sql);
	var kkk = -1;
	kkk = RS.Fields.Count;
	fID = RS.Fields;
    theFieldName0 = RS.Fields(0).Name;
    theFieldName1 = RS.Fields(1).Name;
    theFieldName2 = RS.Fields(2).Name;
    theFieldName3 = RS.Fields(3).Name;/*Response.write("<Br>"+theFieldName0+theFieldName1+theFieldName2+theFieldName3+"<br>");*/
/*for (i=0; i<RS.Fields.Count; i++){		Response.write(RS(i).Name+"  ");	}*//**********/  /*Response.write("<br> kkk is "+ kkk) ;*/

    var num=0;  recordNum = RS.RecordCount; //Response.write("<br>There are" + recordNum+ " records<Br>" );
	while (!RS.EOF ) {
        num++;
      	if( RS.Fields(1).Name==theFieldName1 )           
		RS.MoveNext();
	}   //   End while-loop
	Response.write( "<bR>RS(0) is" +RS(0)	 );
    RS.MoveFirst();
    testArray = [];
     xxx=0;
    var tempStr;
	while (!RS.EOF ) {
        num++;
      	if( RS.Fields(1).Name==theFieldName1 ){
      		tempStr = RS.Fields(1).value;
      		testArray[xxx++] = tempStr;    		/*debug Response.write( "<Br>"+"testArray["+xxx+"]"+testArray[xxx-1]);*/           
        }	
		RS.MoveNext();
	}   //   End while-loop //Response.write( "<Br>testArray[1]"+testArray[1]+"<Br>");
	RS.Close();
    Conn.Close();
    return testArray;
} 
%>
<%
/*------------------------------------------------------------------------------------------------*/
/*-------------------------                    ---------------------------------------------------*/
/*-------------------------    Chinese song    ---------------------------------------------*/
/*-------------------------                    ---------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------*/

//chineseArr = new Array();
chineseArr = listResult2("song.mdb", SQL2); 
chineseLength = chineseArr.length;
var SongArr = new Array();


    for(var nn=0; nn<chineseArr.length; nn++){   
    	 var SingerStr = chineseArr[nn];	
        var SQLzz = "SELECT X.Name FROM Song AS X LEFT JOIN Singer AS C on C.SSN = X.SingerSSN WHERE C.Name='"+SingerStr+"'";
        //SongArr[nn] = new Array();
        SongArr[nn] = listResult2(mydb, SQLzz);   
    }     /*   End for var nn=0   */ 

/*------------------------------------------------------------------------------------------------*/
/*-------------------------                    ---------------------------------------------------*/
/*-------------------------    English song    ---------------------------------------------*/
/*-------------------------                    ---------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------*/

EnglishArr = new Array();
EnglishArr = listResult2("song.mdb", SQLEng); 

EnglishLength = EnglishArr.length; //Response.write("<br>EnglishLength is" +EnglishLength);
var SongArrEng = new Array();
    for(var nn=0; nn<4; nn++){   
    	 var SingerStr = EnglishArr[nn];	
        var SQLzzEng = "SELECT X.Name FROM Song AS X LEFT JOIN Singer AS C on C.SSN = X.SingerSSN WHERE C.Name='"+SingerStr+"' AND X.Language='"+EngStr+"'";
        SongArrEng[nn] = new Array();
        SongArrEng[nn] = listResult2(mydb, SQLzzEng);
    }      /*   End for var nn=0   */ 
/*------------------------------------------------------------------------------------------------*/
/*-------------------------                    ---------------------------------------------------*/
/*-------------------------    taiwanese song    ---------------------------------------------*/
/*-------------------------                    ---------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------*/

TaiwanArr = new Array();
TaiwanArr = listResult2("song.mdb", SQLTW); 
var SongArrTW = new Array();

    for(var nn=0; nn<TaiwanArr.length; nn++){   
    	 var SingerStr = TaiwanArr[nn];	
        var SQLzzTW = "SELECT X.Name FROM Song AS X LEFT JOIN Singer AS C on C.SSN = X.SingerSSN WHERE C.Name='"+SingerStr+"' AND X.Language='"+twStr+"'";   
        SongArrTW[nn] = new Array();
        SongArrTW[nn] = listResult2(mydb, SQLzzTW);
   
    }   /*   End for var nn=0   */ 


/*------------------------------------------------------------------------------------------------*/
/*-------------------------                    ---------------------------------------------------*/
/*-------------------------    Hon Kong song    ---------------------------------------------*/
/*-------------------------                    ---------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------*/

HongKongArr = new Array();
HongKongArr = listResult2("song.mdb", SQLHK); 
//Response.write("<br> HongKongArr.length is " +HongKongArr.length);
var SongArrHK = new Array();

    for(var nn=0; nn<HongKongArr.length; nn++){   
         var SingerStr = HongKongArr[nn]; 
        var SQLzzHK = "SELECT X.Name FROM Song AS X LEFT JOIN Singer AS C on C.SSN = X.SingerSSN WHERE C.Name='"+SingerStr+"' AND X.Language='" + HKStr + "'";
        /*Response.write("<Br>SingerString_ is "  + SingerStr );*/
        /*Response.write("<Br>SQLzz is "  + SQLzzTW +"<br>");*/
        SongArrHK[nn] = new Array();
        SongArrHK[nn] = listResult2(mydb, SQLzzHK);
        /*Response.write("<Br>SongArrHK[nn] is "  +SongArrHK[nn] +"<br>");*/
   
        for( ll=0; ll<SongArrHK[nn].length; ll++ ){
                /*Response.write("<Br>SongArrHK["+nn+"]["+ll+"] is "  +SongArrHK[nn][ll] );*/  
        }  /* End for ll=0  */
    }   /* END for var nn=0 */ 


%>

<%
    	//SQLzz = "SELECT X.Name FROM Song AS X LEFT JOIN Singer AS C on C.SSN = X.SingerSSN WHERE C.Name='"+""+"'";
    	//SQLzzTemp = SQLzz;
    	//SongsArr = new Array();
        //SongArr = listResult2(mydb, SQL2);
    	//Response.write("<Br>asp:SongArr[0] is _ "+SongArr[0]);

%>
<html>
<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=big5">
<h1 align=center ><font face="Arial">  \hw00/ </font> </h1>
</head>

<body>
<h2 align=center>Dynamic List Box</h2>


<script>

function node(name, child){
	this.name=name;
	this.child=child;
}
function setArr(){  
	/// shit wrong code function setArr{ Fuck 
	/// shit corre code function setArr(){ Fuck
	document.write("----------zzzz");
    arrSet = new Array();
    for( var qq=0; qq<12; qq++){
    	arrSet[qq] = "Testing" + qq;
    }
	return arrSet;
}
dataTree=dataHierarchy();
/*------------------------------------------------------------------------------------------------*/
/*-------------------------                    ---------------------------------------------------*/
/*-------------------------    dataHierarchy    ---------------------------------------------*/
/*-------------------------                    ---------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------*/
/*jsSongArr2D is a Global Array of js (but is not asp)*/
//var jsSongArr2D = new Array();
function dataHierarchy(){


    myArr = new Array();  myArr[0] = "super";  myArr[1] = "verySuper";  


/*------------------------------------------------------------------------------------------------*/
/*-------------------------                    ---------------------------------------------------*/
/*-------------------------    Chinese song    ---------------------------------------------*/
/*-------------------------                    ---------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------*/

	var mandarin=new Array();
	var i=0;
    jsSongArr2D = new Array(); //2D:2-dimensional array /*PPS. jsSongArr = new Array() will not work */

    <%for(var mm=0; mm<73; mm++){  %>
    	jsSongArr2D[<%=mm%>] = new Array();
    	<%
    		for( tt=0; tt<SongArr[mm].length; tt++ ){
            songStr = SongArr[mm][tt]; //StrRmvQuote = songStr.replace("'", "\\'");                 
    	%>    	
    	jsSongArr2D[<%=mm%>][<%=tt%>] = "<%=SongArr[mm][tt]%>";   	
    	<%      } /*  END   for tt=0 */%>	
    	mandarin[<%=mm%>] = new node('<%=chineseArr[mm]%>', jsSongArr2D[<%=mm%>]); 
    <% }/*  END for(var mm=0 */ %>


/*------------------------------------------------------------------------------------------------*/
/*-------------------------                    ---------------------------------------------------*/
/*-------------------------    English song    ---------------------------------------------*/
/*-------------------------                    ---------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------*/

	var english=new Array();
	var i=0;
    jsSongArr2D2 = new Array(); //2D:2-dimensional array /*PPS. jsSongArr = new Array() will not work */

    <%for(var hh=0; hh<4; hh++){  %>
    	jsSongArr2D2[<%=hh%>] = new Array();
    	<%
    		for( tt=0; tt<SongArrEng[hh].length; tt++ ){
                songStr = SongArrEng[hh][tt];               
    	%>   	
    	        jsSongArr2D2[<%=hh%>][<%=tt%>] = "<%=SongArrEng[hh][tt]%>";   	
    	<%      } /* END   for tt=0 */%>	
    	english[<%=hh%>] = new node('<%=EnglishArr[hh]%>', jsSongArr2D2[<%=hh%>]); 
    <% }/*-----------  END for(var hh=0  -----------------*/ %>

/*------------------------------------------------------------------------------------------------*/
/*-------------------------                    ---------------------------------------------------*/
/*-------------------------    Taiwan song    ---------------------------------------------*/
/*-------------------------                    ---------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------*/

	var taiwanese=new Array();
	var i=0;
    jsSongArr2D3 = new Array(); //2D:2-dimensional array 
    jsTwArrLength = '<%=TaiwanArr.length%>';
    <%for(var ff=0; ff<TaiwanArr.length; ff++){  %>
    	jsSongArr2D3[<%=ff%>] = new Array(); // 2D : two-d array
    	<%
    		for( tt=0; tt<SongArrTW[ff].length; tt++ ){
                songStr = SongArrTW[ff][tt];
            %>    	
    	        jsSongArr2D3[<%=ff%>][<%=tt%>] = "<%=SongArrTW[ff][tt]%>";   	
    	<%      } /* ------  END   for( tt=0; tt<2; tt++ )*/%>	
    	taiwanese[<%=ff%>] = new node('<%=TaiwanArr[ff]%>', jsSongArr2D3[<%=ff%>]); 
    <% }/* END for var ff=0 */ %>


/*------------------------------------------------------------------------------------------------*/
/*-------------------------                    ---------------------------------------------------*/
/*-------------------------    Hon Kong song    ---------------------------------------------*/
/*-------------------------                    ---------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------*/

    var cantonese=new Array();
    var i=0;
    jsSongArr2D4 = new Array(); //2D:2-dimensional array 
    jsHkArrLength = '<%=HongKongArr.length%>'; /*document.write("<Br><br>jsHkArrLength is : "+jsHkArrLength+"<br>br>");*/
    <%for(var dd=0; dd<HongKongArr.length; dd++){  %>
        jsSongArr2D4[<%=dd%>] = new Array(); // 2D : two-d array
        <%
            for( tt=0; tt<SongArrHK[dd].length; tt++ ){
                songStr = SongArrHK[dd][tt];
                %>/*document.write("<br> songStr :" + "<%=songStr%>" );*/

                jsSongArr2D4[<%=dd%>][<%=tt%>] = "<%=SongArrHK[dd][tt]%>";      
        <%  } /*  END  for tt=0 */ %>  
        cantonese[<%=dd%>] = new node('<%=HongKongArr[dd]%>', jsSongArr2D4[<%=dd%>]); 
    <% }/* END for var dd=0 */ %>



/*------------------------------------------------------------------------------------------------*/
/*-------------------------                    ---------------------------------------------------*/
/*-------------------------    output[]        ---------------------------------------------*/
/*-------------------------                    ---------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------*/

	var output=new Array();
	var i=0;
    output[i++]=new node( "<%=languageArr[0]%>", taiwanese);
    output[i++]=new node( "<%=languageArr[1]%>" , english);
	output[i++]=new node( "<%=languageArr[2]%>", mandarin);
	output[i++]=new node( "<%=languageArr[3]%>", cantonese );
    
	return(output);
}


function onChangeColumn3(){
	updatePath();
}


function onChangeColumn2(){
	form=document.theForm;
	index1=form.column1.selectedIndex;
	index2=form.column2.selectedIndex;
	index3=form.column3.selectedIndex;
	// Create options for column 3
	for (i=0;i<dataTree[index1].child[index2].child.length;i++)
		form.column3.options[i]=new Option(dataTree[index1].child[index2].child[i], dataTree[index1].child[index2].child[i]);
	form.column3.options.length=dataTree[index1].child[index2].child.length;
	updatePath();
}


function onChangeColumn1() {
	form=document.theForm;
	index1=form.column1.selectedIndex;
	index2=form.column2.selectedIndex;
	index3=form.column3.selectedIndex;
	// Create options for column 2
	for (i=0;i<dataTree[index1].child.length;i++)
		form.column2.options[i]=new Option(dataTree[index1].child[i].name, dataTree[index1].child[i].name);
	form.column2.options.length=dataTree[index1].child.length;
	// Clear column 3
	form.column3.options.length=0;
	updatePath();
}


function updatePath(){
	form=document.theForm;
	index1=form.column1.selectedIndex;
	index2=form.column2.selectedIndex;
	index3=form.column3.selectedIndex;
	if ((index1>=0) && (index2>=0) && (index3>=0)) {
		text1=form.column1.options[index1].text;
		text2=form.column2.options[index2].text;
		text3=form.column3.options[index3].text;
		form.path.value=text1+" ==> "+text2+" ==> "+text3;
	} else
		form.path.value="";
}






</script>

<form name="theForm">
<table align=center border=1>
	<tr>
		<th>Language<th>Singer's Name<th>Song list
	<tr>
		<td align=center>
			<select name="column1" size=10 onChange="onChangeColumn1();">
				<script>
				for (i=0; i<dataTree.length; i++)
					document.writeln("<option value=\""+dataTree[i].name+"\">"+dataTree[i].name);
				</script>
			</select>
		<td align=center>
			<select name="column2" size=10 onChange="onChangeColumn2();">
			</select>
		<td align=center>
			<select name="column3" size=10 onChange="onChangeColumn3();">
			</select>
	<tr><td colspan=3 align=center>Midi Path<input type=text name=path size=60></td></tr>
</table>
</form>








<hr>
<!-- /***********************************************/ -->

</body>
</html>