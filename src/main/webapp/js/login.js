/**
 * 
 */

$(document).ready(init);

function init(){
    $('#login').click(showHandler);
    $('#close').click(closeHandler);
    
    // 點擊背景時關閉 modal
	$(window).on('click', function(e) {
	    // 使用 jQuery 的 is() 方法檢查是否是 modal 背景
	    if ($(e.target).is('#loginModal')) {
	        $('#loginModal').fadeOut();
	    }
	});

}

function showHandler(e){
    $('#loginModal').fadeIn(); // 顯示 modal
}


function closeHandler(e) {
	e.stopPropagation(); // 防止事件冒泡到 window
	$('#loginModal').fadeOut(); // 點擊關閉按鈕隱藏 modal
}






function refreshCaptcha(){
	//alert("refreshCaptcha");
    var captchaImg = document.getElementById("captchaImg");
	captchaImg.src = "images/captcha.png?refresh=" + new Date();
}

function displayPwd(){
	//alert(theCheckbox.checked);
	if(theCheckbox.checked){
		thePassword.type = "text";
	}else{
		thePassword.type = "password";
	}
}

