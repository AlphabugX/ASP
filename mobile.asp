<%
Function getOs()
    Dim agent,os
    agent = request.ServerVariables("HTTP_USER_AGENT") & "" 
    If InStr(1,agent, "windows nt",1)>0 Then
        os = "windows"
    Else If InStr(1,agent, "iphone",1)>0 Then
        os = "iphone"
    Else If InStr(1,agent, "ipad",1)>0 Then
        os = "ipad"
    Else If InStr(1,agent, "android",1)>0 Then
        os = "android"
    Else
        os = "other"
    End if
    End if
    End if
    End If
    getOs = os
End Function

os = getOs()

If os="windows" Then %>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Cache-Control" content="max-age=0" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>
<body>
	<table id="top">
		<tr>
		</tr>
	</table>
	<br/><br/><br/><br/><br/>
	<div class="bg">
		<table align="center">
			<tr>
				<td>您现在浏览的是手机版本，请使用手机登录</td>
			</tr>
		</table>
	</div>
</body>
</html>
<%
response.End()
end if %>