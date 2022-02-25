<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="admin.asp"-->
<!--#include file="lconn.asp"-->
<!--#include file="md5.asp"-->
<%
user_id=Trim(request.queryString("id"))
user_id=user_id
password1=Trim(request.form("pw1"))

sqlStr="select * from zy_user where user_id="&user_id&" order by user_id desc"
set rs = server.createobject("ADODB.RecordSet")
rs.open sqlStr,conn,1,3
	
if password1<>"" then 
rs("user_password")=md5(password1)
rs.update
end if

rs.close
set rs=nothing
Set conn=nothing
%>
<Script Language="JavaScript">
alert('ÐÞ¸Ä³É¹¦¡£');
window.location.href="member.asp";
</Script>
