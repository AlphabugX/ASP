<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
</head>
<body>
<!--#include file="admin.asp"-->
<!--#include file="lconn.asp"-->
<%
dim delid,url
url=request.servervariables("HTTP_REFERER") ' ��ȡ��һҳ�ĵ�ַ������ɾ����ķ��ء�
if url ="" then url="http://"&Request.ServerVariables("SERVER_NAME") '����������⣬�򷵻���ҳ
delid=replace(request("id"),"'","") '

sql="delete from bank  where id in ("&delid&")"  ' 
conn.execute(sql)

conn.close
set conn=nothing%>

<script language=Javascript charset="gbk" >

alert("ɾ���ɹ���");
self.location=document.referrer;

</script>

<%response.end()%>


</body>
</html>


