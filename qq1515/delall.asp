<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
</head>
<body>
<!--#include file="admin.asp"-->
<!--#include file="lconn.asp"-->
<%
dim delid,url
url=request.servervariables("HTTP_REFERER") ' 获取上一页的地址，用于删除后的返回。
if url ="" then url="http://"&Request.ServerVariables("SERVER_NAME") '如果发生意外，则返回首页
delid=replace(request("id"),"'","") '

sql="delete from bank  where id in ("&delid&")"  ' 
conn.execute(sql)

conn.close
set conn=nothing%>

<script language=Javascript charset="gbk" >

alert("删除成功！");
self.location=document.referrer;

</script>

<%response.end()%>


</body>
</html>


