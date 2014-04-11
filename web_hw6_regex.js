/**/
url = "http://mirlab.org/jang/courses/webProgramming/homework/linkExtraction/testPage4linkExtraction2.htm";
/***/
urlNum = 0; /* number of url links */
nUrlNum = 0; /* number of non-url links*/
contents = "";
addrArray = new Array(); /* it holds the address parts of each link */
titleArray = new Array();
nUrlArray = new Array();

function extract_TA_homework(){
    var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    googleurl = "https://www.google.com.tw";
    xmlHttp.open("GET", url, false, "");
    xmlHttp.send();             // Send the request
    contents = xmlHttp.responseText;    // Get the contents
re = new RegExp("<title>(.*?)<\/title>", "gi");;
index=contents.search(re);
WScript.Echo("\n\nindex = " + index);
WScript.Echo("title = " + RegExp.$1);
}

function delete_xmpAndComment(){
    
    xmpReg = /<xmp>.*<\/xmp>/gi
    commentReg = /<!--\s*<a\s*href.*>.*<\/a>\s*.*-->/gi
    commentReg2 = /<!--(.*?)-->/gi
    xmpStr = contents.match( xmpReg );
    //WScript.Echo( "the xmp string found is \n" + xmpStr +"\n");
    /**Original :*
    contents = contents.replace( xmpStr, "<!-- -->" );
    /***/
    contents = contents.replace( xmpStr, "" );
    //xmpStr2 = contents.match( xmpReg );
    //WScript.Echo( "After deletion: \n" + xmpStr2 );
    contents = contents.replace( commentReg, "");
    contents = contents.replace( commentReg2, "");
}
 
function test_urlTag(){
    urlReg = /<a\s+href\s*=\s*"\s*(http.*?)"\s*>.*?<\/a>.*?|<a\s+href\s*=\s*"\s*(http.*?)"\s*>.*?<a>.*?/gi
    addrReg = /\"(.*?)\"/  /* just the address part */
    domainReg = /mirlab\.org/
    nameReg = /\"\s*>(.*?)<\/a>/
    titleNoiceReg = new RegExp( '\<.*?\>', 'gi' );
    /*問號是最小比對。比對到的字串是在比對成功的情況下最短的字串*/
    str = contents.match( urlReg );
    WScript.Echo( "\n\n\nThere are " + str.length + " url tags" );
    urlnum = str.length;
    for( c=0; c<str.length; c++ ){
        /* Originally ::
        urlPart = urlReg.exec( str[c] ); But Nicole changes into this : */
        urlPart = str[c].match( addrReg );
        addrArray[c] = urlPart[1].replace(/^[\s　]+/,"" );

        name = str[c].match( nameReg );
        name[1] = name[1].replace( /<(.*?)>/gi, "");

        if ( domainReg.test( addrArray[c] ) ) {
            WScript.Echo( "\n" + name[1] );
            WScript.Echo(  addrArray[c] + " ==> same domain "); 
        /* Oh !! So stupid, Nicole finally found out the exec() does not return a "string", */
        /*but it returns an "array"  ! Therefore, the address is not urlPrt, but it's urlPart[1] */
        }
        else{
            WScript.Echo( "\n" + name );
            WScript.Echo( "\n" + addrArray[c] + " ==> different domain " ); 
        }
    }
    WScript.Echo("-----------------------\n\n");
}
 
function test_aTag(){    /* two cases for aTag : (1) <a href=\jang>  (2) <a href="http.....">
    case (2) for aTag is actually urlTag. */
    aTagReg = /<a\s*href\s*=.*>.*<\/a>/gi;
    str2 = contents.match( aTagReg );
    WScript.Echo( "\n\nThere are " + str2.length + " matching results\n" );
    for( k=0; k<str2.length; k++ ){
        urlPart = aTagReg.exec( str2[k] );
   }
}

function test_non_urlTag(){
    //nUrlReg = /<a\s*href\s*=[^"]*>.*<\/a>/gi;
     //urlReg = /<a\s+href\s*=\s*"\s*(http.*?)"\s*>.*?<\/a>.*?/gi
    nUrlReg = /<a\s*href\s*=\s*([^"]+)>.*?<\/a>.*?/gi;
    pathReg = /=[\s]*(.*?)[\s]*>/
    str3 = contents.match( nUrlReg );
    WScript.Echo( "\nThere are " + str3.length + " non_url links \n" );
    nUrlnum = str3.length;
    for( j=0; j<nUrlnum; j++ ){

        //WScript.Echo( str3[j] );

        
        path = str3[j].match( pathReg );
        WScript.Echo( "\npath:" + path );
        /**/
        nUrlArray[j] =  path[1].replace(/^[\s　]+/,"" );
        //WScript.Echo( "\n\n\n str3" + j + " is " + str3[j] );
        WScript.Echo( "\n urlPart of str3 " + j + " is " + nUrlArray[j] + " ==> same domain" );
        /***/
    }
}

function extract_title( address )
{ 
    WScript.Echo( "\nHiiii\n" );//+ address + "---" ); 
    titleReg = new RegExp( "<title>(.*?)<\/title>", "gi");;
    
    for( jj=0; jj<urlNum; jj++ ){
        address = "http://mirlab.org/jang/courses/webProgramming/homework/linkExtraction/testPage4linkExtraction2.htm";
        var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP.4.0");
        WScript.Echo( " 1 ");
        xmlHttp.open("GET", address, false, "");
        xmlHttp.send();
        WScript.Echo( " 1 ");
        contents2 = xmlHttp.responseText;

        index3 = contents2.search( titleReg );
        titleArray[jj] = RegExp.$1;
        WScript.Echo( titleArray[jj] );
        WScript.Echo( "\nend\n" );
    }
/**********************/

}


function main(){
    extract_TA_homework();
    delete_xmpAndComment();
    //test_aTag();
    test_urlTag();
    test_non_urlTag();
    //extract_title();
}

main();
/** Teacher's original code : 
re2 = new RegExp("<a href=()</a>");
index2=contents.search(re);
WScript.Echo("index2:" + index2 );
WScript.Echo("title2:" + RegExp.$2);
/**/

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
