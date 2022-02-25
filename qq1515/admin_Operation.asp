<!--#include file="lconn.asp"-->
<!--#include file="Admin.asp"-->
<%
if request("action")="ok" then
   set rs=server.createobject("adodb.recordset")
   rs.open "select * from website where id=1",conn,1,3
   rs("txt1")=request("txt1")
   rs.update
   rs.close
   set rs=nothing
   conn.close
   set conn=nothing
   response.Write("<script>alert('保存成功!');location.href='admin_website.asp'</script>")
end if

set rs=server.createobject("adodb.recordset")
sqltext="select * from website where id=1"
rs.open sqltext,conn,1,1
%>
<html>
<head>
<TITLE>后台管理</title>
<link href="mcadmin.css"  type=text/css rel=stylesheet>
</head>
<body>
<table width="600" height="100%" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td align="center" valign="top"><br>
      <table width="90%" border="0" cellpadding="2" cellspacing="1" class="font">
        <tr >
          <FORM language="javascript" name="myform"  action="?action=ok" method="post">
            <td ><table width="500" border="0" align="center" class="font">
                <tr>
                  <td height="25">统计代码</td>
                </tr>
                <tr>
                  <td><textarea name="txt1" cols="60" rows="10"><%=rs("txt1")%></textarea></td>
                </tr>
                <tr>
                  <td height="22" colspan="2"><div align="center">
                      <INPUT type=submit value='确认修改' name=Submit2>
                    </div></td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table></td>
  </tr>
</table>
<%
rs.close
conn.close
%>
</body>
