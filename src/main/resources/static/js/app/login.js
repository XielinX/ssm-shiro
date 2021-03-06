$(document).ready(function () {

    $('input').iCheck({
        checkboxClass: 'icheckbox_minimal-green',
        radioClass: 'iradio_minimal-green',
        increaseArea: '20%'
    });

    var $formPanelTwo = $('.form-panel.two');

    var panelOne = $formPanelTwo.height();
    var panelTwo = $formPanelTwo[0].scrollHeight;

    $formPanelTwo.not('.form-panel.two.active').on('click', function (e) {
        e.preventDefault();

        $('.form-toggle').addClass('visible');
        $('.form-panel.one').addClass('hidden');
        $('.form-panel.two').addClass('active');
        $('.form').animate({
            'height': panelTwo
        }, 200);
    });

    $('.form-toggle').on('click', function (e) {
        e.preventDefault();
        $(this).removeClass('visible');
        $('.form-panel.one').removeClass('hidden');
        $('.form-panel.two').removeClass('active');
        $('.form').animate({
            'height': panelOne + 92
        }, 200);
    });


    //离焦校验新注册的用户名
    var obj = $(".two input[name='userName']");
    obj.on("blur",function () {
       $.post("user/verifyUserName",{userName : obj.val().trim()},function (data) {
           console.log('checkName:' + data);
           if (data){
               $MB.n_success("用户名可用");
           }else {
               $MB.n_success("用户名不可用");
           }
       })
    });
});


function reloadCode() {
    $("#validateCodeImg").attr("src", "gifCode?data=" + new Date() + "");
}

/**
 * 登录事件
 */
function login() {
    var $loginButton = $("#loginButton");
    var username = $(".one input[name='username']").val().trim();
    var password = $(".one input[name='password']").val().trim();
    var code = $(".one input[name='code']").val().trim();
    var rememberMe = $(".one input[name='rememberMe']").is(':checked');

    //校验
    if (username === "") {
        $MB.n_warning("请输入用户名！");
        return;
    }
    if (password === "") {
        $MB.n_warning("请输入密码！");
        return;
    }
    if (code === "") {
        $MB.n_warning("请输入验证码！");
        return;
    }
    $loginButton.html("").append("<div class='login-loder'><div class='line-scale'><div></div><div></div><div></div><div></div><div></div></div></div>");

    //ajax登录
    $.ajax({
        type: "post",
        url: "login",
        data: {
            "username": username,
            "password": password,
            "rememberMe": rememberMe,
            "code": code
        },
        dataType: "json",
        success: function (r) {
            if (r.code === 200) {
                location.href = 'index';
            } else {
                reloadCode();
                $MB.n_warning(r.message);
                $loginButton.html("登录");
            }
        },
        error:function(r){
            $MB.n_warning(r.message);
        }
    });
}

/**
 * 注册事件
 */
function register() {
    var username = $(".two input[name='userName']").val().trim();
    var password = $(".two input[name='userPassword']").val().trim();
    var confirmPwd = $(".two input[name='confirmPwd']").val().trim();

    //校验
    if (username === "") {
        $MB.n_warning("用户名不能为空！");
        return;
    } else if (username.length < 3 || username.length > 10 ) {
        $MB.n_warning("用户名长度不能超过3~10个字符！");
        return;
    } else if (username.length < 3) {
        $MB.n_warning("用户名长度不能少于3个字符！");
        return;
    }
    if (password === "") {
        $MB.n_warning("密码不能为空！");
        return;
    }
    if (confirmPwd === "") {
        $MB.n_warning("请再次输入密码！");
        return;
    }
    if (confirmPwd !== password) {
        $MB.n_warning("两次密码输入不一致！");
        return;
    }

    //ajax注册
    $.ajax({
        type: "post",
        url: "register",
        data: {
            "userName": username,
            "userPassword": password
        },
        dataType: "json",
        success: function (r) {
            if (r.code === 200) {
                $MB.n_success("注册成功，请登录");
                $(".two input[name='userName']").val("");
                $(".two input[name='userPassword']").val("");
                $(".two input[name='confirmPwd']").val("");
                $('.form-toggle').trigger('click');
            } else {
                $MB.n_warning(r.message);
            }
        }
    });
}

document.onkeyup = function (e) {
    if (window.event)
        e = window.event;
    var code = e.charCode || e.keyCode;
    if (code === 13) {
        login();
    }
};
