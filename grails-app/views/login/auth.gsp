<html>
<head>
   <asset></asset>
    <title>Giriş Yap</title>
    <asset:stylesheet src="application.css"/>
    <link href="https://fonts.googleapis.com/css?family=Libre+Caslon+Text|Merriweather&display=swap" rel="stylesheet">

</head>

<body>
<div class="container" style="font-family: 'Merriweather', serif;
">

    <div class="card mb-3 shadow-lg p-3 mb-5 bg-white rounded mt-5  " style="width: 25rem; margin: 0px auto;">
        <div class="card-header text-center" style="background-color: #fff; border-bottom-width:0px !important;">
        <img src="https://dumielauxepices.net/sites/default/files/person-icons-login-712095-6175348.png" style="width: 130px;" class="card-img-top" alt="...">
        </div>
            <div class="card-body">
                <g:if test='${flash.message}'>
                    <hr>
                    <div class="login_message text-danger">${flash.message}</div>
                    <hr>
                </g:if>

                <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
                    <div class="form-group">
                        <label >Email username</label>
                        <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username" autocapitalize="none" aria-describedby="emailHelp" placeholder="Username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control"name="${passwordParameter ?: 'password'}" id="password" placeholder="Password">
                    </div>

                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input"  name="${rememberMeParameter ?: 'remember-me'}" id="remember_me"   <g:if test='${hasCookie}'>checked="checked"</g:if>>
                        <label class="custom-control-label" for="remember_me">Remember me</label>
                    </div>
                    <hr>
                    <div class="col-md-12 text-center">
                    <input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"  class="col-md-8 btn btn-success" style="border-radius: 2rem" >
                    </div>

                </form>
        </div>
    </div>
</div>
<asset:javascript src="application.js"/>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function(event) {
        document.forms['loginForm'].elements['username'].focus();
    });
    function passwordDisplayToggle() {
        var toggleEl = document.getElementById("passwordToggler");
        var eyeIcon = '\u{1F441}';
        var xIcon = '\u{2715}';
        var passEl = document.getElementById("password");
        if (passEl.type === "password") {
            toggleEl.innerHTML = xIcon;
            passEl.type = "text";
        } else {
            toggleEl.innerHTML = eyeIcon;
            passEl.type = "password";
        }
    }
</script>
</body>
</html>