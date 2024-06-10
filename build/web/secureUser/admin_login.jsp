<%-- 
    Document   : admin_login
    Created on : Apr 9, 2022, 1:54:15 PM
    Author     : khairaychin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Login</title>
        <link rel="stylesheet" href="../css/admin_css.css">

    </head>
    <body>
        <div class="login-wrap">
            <div class="login-html">
                <div class="logo">
                    <img src="../images/logo.png" >
                </div>
                <br> 
                <input id="tab-1" type="radio" name="tab" class="sign-up" checked><label for="tab-1" class="tab">Administrative Login</label>
                <div class="login-form">
                    <form method="POST" action="#" >
                        <div class="sign-up-htm">
                            <div class="group">
                                <label for="user" class="label">Username</label>
                                <input id="username" type="text" class="input" name="ad_username" >
                            </div>						
                            <div class="group">                            
                                <label for="pass" class="label">Password</label>				
                                <input id="password" type="password" class="input" data-type="password" name="ad_password" >
                            </div>

                            <div class="group">
                                <input id="check" type="checkbox" class="check" checked>
                                <label for="check"><span class="icon"></span> Keep me Signed in</label>
                            </div>
                            <div class="group">
                                <input type="submit" class="button" value="Sign In">
                            </div>
                            <div class="hr"></div>

                        </div>
                    </form>
                </div>
            </div>
        </div>


















    </body>
</html>
