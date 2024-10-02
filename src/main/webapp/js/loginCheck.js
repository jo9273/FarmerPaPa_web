/**
 * login check
 */

$(document).ready(init);

function init() {
    console.log("loginCheck.js 已加載");

    // 綁定所有帶有 #login-check 的連結，進行登入狀態檢查
    $('#login-check').on('click', loginCheckHandler);
}

function loginCheckHandler(e) {
    e.preventDefault();  // 阻止默認行為

    var targetUrl = $(this).attr('href');  // 取得目標頁面

    // 發送 AJAX 請求檢查是否已登入
    $.ajax({
        type: "GET",
        url: "/fpapa/CheckLoginStatus",  // 檢查登入狀態的 URL
        success: function(response) {
            loginStatusResponse(response, targetUrl);
        },
        error: loginCheckError
    });
}

function loginStatusResponse(response, targetUrl) {
    if (response.isLoggedIn) {
        // 如果已登入，前往目標頁面
        window.location.href = targetUrl;
    } else {
        // 如果未登入，顯示登入 lightbox
		alert("請先登入會員")
        $('#loginModal').fadeIn();
    }
}

function loginCheckError() {
    alert("系統錯誤，請稍後再試");
}


