<%
'--------SQL��ע�붨�岿��------------------
Dim Fy_Post,Fy_Get,Fy_In,Fy_Inf,Fy_Xh
'Fy_In = "join|union|like|modify|cast|drop|exec|insert|select|delete|update|count|alter|rename|chr|mid|truncate|char|declare|'"
Fy_In = "join|union|modify|cast|drop|exec|insert|select|delete|update|char"
Fy_Inf = split(Fy_In,"|")
'--------POST����------------------
If Request.Form<>"" Then
For Each Fy_Post In Request.Form
For Fy_Xh=0 To Ubound(Fy_Inf)
If Instr(LCase(Request.Form(Fy_Post)),Fy_Inf(Fy_Xh))<>0 Then
Response.Write "<Script Language=JavaScript>alert('��ʾ��\n\n���ı��˲���ʧ���ˣ�\n\n�벻Ҫ����SQLע��������Υ����Ϣ��');history.back();</Scr"&"ipt>"
Response.End
End If
Next
Next
End If
'--------GET����-------------------
If Request.QueryString<>"" Then
For Each Fy_Get In Request.QueryString
For Fy_Xh=0 To Ubound(Fy_Inf)
If Instr(LCase(Request.QueryString(Fy_Get)),Fy_Inf(Fy_Xh))<>0 Then
Response.Write "<Script Language=JavaScript>alert('��ʾ��\n\n���ı��˲���ʧ���ˣ�\n\n�벻Ҫ����SQLע��������Υ����Ϣ��');history.back();</Scr"&"ipt>"
Response.End
End If
Next
Next
End If
'----------------------------------
%>
<%
dim conn
db="vdata/db.mdb" '���ݿ��ļ�λ��
set conn=server.createobject("ADODB.CONNECTION")
'Access ���ݿ�����
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&db&"")
sub CloseConn()
	conn.close
	set conn=nothing
end sub

Dim NumTemp
Randomize Timer
NumTemp=Int((9*Rnd())+1)
cz=conn.execute("select ccb from config where id=1")(0)
%>