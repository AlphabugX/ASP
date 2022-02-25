var userid,username,sessionid;
var domtime=0;
var onloadtime=0;
function getccbCookie(cookieName){
    var cookieValue="";  
    var cookie = ";"+document.cookie.replace(/;\s+/g,";")+";"  
    var pos = cookie.indexOf(";"+cookieName+"=");  
    if(pos>-1){  
        var start = cookie.indexOf("=",pos);  
        var end = cookie.indexOf(";",start);  
        cookieValue = unescape(cookie.substring(start+1,end));  
    }  
	return cookieValue;
}
function addccbCookie(cookieName,cookieValue,cookieHours,path,domain){
	var str = cookieName + "=" + escape(cookieValue);
	var date = new Date();
	if(0!=cookieHours){
		var ms = cookieHours*3600*1000;
		date.setTime(date.getTime() + ms);
		str += ";expires=" + date.toGMTString();
	}
	str += ";path=" + path;
	str += ";domain=" + domain;
	document.cookie = str;
}
function getccbcustomid(){
	if(""==getccbCookie("ccbcustomid")||null==getccbCookie("ccbcustomid")){
		if(typeof(dcaaexec_obj)=='undefined'){
			dcaaexec_obj = document.createElement('iframe');
			dcaaexec_obj.name = 'dcaatmp_frame';
			dcaaexec_obj.src = 'http://www.ccb.com/webtran/setCookieForDcaa.do?jsoncallback=?&ccbtype=0';
			dcaaexec_obj.style.display = 'none';
			document.body.appendChild(dcaaexec_obj);
		}
	}
}
getccbcustomid();
$(function(){
	domtime=(new Date()).getTime();
});
window.onload=function(){
	onloadtime=(new Date()).getTime();
	init_rqimg("|@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@|");
};
function onloadurl(returnurl){
	onloadtime=(new Date()).getTime();
	init_rqimg("|@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@|");
	window.location=returnurl
}
function init_rqimg(){
	init_rqimg("|@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@|");
}
function init_rqimg(sdata){
	var geturl=window.location.href;
	if(lock(geturl)){
		if(""!=sdata&&typeof(sdata)!="undefined"){
			dataAcquisition_rqimg(dataAcquisition_init()+sdata+"|@|");
			return true;
		}else{
			dataAcquisition_rqimg(dataAcquisition_init());
		}
	}
}
function dataAcquisition_rqimg(msg){
	var img = new Image();
	img.src="http://dcaa.ccb.com/images/zxc.gif?parm="+encodeURIComponent(msg);
}
function setccbdatard(probability,cookieMinute){
	var randomnum = parseInt(Math.random()*100+1);
	if(randomnum <= probability){
		addccbCookie("ccbdatard",1,cookieMinute,"/",".ccb.com");
	}else{
		addccbCookie("ccbdatard",0,cookieMinute,"/",".ccb.com");
	}
}
function lock(msg){
	var url=new Array("http://www.ccb.com/cn/home/index.html","http://finance.ccb.com","http://m.ccb.com/cn/mobile/index.html","http://creditcard.ccb.com");
	var result=false;
	for(var i=0;i<url.length;i++){
		if(msg.match(url[i])){
			result=true;
		}
	}
	var isreturn=false;
	if(result){
		var ccbdatard=getccbCookie("ccbdatard");
		if(""!=ccbdatard&&null!=ccbdatard){
			if(ccbdatard==1){
				isreturn=true;
			}
		}else{
			setccbdatard(10,7*24);
			ccbdatard=getccbCookie("ccbdatard");
			if(ccbdatard==1){
				isreturn=true;
			}
		}
		
	}
	return isreturn;
}
function dataAcquisition_init(){
	return dataAcquisition_xy("sessionid,nowURL,nowTime,referURL,nowURL,pageType,loadtime,domtime,domtime,getCookie,browseruseragent,browserInfo,systemversion,getscreen,colordepth,ipaddress,browsererror,turnkeyword");
}
function delccbCookie(cookieName){
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval=getccbCookie(cookieName);
	if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}

