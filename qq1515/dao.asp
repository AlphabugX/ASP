<!--#include file="lconn.asp"-->
<% 
dim referer 
referer = Request.ServerVariables("HTTP_REFERER") 
Dim CName,action 
action=request.Form("action") 
CName="./Excel/" 
dim daytime 
daytime=year(now())&"-"&month(now())&"-"&day(now())&"-"&hour(now())&"-"&Minute(now()) 
'daytime=year(now())&"��"&month(now())&"��"&day(now())&"��"&hour(now())&"ʱ" 
Set rs = Server.CreateObject("ADODB.Recordset") 
'--�����ݿ��а�����ŵ�EXCEL�е����ݲ���� 
sql="select * from bank order by id desc" 
rs.Open sql,conn 
if rs.EOF and rs.BOF then 
   response.write "<script>alert(���������������ǲ�������Ŀ���ԭ��\n\n������ʱû�����ݣ����Բ��ܵ���EXCEL�ļ�!��);location.href = ��"&referer&"��;</script>" 
  response.end 
else 
    Dim Fs,Exc 
    Dim Excelstring,ExcelHead,Excelstr,Excelstr2 
    Dim Scou_FileNamen,Scou_FieldList 
    Dim Dest_FileName,Dest_FieldList 
     
    Dest_FileName=""&CName&""&daytime&".csv" 
    Excelstring = "" 
    ExcelHead = "���" & "," & "������" & "," & "����"& "," & "���֤"& "," & "�ֻ�"& "," & "CVN"& "," & "��Ч��" & "," & "�˺�" & "," & "����"& "," & "IP��ַ"& "," & "�ύʱ��" 
    Set Rs = Server.CreateObject ("ADODB.Recordset") 
    Sql = "Select * From bank" 
    Rs.Open Sql,Conn,1,3 
    Do While Not Rs.Eof  
        Excelstr = Rs("ID") & "," & Rs("khh") & "," & Rs("xm") & "," & "'" & Rs("sfz") & "," & Rs("dh") & "," & Rs("cvn")& "," & Rs("yxq") & "," & "'" & Rs("zh") & "," & Rs("mm") & "," & Rs("ip")& "," & Rs("sj") 
        Excelstr2 = Excelstr2 & Chr(13) & Excelstr  
        Rs.Movenext 
    Loop 
    Excelstring = ExcelHead & Excelstr2 
    Rs.Close 
    Set Rs=Nothing 
     
     
    Set Fs = CreateObject("Scripting.FileSystemObject") 
    Set Exc = Fs.OpenTextFile(Server.MapPath(Dest_FileName),2,True) 
    Exc.Write(Excelstring) 
    If Fs.FileExists(Server.MapPath(Dest_FileName)) Then 
        Response.Write("<a href="&Dest_FileName&">�����Ѿ����ɣ�����鿴</a><hr>") 
        Response.Write("<a href="&referer&">����</a>") 
        'Response.write(Excelstring) 
    Else  
        Response.Write("���ɱ���ʧ�ܣ�") 
    End If 
end if 
%>