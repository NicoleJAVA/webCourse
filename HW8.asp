<%@ language="jscript" %>
<% title = "�ϥ� ASP �� SQL ���Ʈw�i���Ƭd��" %>
<!--#include file="../head.inc"-->
<hr>
<% database = "song.mdb"; %>
<% table1 = "Singer"; %>
<% table2 = "Song"; %>
<% table3 = "Midi"; %>

<h3>�@�~�@�~ Nicole ��Ʈw���e�G</h3>

<!-- List tables in the database -->
<!--#include file="../listQueryResult.inc"-->
<center>
<table border=1>
<tr>
<th colspan=2 align=center>
��Ʈw "<%=database%>"
<tr>
<td align=center> ��ƪ� "<%=table1%>" �����e
<td align=center> ��ƪ� "<%=table2%>" �����e
<td align=center> ��ƪ� "<%=table2%>" �����e
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
<h3>SQL �R�O�G<font color=green><%=SQL%></font> </h3>
<h3>�d�ߵ��G�G</h3>
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
<h3>SQL �R�O�G<font color=pink><%=SQL%></font> </h3>
<h3>�d�ߵ��G�G</h3>
<center>
<%    listQueryResult(database, SQL); %>
</center>
<hr>
<%}%>


�� SQL:
<%
SQL = [
	"SELECT DISTINCT language FROM Song",
    "SELECT Singer.name FROM Singer LEFT JOIN Song ON Singer.SSN = Song.SingerSSN WHERE Song.language = '�x�y'",
    "SELECT Song.Name FROM Song LEFT JOIN Singer On Singer.SSN = Song.SingerSSN WHERE (Song.language = '�x�y') AND (Singer.Name='���')",
    "SELECT Count(*) AS ��հ۹L����y�q From Song, Singer WHERE ((Singer.SSN = Song.SingerSSN) AND (Song.language = '�x�y') AND (Singer.Name='���'))",
    "SELECT Singer.Name, Song.Name FROM Song LEFT JOIN Singer On Singer.SSN = Song.SingerSSN WHERE (Song.language = '�x�y') AND (Singer.Gender='�k')",
    "SELECT S.Name, M.path FROM (Song AS S INNER JOIN Singer AS Si on Si.SSN = S.SingerSSN) INNER JOIN Midi AS M ON M.SongSSN = S.SSN WHERE Si.name = '�i�t' AND S.language='��y'",
   "SELECT  COUNT(*) AS �i�t��y�q�`�� FROM (Song AS S INNER JOIN Singer AS Si on Si.SSN = S.SingerSSN) INNER JOIN Midi AS M ON M.SongSSN = S.SSN WHERE Si.name = '�i�t' AND S.language='��y'",
       "SELECT COUNT(*) AS �q���@�]�t�X�ؤ��P�y�� FROM (SELECT DISTINCT language FROM Song ) AS T"
    
];
/*    SELECT S.Name, M.path FROM (Song AS S INNER JOIN Singer AS Si on Si.SSN = S.SingerSSN) INNER JOIN Midi AS M ON M.SongSSN = S.SSN
 (Song.language = '�x�y') AND (Singer.Gender='�k') AS x) Join Midi on (Midi.SongSSN = Song.SSN)  "  
WHERE (Song.language = '�x�y')*/
Response.write("<ol>\n");
for (i=0; i<SQL.length; i++){%>
	<li><input type="radio" name="sql" onClick="this.form.submit()" value="<%=SQL[i]%>"> <%=SQL[i]%>
<%}
Response.write("</ol>\n");%>
</form>