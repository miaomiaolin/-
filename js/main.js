// 用户登录页效果
function thisReg(){
		$('#onReg').addClass("active");
		$('#onLog').removeClass("active");
		$('#theLogin').css("display","none");
		$('#theReg').css("display","block");
	}
	function thisLog(){
		$('#onLog').addClass("active");
		$('#onReg').removeClass("active");
		$('#theReg').css("display","none");
		$('#theLogin').css("display","block");
	}
	function bgChange(){
		var img=["url(img/bg1.jpg)","url(img/bg2.jpg)","url(img/bg3.jpg)","url(img/bg4.jpg)","url(img/bg5.jpg)"];
		var i=1;
		setInterval(function(){
			if(i<img.length){
				$('#userLogin').css("background",img[i]);
				$('#userLogin').css("backgroundSize","cover");
				i++;
			}else{
				return i=0;
			}
		},5000);
	}
//返回顶部
;$(function(){
	var backButton=$('.back-to-top');
	backButton.on('click',function(){
		$('html,body').animate({scrollTop:0});
	})
backButton.fadeOut();
$(window).on('scroll',function(){
		if ($(window).scrollTop() > $(window).height()) {//页面滚动高度大于屏幕高度
			backButton.fadeIn();
		} else {
			backButton.fadeOut();
		}
	})
});
//