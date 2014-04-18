<%@language=jscript%>



<!--include file="./FiboRecursive.asp"-->


<%i=0;
fiboAns1 = 0;
fiboAns2 = 0;
Response.write("<table>");
Response.write("<tr><th>n<th>fibonacci(n)<th>server side<th>client side"); //<th>用戶端的計算時間
for( i=10; i<=20; i++ ){
    
    startTime1 = new Date();
    fiboAns1 = fibo(i);   
    endTime1 = new Date();
    diff1 = ( endTime1.getTime() - startTime1.getTime() ) / 1000;
    Response.write("<tr><td>"+"&nbsp;&nbsp;&nbsp;" + i + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +"</td>")
    Response.write("<td>" + "&nbsp;&nbsp;" + fiboAns1+ "</td>");
    Response.write("<td>" + diff1 + "</td>" );
    Response.write("</tr>");
}
Response.write("</table>")


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



<html>

    <script language="javascript">
    <!-- src FiboRecursive.js -->
    document.write("<Br><Br>")
    document.write("<table><tr><th>n<th>fibonacci<th>client side")
    for( k=10; k<=20; k++ ){
        document.write("<tr><td>"+"&nbsp;&nbsp;&nbsp;" + k + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +"</td>")
        startTime2 = new Date();
        fiboAns2= fibo2(k);   
        endTime2 = new Date();
        diff2 = ( endTime2.getTime() - startTime2.getTime() ) / 1000;
        
        document.write("<td>" + "&nbsp;&nbsp;" + fiboAns2+ "</td>");
        document.write("<td>" + "&nbsp;&nbsp;" + diff2 + "</td>"); 
        document.write("</tr>");
          
    }    
    document.write("</table>")

    function fibo2( m )
{
    
    if( m>=2 ){
        /*Lazy Wrong Code : 
        result = fibo(m-1) + fibo(m-2);*/
        result = fibo2(m-1) + fibo2(m-2);
        return result;
    }
    else if( m==1 || m==0 ){
        return m;
    }

}
 

    </script>

<div>
    自我對話的藝術 Pamela E Bultler 安娜是一位藝術家在一場失戀的重創之後，深感抑鬱，大約六間幾乎完全無法振作精神做任何事，
當她開始重拾畫筆之後，每天工作三、四小時。不夠! 她說，因為她把現在的自己，和以前那個可以一口氣不停畫八、九個小時的人相比。
事實上，根據她以往的標準，工作三小時，更加深了他 我獨自沒有伴時便無法發揮任何功能 這個信念。
安娜沒有注意到的是，在面對失戀的創傷時，她已把悲痛之情克服到可以重新作畫的程度。與六個月以前的情形相較，
她在恢復工作能力方面，已進步了很多。
她的進步，再與 沒有了情人，我一點用也沒有 這個否定信念相抗衡時，便毫無價值。
</div>

    </html>