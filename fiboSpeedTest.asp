<%@language=jscript%>


<!--include file="./FiboRecursive.asp"-->


<%i=0;
fiboAns1 = 0;
fiboAns2 = 0;
Response.write("<table>");
Response.write("<tr><th>n<th>fibonacci(n)<th>a"); //<th>用戶端的計算時間
for( i=10; i<=20; i++ ){
    Response.write("<tr><td>"+"&nbsp;&nbsp;&nbsp;" + i + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +"</td>")
    //Response.write("<tr><td>");

    //document.write("</td>");
    startTime1 = new Date();
    fiboAns1 = fibo(i);
    
    endTime1 = new Date();
    diff1 = ( endTime1.getTime() - startTime1.getTime() ) / 1000;
    Response.write("<td>" + "&nbsp;&nbsp;" + fiboAns1+ "</td>");
    Response.write("<td>" + diff1 + "</td>" );
    Response.write("</tr>");

}
Response.write("</table>")
/**
gg = fibo(15);
Response.write("<br><br>" + gg);
/**/
function fibo( n )
{
    //Response.write("hi");
    if( n>=2 ){
        result = fibo(n-1) + fibo(n-2);
        return result;
    }
    else if( n==1 || n==0 ){
        return n;
    }

    

}



%>