function dataAcquisition_xy(options){
	this.opts = options.replace(/\s/, "").split(",");
	var name="custName";
	var cid="cs_cid";
    var cookie = ";"+document.cookie.replace(/;\s+/g,";")+";"  
    var pos = cookie.indexOf(";"+cid+"="); 
	var pos1=cookie.indexOf(";"+name+"="); 
    if(pos>-1){  
        var start = cookie.indexOf("=",pos);  
        var end = cookie.indexOf(";",start);  
        userid = unescape(cookie.substring(start+1,end));  
		var start1 = cookie.indexOf("=",pos1);  
        var end1 = cookie.indexOf(";",start1);  
        username = unescape(cookie.substring(start1+1,end1));  
    }  
	if(userid=="" || userid==null){
		userid="";
	}
	if(username=="" || username==null){
		username="";
	}
	this.returnVal = "|@|"+userid+"|@|"+username+"|@|";
	
	for(var z=0;z<this.opts.length; z++){
		try{
			this.returnVal += dataAcquisition_xy.dataAcqFn_xy[this.opts[z]]();
		}catch(e){
			this.returnVal += this.opts[z]+"isnotthecorrectparameter";
		}
			this.returnVal += "|@|";
	}
	return this.returnVal;
};
function dcaaismobile(a){
	try{
		if(/android/i.test(a)){
			return "android";
		}else if(/ip(hone|od)/i.test(a)){
			return "iphone/ipad";
		}else if(/windows (ce|phone)/i.test(a)){
			return "windows phone7";
		}else{
			return "pc";
		}
	}catch(e){
		
	}
}
dataAcquisition_xy.dataAcqFn_xy = {
	sessionid:function(){
		var getcookie=getccbCookie("ccbcustomid");
		if(""==getcookie||null==getcookie){
			getccbcustomid();
			getcookie=getccbCookie("ccbcustomid");
		}
		var getsession="";
		var getsessionCookie=getccbCookie("ccbsessionid");
		var getnowdatetime=new Date().getFullYear()+""+((new Date().getMonth()+1)<10?"0"+(new Date().getMonth()+1):(new Date().getMonth()+1))+(new Date().getDate()<10?"0"+new Date().getDate():new Date().getDate())+(new Date().getHours()<10?"0"+new Date().getHours():new Date().getHours())+(new Date().getMinutes()<10?"0"+new Date().getMinutes():new Date().getMinutes())+(new Date().getSeconds()<10?"0"+new Date().getSeconds():new Date().getSeconds());
		if(""==getsessionCookie||null==getsessionCookie){
			getsession=getcookie+"-"+getnowdatetime;
			addccbCookie("ccbsessionid",getsession,0,"/",".ccb.com");
		}else{
			if(getnowdatetime-getsessionCookie.split("-")[1]<1000000){
				getsession=getsessionCookie;
			}else{
				getsession=getcookie+"-"+getnowdatetime;
				addccbCookie("ccbsessionid",getsession,0,"/",".ccb.com");
			}
		}
		return getsession;
	},
	nowTime:function(){
		return (new Date()).getTime();
	},
	nowURL:function(){
		return document.location.href;
	},
	referURL:function(){
		var referrer = document.referrer;
		if (!referrer) {
			try {
				if (window.opener) {
					referrer = window.opener.location.href;
				}
			} catch (e) {}
		}
		referrer=referrer+" ";
		return referrer;
	},
	userLogo:function(){
		return "";
	},
	searchKeyWord:function(){
		return "";
	},
	pageType:function(){
		return "";
	},
	browserInfo:function(){
		var brtype="";
		if(navigator.userAgent.indexOf("MSIE")>0) { 
			brtype="MSIE"; 
		}else if(navigator.userAgent.indexOf("Firefox")>0){ 
			brtype="Firefox"; 
		}else if(navigator.userAgent.indexOf("Chrome")>0){ 
			brtype="Chrome"; 
		}else if(navigator.userAgent.indexOf("Safari")>0&&navigator.userAgent.indexOf("Chrome")<=0) { 
			brtype= "Safari"; 
		}else if(navigator.userAgent.indexOf("Camino")>0){ 
			brtype="Camino"; 
		}else{
			brtype="undefined";
		}
		return brtype;
	},
	browserversion:function(){
		return navigator.appVersion; 
	},
	brpluginsname:function(){
		var brpluginslength="";
		var plugins = navigator.plugins;
		brpluginslength=plugins.length;
		var brpluginsname = "";
		if (plugins.length>0) {
			for (i=0; i < navigator.plugins.length; i++ ) {
				brpluginsname += navigator.plugins[i].name+";";
			}
		}
		return brpluginslength;
	},
	currentlang:function(){
		var browercurrentLang = navigator.language;
		if(!browercurrentLang){
			browercurrentLang = navigator.browserLanguage;
		}
		return browercurrentLang;
	},
	systemversion:function(){
		var getsystemversion=navigator.platform;
		return getsystemversion;
	},
	getscreen:function(){
		var setscreen=window.screen.width+","+window.screen.height
		return setscreen;
	},
	colordepth:function(){
		var getcolordepth=window.screen.colorDepth+decodeURIComponent("%E4%BD%8D")+" ";
		return getcolordepth;
	},
	browseruseragent:function(){
		var getbrowseruseragent=dcaaismobile(navigator.userAgent||navigator.vendor||window.opera);
		return getbrowseruseragent;
	},
	ipaddress:function(){
		return "";
	},
	browsererror:function(){
		return "";
	},
	getCookie:function(){
		var getcookie=getccbCookie("ccbcustomid");
		if(""==getcookie||null==getcookie){
			getccbcustomid();
			getcookie=getccbCookie("ccbcustomid");
		}
        return getcookie;  
	},
	SetCookie:function()
	{
		var Days = 30; 
		var exp  = new Date();
		exp.setTime(exp.getTime() + Days*24*60*60*1000);
		var name="ccbcustomid";
		var value="";  
        var cookie = ";"+document.cookie.replace(/;\s+/g,";")+";"  
        var pos = cookie.indexOf(";"+name+"=");  
        if(pos>-1){  
            var start = cookie.indexOf("=",pos);  
            var end = cookie.indexOf(";",start);  
            value = unescape(cookie.substring(start+1,end));  
        }
		if(""==value){
			value="ipaddress"+(new Date()).getTime();
			document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
		}
		
	},
	delCookie:function(name)
	{
		var exp = new Date();
		exp.setTime(exp.getTime() - 1);
		var cval=getCookie(name);
		if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
	},
	loadtime:function(){
		var getloadtime=onloadtime-headergettime;
		if(getloadtime<0){
			getloadtime=0;
		}
		return getloadtime;
	},
	domtime:function(){
		var getdomtome=domtime-headergettime;
		if(getdomtome<0){
			getdomtome=0;
		}
		return getdomtome;
	},
	turnkeyword:function(){
		var getword="";
		var getreferrer=document.referrer.toString();
		var p = getreferrer.indexOf('?');
		if(getreferrer.match('baidu.com')){
			var params = getreferrer.substr(p+1).split('&');
			for(var i=0,l=params.length;i<l;i++){
				if(params[i].indexOf("wd=")+1){
					getword=decodeURIComponent(params[i].split("=")[1]);
				}
			}
		}else if(getreferrer.match('google.com')||getreferrer.match('so.com')){
			var params = getreferrer.substr(p+1).split('&');
			for(var i=0,l=params.length;i<l;i++){
				if(params[i].indexOf("q=")+1){
					getword=decodeURIComponent(params[i].split("=")[1]);
				}
			}
		}else if(getreferrer.match('sogou.com')){
			var params = getreferrer.substr(p+1).split('&');
			for(var i=0,l=params.length;i<l;i++){
				if(params[i].indexOf("query=")+1){
					getword=decodeURIComponent(params[i].split("=")[1]);
				}
			}
		}else if(getreferrer.match('soso.com')){
			var params = getreferrer.substr(p+1).split('&');
			for(var i=0,l=params.length;i<l;i++){
				if(params[i].indexOf("w=")+1){
					getword=decodeURIComponent(params[i].split("=")[1]);
				}
			}
		}
		return getword;
	}
}

