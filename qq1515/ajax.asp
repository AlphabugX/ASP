<!--#include file="lconn.asp"-->
<%
dim action,tables,field1,values,id
action=request("action")
tables=request("tables")
field1=request("field")
values=request("values")
id=request("id")

if request("action")="set" then
	conn.execute("update "&tables&" set "&field1&"='"&values&"' where id="&id)
end if

%>
