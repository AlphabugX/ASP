<%
if session("user")="" then
	response.write "<script language=JavaScript>{window.alert('对不起，请先登陆！');}</script>"
	response.Redirect "login.asp"
	response.end
end if
%>