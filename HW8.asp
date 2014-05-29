<%@ language="jscript" %>
<% title = "使用 ASP 及 SQL 對資料庫進行資料查詢" %>
<!--#include file="../head.inc"-->
<hr>
<% database = "song.mdb"; %>
<% table1 = "Singer"; %>
<% table2 = "Song"; %>
<% table3 = "Midi"; %>

<h3>作業作業 Nicole 資料庫內容：</h3>

<!-- List tables in the database -->
<!--#include file="../listQueryResult.inc"-->
<center>
<table border=1>
<tr>
<th colspan=2 align=center>
資料庫 "<%=database%>"
<tr>
<td align=center> 資料表 "<%=table1%>" 的內容
<td align=center> 資料表 "<%=table2%>" 的內容
<td align=center> 資料表 "<%=table2%>" 的內容
<tr>
<td> <!-- <% listQueryResult(database, "select * from "+table1); %>
<td> <% listQueryResult(database, "select * from "+table2); %>
<td> <% listQueryResult(database, "select * from "+table3); %>-->
</table>
</center>
<hr>



<% SQL = request("sql")
x = SQL+"";
if (x!="undefined"){%>
<hr>
<h3>SQL 命令：<font color=green><%=SQL%></font> </h3>
<h3>查詢結果：</h3>
<center>
<%    listQueryResult(database, SQL); %>
</center>


<hr>
<%}%>
<!--#include file="../foot.inc"-->
<form method=post>
<% SQL = request("sql")
x = SQL+"";
if (x!="undefined"){%>
<hr>
<h3>SQL 命令：<font color=pink><%=SQL%></font> </h3>
<h3>查詢結果：</h3>
<center>
<%    listQueryResult(database, SQL); %>
</center>
<hr>
<%}%>


基本 SQL:
<%
SQL = [
	"SELECT DISTINCT language FROM Song",
    "SELECT Singer.name FROM Singer LEFT JOIN Song ON Singer.SSN = Song.SingerSSN WHERE Song.language = '台語'",
    "SELECT Song.Name FROM Song LEFT JOIN Singer On Singer.SSN = Song.SingerSSN WHERE (Song.language = '台語') AND (Singer.Name='伍佰')",
    "SELECT Count(*) AS 伍佰唱過的國語歌 From Song, Singer WHERE ((Singer.SSN = Song.SingerSSN) AND (Song.language = '台語') AND (Singer.Name='伍佰'))",
    "SELECT Singer.Name, Song.Name FROM Song LEFT JOIN Singer On Singer.SSN = Song.SingerSSN WHERE (Song.language = '台語') AND (Singer.Gender='女')",
    "SELECT S.Name, M.path FROM (Song AS S INNER JOIN Singer AS Si on Si.SSN = S.SingerSSN) INNER JOIN Midi AS M ON M.SongSSN = S.SSN WHERE Si.name = '張宇' AND S.language='國語'",
   "SELECT  COUNT(*) AS 張宇國語歌總數 FROM (Song AS S INNER JOIN Singer AS Si on Si.SSN = S.SingerSSN) INNER JOIN Midi AS M ON M.SongSSN = S.SSN WHERE Si.name = '張宇' AND S.language='國語'",
       "SELECT COUNT(*) AS 歌曲共包含幾種不同語言 FROM (SELECT DISTINCT language FROM Song ) AS T"
    
];
/*    SELECT S.Name, M.path FROM (Song AS S INNER JOIN Singer AS Si on Si.SSN = S.SingerSSN) INNER JOIN Midi AS M ON M.SongSSN = S.SSN
 (Song.language = '台語') AND (Singer.Gender='女') AS x) Join Midi on (Midi.SongSSN = Song.SSN)  "  
WHERE (Song.language = '台語')*/
Response.write("<ol>\n");
for (i=0; i<SQL.length; i++){%>
	<li><input type="radio" name="sql" onClick="this.form.submit()" value="<%=SQL[i]%>"> <%=SQL[i]%>
<%}
Response.write("</ol>\n");%>
</form>