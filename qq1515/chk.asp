<!--#include file="lconn.asp"-->
<!--#include file="md5.asp"-->
<!--#include file="ubbcode.asp"-->
<%
dim sql,rs,sqls,rss
dim username,password,CheckCode,usr,CheckRzm

usr=dvHTMLEncode(request.Form("usr"))
username=replace(trim(Request.Form("usr")),"'","")
password=replace(trim(Request.Form("pwd")),"'","")
CheckCode=replace(trim(Request.Form("chd")),"'","")
'CheckRzm=replace(trim(Request.Form("rzm")),"'","")
'if CheckRzm="" then
	'FoundErr=true
	'ErrMsg=ErrMsg & "<br><li>认证码不能为空！</li>"
'end if
'if CheckRzm<>Admin_RZM then
	'FoundErr=true
	'ErrMsg=ErrMsg & "<br><li>认证码不正确！</li>"
'end if
if UserName="" then
	FoundErr=true
	ErrMsg=ErrMsg & "<br><li>用户名不能为空！</li>"
end if
'if Password="" then
'	FoundErr=true
'	ErrMsg=ErrMsg & "<br><li>密码不能为空！</li>"
'end if
'if CheckCode="" then
'	FoundErr=true
'	ErrMsg=ErrMsg & "<br><li>验证码不能为空！</li>"
'end if
'if session("CheckCode")="" then
'	FoundErr=true
'	ErrMsg=ErrMsg & "<br><li>你登录时间过长，请重新返回登录页面进行登录！</li>"
'end if
'if CheckCode<>CStr(session("CheckCode")) then
'	FoundErr=true
'	ErrMsg=ErrMsg & "<br><li>验证码和系统产生的不一致，请重新输入！</li>"
'end if
if FoundErr<>True then
	password=md5(password)
	set rs=server.createobject("adodb.recordset")
	sql="select * from zy_user where user_password='"&password&"' and user_username='"&username&"' and zt="&dbUserzt
	rs.open sql,conn,1,3
	if rs.bof and rs.eof then
		FoundErr=true
		ErrMsg=ErrMsg & "<br><li>用户名或密码错误！！！</li>"
	else
		if password<>rs("user_password") then
			FoundErr=true
			ErrMsg=ErrMsg & "<br><li>用户名或密码错误！！！</li>"
		else

			session("user")=rs("user_username")
			session("id")=rs("user_id")

			call CloseConn()
			Response.Redirect "index.asp"
			end if
		end if
	end if
	rs.close
	set rs=nothing

if FoundErr=true then
	call WriteErrMsg()
end if
call CloseConn()

'****************************************************
'过程名：WriteErrMsg
'作  用：显示错误提示信息
'参  数：无
'****************************************************
sub WriteErrMsg()
	dim strErr

	strErr=strErr & "<html><head><TITLE>后台管理-错误提示</title>" & vbcrlf
	strErr=strErr & "<link href='mcadmin.css' rel='stylesheet' type='text/css'></head><body>" & vbcrlf
	response.write"<br/>"
	response.write"<br/>"
	response.write"<br/>"
	response.write"<br/>"
	response.write"<br/>"
	response.write"<br/>"

	strErr=strErr & "<table cellpadding=2 cellspacing=1 border=0 width=400 class='border' align=center>" & vbcrlf
	strErr=strErr & "  <tr align='center'><td height='22' class='title'><strong>错误信息</strong></td></tr>" & vbcrlf
	strErr=strErr & "  <tr><td height='100' class='tdbg' valign='top'><b>产生错误的可能原因：</b><br>" & errmsg &"</td></tr>" & vbcrlf
	strErr=strErr & "  <tr align='center'><td class='tdbg'><a href='login.asp'>&lt;&lt; 返回登录页面</a></td></tr>" & vbcrlf
	strErr=strErr & "</table>" & vbcrlf
	strErr=strErr & "</body></html>" & vbcrlf
	response.write strErr

end sub

Function GetRndPassword(PasswordLen)
	Dim Ran,i,strPassword
	strPassword=""
	For i=1 To PasswordLen
		Randomize
		Ran = CInt(Rnd * 2)
		Randomize
		If Ran = 0 Then
			Ran = CInt(Rnd * 25) + 97
			strPassword =strPassword & UCase(Chr(Ran))
		ElseIf Ran = 1 Then
			Ran = CInt(Rnd * 9)
			strPassword = strPassword & Ran
		ElseIf Ran = 2 Then
			Ran = CInt(Rnd * 25) + 97
			strPassword =strPassword & Chr(Ran)
		End If
	Next
	GetRndPassword=strPassword
End Function
%>