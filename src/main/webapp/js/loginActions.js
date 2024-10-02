//$(document).ready(init);
$(init);

function init() {
	
    // 綁定顯示登入模態框的按鈕點擊事件
    $('#loginTrigger').on('click', showLoginModal);

    // 在登入模態框中，點擊 "註冊會員" 連結，切換到註冊模態框
    $('#toSignup').on('click', handleToSignupClick);

    // 在註冊模態框中，點擊 "登入會員" 連結，切換到登入模態框
    $('#toLogin').on('click', handleToLoginClick);

    // 綁定關閉登入模態框的按鈕點擊事件
    $('#closeLogin').on('click', handleCloseLoginClick);

    // 綁定關閉註冊模態框的按鈕點擊事件
    $('#closeSignup').on('click', handleCloseSignupClick);

    // 點擊登入模態框外部時，關閉模態框
    $('#loginModal').on('click', handleLoginModalClick);

    // 點擊註冊模態框外部時，關閉模態框
    $('#signupModal').on('click', handleSignupModalClick);

    // 綁定登入模態框的顯示/隱藏密碼功能
    $('#toggleLoginPwd').on('click', handleToggleLoginPwdClick);

    // 綁定註冊模態框的顯示/隱藏密碼功能
    $('#toggleSignupPwd').on('click', handleToggleSignupPwdClick);
	
	
	// 綁定登入表單的提交事件，使用 AJAX 進行提交
	var $loginForm = $("#loginForm");
	var $loginEmail = $("#loginEmail");
	var $loginPassword = $("#loginPassword");
	var $loginCaptcha = $("#loginCaptcha");
	var $loginModal = $("#loginModal");
	var $theErrorsDiv = $("#theErrorsDiv");

	$loginForm.submit(function(e) {
		e.preventDefault();  // 阻止表單的默認提交動作

		// 進行 AJAX 請求
		$.ajax({
			type: "POST",
			url: "/fpapa/login.do",  // 指向 Servlet
			data: {
				email: $loginEmail.val(),
				password: $loginPassword.val(),
				captcha: $loginCaptcha.val()
			},
			success: function(response) {
				// 判斷是否登入成功
				if (response.success) {
					alert("登入成功！");
					$loginModal.hide();
					$loginForm[0].reset(); // 清空表單
					window.location.reload();  // 刷新當前頁面
				} else {
					// 顯示錯誤訊息
					$theErrorsDiv.html("<p>" + response.errorMessage + "</p>");
					alert(response.errorMessage);

					// 清空表單的輸入框內容
					$loginEmail.val('');
					$loginPassword.val('');
					$loginCaptcha.val('');

					// 更新驗證碼
					refreshLoginCaptcha();
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				// 當 AJAX 請求失敗時，執行此函數
				alert("系統錯誤，請稍後再試");
				console.log("AJAX 請求失敗，狀態: " + textStatus);
				console.log("錯誤: " + errorThrown);
				console.log("伺服器返回: " + jqXHR.responseText);
			}
		});
	});


	// 綁定註冊表單的提交事件，使用 AJAX 進行提交
	var $signupForm = $("#signupForm");
	var $signupEmail = $("#signupEmail");
	var $signupPassword = $("#signupPassword");
	var $signupCaptcha = $("#signupCaptcha");
	var $signupModal = $("#signupModal");
	var $theErrorsDiv = $("#theErrorsDiv");

	$signupForm.submit(function(e) {
		e.preventDefault();  // 阻止表單的默認提交動作

		// 進行 AJAX 請求
		$.ajax({
			type: "POST",
			url: "/fpapa/register.do",  // 指向 Servlet
			data: {
				email: $signupEmail.val(),
				password: $signupPassword.val(),
				phone: $("input[name='phone']").val(),
				name: $("input[name='name']").val(),
				birthday: $("input[name='birthday']").val(),
				gender: $("input[name='gender']:checked").val(),
				address: $("textarea[name='address']").val(),
				subscribed: $("input[name='subscribed']").is(":checked") ? "on" : "",
				captcha: $signupCaptcha.val()
			},
			success: function(response) {
				if (response.success) {
					alert("註冊成功！");
					$signupModal.hide();  // 隱藏註冊的 lightbox
					window.location.reload();  // 刷新當前頁面
				} else {
					$theErrorsDiv.html("<p>" + response.errorMessage + "</p>");
					alert(response.errorMessage);

					// 清空表單
					$signupEmail.val('');
					$signupPassword.val('');
					$signupCaptcha.val('');

					// 刷新驗證碼
					refreshSignupCaptcha();
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert("系統錯誤，請稍後再試");
				console.log("AJAX 請求失敗，狀態: " + textStatus);
				console.log("錯誤: " + errorThrown);
				console.log("伺服器返回: " + jqXHR.responseText);
			}
		});
	});


}

// 顯示登入模態框
function showLoginModal() {
    $('#loginModal').fadeIn();
}

// 處理點擊 "註冊會員" 連結的事件
function handleToSignupClick(e) {
    e.preventDefault(); // 阻止預設的連結行為
    switchToSignup();
}

// 處理點擊 "登入會員" 連結的事件
function handleToLoginClick(e) {
    e.preventDefault(); // 阻止預設的連結行為
    switchToLogin();
}

// 處理關閉登入模態框按鈕的事件
function handleCloseLoginClick() {
    closeModal('#loginModal');
}

// 處理關閉註冊模態框按鈕的事件
function handleCloseSignupClick() {
    closeModal('#signupModal');
}

// 處理點擊登入模態框外部的事件
function handleLoginModalClick(e) {
    if ($(e.target).is('#loginModal')) {
        closeModal('#loginModal');
    }
}

// 處理點擊註冊模態框外部的事件
function handleSignupModalClick(e) {
    if ($(e.target).is('#signupModal')) {
        closeModal('#signupModal');
    }
}

// 處理登入模態框的顯示/隱藏密碼功能
function handleToggleLoginPwdClick() {
    togglePassword('#loginPassword', '#toggleLoginPwd');
}

// 處理註冊模態框的顯示/隱藏密碼功能
function handleToggleSignupPwdClick() {
    togglePassword('#signupPassword', '#toggleSignupPwd');
}

// 切換到註冊模態框
function switchToSignup() {
    // 關閉登入模態框，並在動畫結束後顯示註冊模態框
    $('#loginModal').fadeOut(function() {
        clearForm('#loginModal');
        $('#signupModal').fadeIn();
    });
}

// 切換到登入模態框
function switchToLogin() {
    // 關閉註冊模態框，並在動畫結束後顯示登入模態框
    $('#signupModal').fadeOut(function() {
        clearForm('#signupModal');
        $('#loginModal').fadeIn();
    });
}

// 關閉指定的模態框，並清除表單資料
function closeModal(modalId) {
    $(modalId).fadeOut(function() {
        clearForm(modalId);
    });
}

// 清除模態框中的表單資料
function clearForm(modalId) {
    // 清空文字輸入、密碼、電子郵件、電話、日期和文字區域等欄位的值
    $(modalId).find('input[type="text"], input[type="password"], input[type="email"], input[type="tel"], input[type="date"], textarea').val('');
    // 取消所有單選按鈕和複選框的選取狀態
    $(modalId).find('input[type="radio"], input[type="checkbox"]').prop('checked', false);
}

// 顯示或隱藏密碼
function togglePassword(passwordFieldSelector, toggleIconSelector) {
    var passwordField = $(passwordFieldSelector);
    var toggleIcon = $(toggleIconSelector);

    if (passwordField.attr('type') === 'password') {
        // 顯示密碼
        passwordField.attr('type', 'text');
        // 更換為顯示密碼的圖示
        toggleIcon.attr('src', '/fpapa/images/eye_fill_icon.png');
    } else {
        // 隱藏密碼
        passwordField.attr('type', 'password');
        // 更換為隱藏密碼的圖示
        toggleIcon.attr('src', '/fpapa/images/eye_slash_fill_icon.png');
    }
}


// 刷新驗證碼圖片的函數
function refreshLoginCaptcha() {
    var captchaImg = document.getElementById("LoginCaptcha"); // 取得驗證碼圖片元素
    captchaImg.src = "/fpapa/images/captcha.png?refresh=" + new Date().getTime(); // 重新設定圖片來源，加入時間戳避免快取
}

function refreshSignupCaptcha() {
    var captchaImg = document.getElementById("SignupCaptcha"); // 取得驗證碼圖片元素
    captchaImg.src = "/fpapa/images/captcha.png?refresh=" + new Date().getTime(); // 重新設定圖片來源，加入時間戳避免快取
}
