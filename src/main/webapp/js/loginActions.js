$(document).ready(init);

function init() {
    // 綁定顯示登入模態框的按鈕點擊事件
    $('#loginTrigger').on('click', showLoginModal);

    // 在登入模態框中，點擊 "註冊會員" 連結，切換到註冊模態框
    $('#toSignup').on('click', function(event) {
        event.preventDefault(); // 阻止預設的連結行為
        switchToSignup();
    });

    // 在註冊模態框中，點擊 "登入會員" 連結，切換到登入模態框
    $('#toLogin').on('click', function(event) {
        event.preventDefault(); // 阻止預設的連結行為
        switchToLogin();
    });

    // 綁定關閉登入模態框的按鈕點擊事件
    $('#closeLogin').on('click', function() {
        closeModal('#loginModal');
    });

    // 綁定關閉註冊模態框的按鈕點擊事件
    $('#closeSignup').on('click', function() {
        closeModal('#signupModal');
    });

    // 點擊登入模態框外部時，關閉模態框
    $('#loginModal').on('click', function(event) {
        if ($(event.target).is('#loginModal')) {
            closeModal('#loginModal');
        }
    });

    // 點擊註冊模態框外部時，關閉模態框
    $('#signupModal').on('click', function(event) {
        if ($(event.target).is('#signupModal')) {
            closeModal('#signupModal');
        }
    });

    // 綁定登入模態框的顯示/隱藏密碼功能
    $('#toggleLoginPwd').on('click', function() {
        togglePassword('#loginPassword', '#toggleLoginPwd');
    });

    // 綁定註冊模態框的顯示/隱藏密碼功能
    $('#toggleSignupPwd').on('click', function() {
        togglePassword('#signupPassword', '#toggleSignupPwd');
    });
}

// 顯示登入模態框
function showLoginModal() {
    $('#loginModal').fadeIn();
}

// 顯示註冊模態框
function showSignupModal() {
    $('#signupModal').fadeIn();
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
        toggleIcon.attr('src', 'images/eye_fill_icon.png');
    } else {
        // 隱藏密碼
        passwordField.attr('type', 'password');
        // 更換為隱藏密碼的圖示
        toggleIcon.attr('src', 'images/eye_slash_fill_icon.png');
    }
}



// 刷新驗證碼圖片的函數
function refreshCaptcha() {
    var captchaImg = document.getElementById("captchaImg"); // 取得驗證碼圖片元素
    captchaImg.src = "images/captcha.png?refresh=" + new Date().getTime(); // 重新設定圖片來源，加入時間戳避免快取
}
