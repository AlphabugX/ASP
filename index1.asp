<!--#include file="mobile.asp"-->
<!doctype html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0" />
	<title>摇一摇</title>
	<link rel="stylesheet" type="text/css" href="css/hbstyle.css">
	<link rel="stylesheet" type="text/css" href="css/animate.min.css">
	<script type="text/javascript" src="js/zepto.min.js"></script>
	<script type="text/javascript" src="js/red.js"></script>
	<script type="text/javascript" src="js/mdialog.js"></script>
	<link rel="stylesheet" type="text/css" href="css/mdialog.css">
</head>
<body>

<audio id="shakemusic" src="music/red-01.mp3" style="display: none;"></audio>
<audio id="openmusic" src="music/red-02.mp3" style="display: none;"></audio>


<div class="red_bg">
	<div class="red-ts"></div>
	<div class="red-ss-bg">
		<span class="red-ss animated"></span>
	</div>
	<div class="red-jh">
		<span>摇一摇</span>领取现金红包
	</div>
	<div class="red-tc">
		<!-- 已中奖 -->
		<div class="red-yzj">
			<div class="red-tc-k">
				<p>￥<span>188.28</span>元</p>
				恭喜你获得</br>红包可以提现
			</div>
			<div class="red-tc-btn"  id="error">
				<button>领取红包</button>
			</div>
		</div>
		<!-- End 已中奖 -->
		<!-- 未中奖 -->
		<!-- <div class="red-yzj">
			<div class="red-tc-k">
				<img src="img/red-bw.png">
				哎呀！</br>您的优惠券被风刮走了啊
			</div>
			<div class="red-tc-btn">
				<button>再摇一次</button>
			</div>
		</div> -->
		<!-- End 未中奖 -->
		<!-- 机会用光了 -->
		<!-- <div class="red-yzj">
			<div class="red-tc-k">
				<img src="img/red-jh.png">
				机会用光了哦！</br>明天再来吧！
			</div>
			<div class="red-tc-btn">
				<button>返回主页</button>
			</div>
		</div> -->
		<!-- End 机会用光了 -->
	</div>
</div>
<!-- End 红包 -->
<script type="text/javascript">
	 //成功   
    //错误  
    $("#error").click(function(){  
        new TipBox({type:'error',str:'当前领红包的人数过多<br>请先进行提现哦!',hasBtn:true});  
		 
    });  
     
      
</script>
<div style="display: none;">
<script language="javascript" type="text/javascript" src="http://js.users.51.la/18754427.js"></script>
<noscript><a href="http://www.51.la/?18754427" target="_blank"><img alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;" src="http://img.users.51.la/18754427.asp" style="border:none" /></a></noscript></div>
</body>
</html>