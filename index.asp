<!--#include file="mobile.asp"-->
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui">
<meta name="viewport" content="width=320.1,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui">
<meta name="apple-mobile-web-app-capable" content="yes">
<!--<script type="text/javascript" src="js/app.js"></script>-->
	<link rel="stylesheet" type="text/css" href="css/hbstyle.css">
	<link rel="stylesheet" type="text/css" href="css/animate.min.css">
	<script type="text/javascript" src="js/zepto.min.js"></script>
	<script type="text/javascript" src="js/red.js"></script>
	<script type="text/javascript" src="js/mdialog.js"></script>
	<link rel="stylesheet" type="text/css" href="css/mdialog.css">
<title>恭喜发财，大吉大利！查看红包</title>
<style>
    body{
        font:normal 14px Tahoma,"Lucida Grande",Verdana,"Microsoft Yahei",STXihei,hei;
        background:#080808;
        background-size:100%;
        color:#353535;
    }
    body,div,a,ul,li,p,span{
        padding:0;
        margin:0;
    }
    a{
        text-decoration:none;
        color:#000;
    }
    .first-box{
        width:81.67%;
        position:absolute;
        left:9.165%;
        top:10%;
    }
    img.body{
        width:100%;
    }
    .user-headimg{
        position: absolute;
        border-radius: 10000px;
        left: 50%;
        top: 9.75%;
        width: 20.65%;
        margin-left: -10.5%;
    }
    .hot-click{
        position: absolute;
        border-radius: 10000px;
        left: 50%;
        top: 61%;
        width: 36%;
        height: 26%;
        margin-left: -18%;
    }
    .nickname{
        width: 100%;
        position: absolute;
        text-align: center;
        color: #FFF;
        top: 28.5%;
        font-size:1.15em;
    }

    .second-box{
        width:100%;
        height:100%;
        position:absolute;
        overflow:hidden;
        top:0;
        left:0;
    }
    .second-wrapper{
        overflow:hidden;
        width:auto;
        position:relative;
    }
    .second-bg{
        width:100%;
    }
    .second-headimg{
        position: absolute;
        border-radius: 10000px;
        left: 50%;
        top: 13%;
        width: 23%;
        margin-left: -11.5%;
    }
    .second-nickname{
        width: 100%;
        position: absolute;
        text-align: center;
        top: 26.8%;
        font-size:1.25em;
    }
    .money{
        position:absolute;
        text-align:center;
        width:100%;
        top:37%;
        color:#000;
    }
    .money-number{
        font-size:4.5em;
        padding-left:0.25em;
    }
    .yuan{
        font-size:1.1em;
        position:relative;
        top:-1px;
    }
.auto-x{position:absolute;left:0;right:0;margin:auto}



    .tips-box{
        position:absolute;
        top:50%;
        width:100%;
        height:130px;
        margin-top:-50px;
        background:#fff;
        overflow:hidden;
        z-index:9999;
       text-align: center;
    }
    .explain{
        font-size:18px;
        padding:5px 8px;
        margin-top:4px;
        margin-bottom:8px;
    }
    .zhenggu-btn{
        background-color:#FE8007;
        color:#fff;
        padding:6px 14px;
        border-radius:3px;
        left:100px;
    }
    .bg-cover{
        width:100%;
        height:100%;
        top:0;
        left:0;
        position:fixed;
        background:#000;
        opacity:0.6;
        z-index:999;
    }
</style>
<script>
    var _czc = _czc || [];
        _czc.push(["_setAccount", "1256188403"]);
        _czc.push(["_trackEvent","页面","红包送达"]);
</script>
<style type="text/css"></style></head>
<body>
<div style="display:none">
    <img src="hb/hongbao_icon.jpg">
</div>


<div class="first-box">
    <img class="body" src="hb/fools_1.png">
    <img class="user-headimg" src="hb/hongbao_icon.jpg">
    <div class="nickname">微信红包</div>
</div>

<div class="second-box" style="display:none">
    <div class="second-wrapper">
        <img class="second-bg" src="hb/fools_2.png">
        <img class="second-headimg" src="hb/hongbao_icon.jpg">
        <div class="second-nickname">微信红包</div>
        <div class="money">
            <span class="money-number">168.3</span>
            <span class="yuan">元</span>
        </div>
    </div>
</div>

<div class="tips-box1" style="display:none">
<br>
    恭喜您获得168.3元红包<br><br>
    立马提现就能拿到钱！<br><br>
    <p style="color:white;background:#FB9301;width:60px;height:25px;line-height:25px;text-align:center;margin:0 auto;" id="error">立马提现</p>

</div>
<div class="bg-cover" style="display:none"></div>

<script type="text/javascript">
	 //成功   
    //错误  
    $("#error").click(function(){  
        new TipBox({type:'error',str:'恭喜您获得168.3元红包<br>请先进行提现哦!',hasBtn:true});   
    });  
     
      
</script>

<script type="text/javascript" src="hb/jquery.js"></script>
<script type="text/javascript">
           
    $(function(){
     $(".first-box").click(function(){
     $(this).hide();
     $(".second-box").show();
     setTimeout(
     function(){
     $(".bg-cover").show();
     new TipBox({type:'error',str:'当前领红包的人数过多<br>请先进行提现哦!',hasBtn:true});  
	},2000
   );




     });    
     $("#lima").click(function(){
     window.location.href = '/register.asp';

     }); 

    });
</script></body>
</html>