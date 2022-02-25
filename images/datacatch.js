$(function(){
	//init_rqimg("");
	$("a").live("click",function(){
		var getaname=$(this).attr("name");
		if(getaname==undefined){
			getaname="";
		}
		var getahref=$(this).attr("href");
		var getatitle=$(this).text();
		var getcontent=getaname+"|@|"+getahref+" |@|"+getatitle+" |@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@||@|";
		init_rqimg(getcontent);
	});
});