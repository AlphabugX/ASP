<!--#include file="include/db_conn.asp"-->
<%
conn.execute("update bank set num=num+1 where id="&session("ddid"))
%>
