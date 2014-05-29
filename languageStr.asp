<%

SQLlanguage = "SELECT DISTINCT Song.language FROM Song";
languageArr = listResult2("song.mdb", SQLlanguage);
/*
Response.write("<br>languageArr is : " + languageArr + "<br><br><br><br><Br>");
*/
twStr = languageArr[0];
EngStr = languageArr[1]; 
ChineseStr = languageArr[2]
HKStr = languageArr[3];
%>