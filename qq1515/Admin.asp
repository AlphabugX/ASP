<%
if session("user")="" then
	response.write "<script language=JavaScript>{window.alert('�Բ������ȵ�½��');}</script>"
	response.Redirect "login.asp"
	response.end
end if
%>