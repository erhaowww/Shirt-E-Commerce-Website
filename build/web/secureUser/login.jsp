<%-- 
    Document   : login
    Created on : Mar 29, 2022, 12:17:01 PM
    Author     : khairaychin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="../css/login.css">

    </head>
    <body>
        <div class="login-wrap">
            <div class="login-html">
                <div class="logo">
                    <img src="../images/logo.png" >
                </div>
                <input id="tab-1" type="radio" name="tab" class="sign-up" checked><label for="tab-1" class="tab">User Login</label>
                <div class="login-form">
                    <form method="POST" action="../LoginServlet" >
                        <div class="sign-up-htm">
                            <div class="group">
                                <label for="user" class="label">Username</label>
                                <input id="username" type="text" class="input" name="username" >
                            </div>						
                            <div class="group">                            
                                <label for="pass" class="label">Password</label>				
                                <input id="password" type="password" class="input" data-type="password" name="password" >
                            </div>

                            <div class="group">
                                <input id="check" type="checkbox" class="check" checked>
                                <label for="check"><span class="icon"></span> Keep me Signed in</label>
                            </div>
                            <div class="group">
                                <input type="submit" class="button" value="Sign In">
                            </div>
                            <div class="hr"></div>
                            <div class="foot-lnk">
                                <a href="users_signup.html">Not A Member?</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>


















    </body>
</html>
