
url = "http://mirlab.org/jang/courses/webProgramming/homework/linkExtraction/testPage4linkExtraction2.htm";
xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
xmlHttp.open("GET", url, false, "");
xmlHttp.send();				// Send the request
contents = xmlHttp.responseText;	// Get the contents
/* ----Teacher's original code :  extract the title
----re = new RegExp("<title>(.*?)<\/title>", "gi");
*/
/*----  Nicole's Test :  
----Wrong Code : 
----urlReg = /<a\s+href\s+=\s+"(.*?)"\s+>.*?<\/a>.*?/
----Correct Code : 
----urlReg = /<a\s+href\s*=\s*"(.*?)"\s*>.*?<\/a>.*?/;
----Correct basic urlReg : 
----urlReg = /<a\s+href\s*=\s*"\s*(.*?)"\s*>.*?<\/a>.*?/i
----Or, 
----re = new RegExp("<a href(.*?)>(.*?)<\/a>(.*?)", "gi");
*/

/* for use 
WScript.Echo( contents );
*/

function delete_xmpAndComment(){
    
    xmpReg = /<xmp>.*<\/xmp>/gi
	commentReg = /<!--\s*<a\s*href.*>.*<\/a>\s*.*-->/gi
	xmpStr = contents.match( xmpReg );
	//WScript.Echo( "the xmp string found is \n" + xmpStr +"\n");
    contents = contents.replace( xmpStr, "<!-- -->" );
	//xmpStr2 = contents.match( xmpReg );
	//WScript.Echo( "After deletion: \n" + xmpStr2 );
	contents = contents.replace( commentReg, "<!-- -->");
}
 
function test_urlTag(){
    urlReg = /<a\s+href\s*=\s*"\s*(.*?)"\s*>.*?<\/a>.*?/gi
    str = contents.match( urlReg );
	WScript.Echo( "\nThere are " + str.length + "matching results" );
    for( c=0; c<str.length; c++ ){
  
    	urlPart = urlReg.exec( str[c] );
	    //WScript.Echo( "\n\n\n str" + c + " is " + str[c] );
	    //WScript.Echo( "\n urlPart of str" + c + " is " + urlPart );
    }
}
 
 
function test_aTag(){
    /*
	two cases for aTag : (1) <a href=\jang>  (2) <a href="http.....">
	case (2) for aTag is actually urlTag. 
	*/
    aTagReg = /<a\s*href\s*=.*>.*<\/a>/gi;
    str2 = contents.match( aTagReg );
	WScript.Echo( "\nThere are " + str2.length + "matching results" );
    for( k=0; k<str2.length; k++ ){
  
    	urlPart = aTagReg.exec( str2[k] );
	    //WScript.Echo( "\n\n\n str2" + k + " is " + str2[k] );
	    //WScript.Echo( "\n urlPart of str2" + k + " is " + urlPart );
    }
}

function test_non_urlTag(){
    /*
	two cases for aTag : (1) <a href=\jang>  (2) <a href="http.....">
	case (2) for aTag is actually urlTag. 
	*/
    nUrlReg = /<a\s*href\s*=[^"]*>.*<\/a>/gi;
    str3 = contents.match( nUrlReg );
	WScript.Echo( "\nThere are " + str3.length + "matching results" );
    for( j=0; j<str3.length; j++ ){
  
    	urlPart = nUrlReg.exec( str3[j] );
	    WScript.Echo( "\n\n\n str3" + j + " is " + str3[j] );
	    WScript.Echo( "\n urlPart of str3" + j + " is " + urlPart );
    }
}


function main(){
    delete_xmpAndComment();
	test_aTag();
	test_urlTag();
	test_non_urlTag();
    
}

main();
/** Teacher's original code : 
re2 = new RegExp("<a href=()</a>");
index2=contents.search(re);
WScript.Echo("index2:" + index2 );
WScript.Echo("title2:" + RegExp.$2);
/**/

