

<%@page import="model.Users"%>
<%@page import="model.NotificationDisplay"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/css/lightgallery.min.css">

        <script src="https://kit.fontawesome.com/1935d064dd.js" crossorigin="anonymous"></script>


        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


        <!-- owl carousel css file cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">

        <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">


        <link rel="stylesheet" href="../css/include.css">
        <!-- header section starts  -->

        <style>
            a.add-to-cart {
                background: #ffab00;
                font-size: 18px;
                line-height: 48px;
                letter-spacing: 2px;
                color: rgb(255, 255, 255);
                text-transform: uppercase;
                -moz-border-radius: 24px;
                -webkit-border-radius: 24px;
                border-radius: 24px;
                text-decoration: none;
                text-align: center;
                padding: 12px 30px;
                display: block;
                box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16), 0 3px 6px rgba(255, 171, 0, 0.23);
                -moz-box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16), 0 3px 6px rgba(255, 171, 0, 0.23);
                -webkit-box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16), 0 3px 6px rgba(255, 171, 0, 0.23);

            }

            a.add-to-cart.size {
                font-size: 0;
                color: #e7bb45;
                letter-spacing: 0;
                -webkit-transition: .2s linear;
                -moz-transition: .2s linear;
                -ms-transition: .2s linear;
                -o-transition: .2s linear;
                transition: .2s linear;
            }

            a.add-to-cart.hover {
                -webkit-transition: .2s linear;
                -moz-transition: .2s linear;
                -ms-transition: .2s linear;
                -o-transition: .2s linear;
                transition: .2s linear;
                -webkit-transform: rotate(180deg);
                -moz-transform: rotate(180deg);
                -ms-transform: rotate(180deg);
                -o-transform: rotate(180deg);
                transform: rotate(180deg);
                -webkit-transform-origin: 180px -150px;
                -moz-transform-origin: 180px -150px;
                -o-transform-origin: 180px -150px;
                -ms-transform-origin: 180px -150px;
                transform-origin: 180px -150px;
            }

            a.cart {
                position: relative;
            }

            a.cart>span {
                text-align: center;
                width: 24px;
                height: 24px;
                font-size: 16px;
                color: #fff;
                line-height: 24px;
                position: absolute;
                -moz-border-radius: 12px;
                -webkit-border-radius: 12px;
                border-radius: 12px;
                display: block;
                transform: scale(0);
                -o-transform: scale(0);
                -ms-transform: scale(0);
                -moz-transform: scale(0);
                -webkit-transform: scale(0);
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                margin: auto;
                background: #ffab00;
                box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16), 0 3px 6px rgba(255, 171, 0, 0.23);
                -moz-box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16), 0 3px 6px rgba(255, 171, 0, 0.23);
                -webkit-box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16), 0 3px 6px rgba(255, 171, 0, 0.23);
            }

            a.cart>span.counter {
                left: 23px;
                bottom: 20px;
                -webkit-transition: .2s linear;
                -moz-transition: .2s linear;
                -ms-transition: .2s linear;
                -o-transition: .2s linear;
                transition: .2s linear;
                transform: scale(1);
                -o-transform: scale(1);
                -ms-transform: scale(1);
                -moz-transform: scale(1);
                -webkit-transform: scale(0.8);
            }
        </style>

    </head>

</head>


<body>



    <header>
        <!--session.setAttribute("profileuser", profile);-->
        <%  Users user = (Users) session.getAttribute("profileuser");
//            int userId = (int) session.getAttribute("userId"); 
%>

        <div class="header-1">

            <a href="../NotificationDisplay?userId=<%= user.getUserId()%>" class="logo"> <img src="../images/logo.png" alt="logo" width="50" height="50"> </a>

            <div class="form-container">
                <form action="ProductsSearch" method="post">
                    <input type="search" placeholder="search products" id="search" name="search" required/> 
                    <label for="search" class="fas fa-search"></label>
                </form>
            </div>


        </div>

        <div class="header-2">

            <div id="menu" class="fas fa-bars"></div>

            <nav class="navbar">
                <ul>
                    <li><a class="active" href="home.jsp">home</a></li>
                    <li><a href="ProductsDisplay">Product</a></li>
                    <li><a href="CartDisplay?userId=<%= user.getUserId()%>">Cart</a></li>
                    <li><a href="UserPayment">History</a></li>
                </ul>
            </nav>

            <div class="icons">

                <div class="navbar2">
                    <div class="navbar_left">
                    </div>
                    <!-- <div class="navbar_right"> -->
                    <div class="notifications">
                        <div class="icon_wrap">

                            <button type="button" onclick="update_noti()" id="notiBtt" class="icon-button">
                                <a href="#" class="fa fa-bell"></a>
                                <!--<span class="icon-button__badge">2</span>-->
                            </button>

                            <div class="notification_dd">
                                <ul class="notification_ul">


                                    <%
                                        List<NotificationDisplay> notiList = (List) session.getAttribute("notiList");

                                        int i = 0;

                                        for (NotificationDisplay noti : notiList) {
                                            if (i == 5) {
                                                break;
                                            }

                                            i++;
                                    %>

                                    <li class="<%= noti.getStatus()%>">
                                        <a > <img src="../images/logo.png" alt="logo" width="40" height="42"> </a>
                                        <div class="notify_icon">
                                            <!--<span class="icon"></span>-->
                                        </div>
                                        <div class="notify_data">
                                            <div class="title">
                                                <%= noti.getSender()%>
                                            </div>
                                            <div class="sub_title">
                                                <%= noti.getMesssage()%>
                                            </div>
                                            <div class="sub_title" style="font-size: 12px;">
                                                <%= noti.getNoti_date()%>
                                            </div>

                                        </div>
                                        <div class="notify_status">
                                            <p>Message</p>
                                        </div>
                                    </li>

                                    <% }%>                                


                                </ul>
                            </div>
                        </div>


                        <!--                        <button type="button" class="icon-button">
                                                   <a href="cart.jsp" class="fas fa-shopping-cart"></a>
                                                    <span class="icon-button__badge" style="right:3px;">2</span>
                                                </button>-->
                        <a href="CartDisplay?userId=<%= user.getUserId()%>" class="cart fas fa-shopping-cart"><span class="counter"></span></a>


                        <a href="#" onclick="menuToggle();"> <img src="../images/userImage/<%= user.getImage()%>" style="border-radius: 50%;" alt="logo" width="40" height="40"> </a>

                        <div class="action">
                            <div class="menu">
                                <h3>
                                    <%= user.getName()%>
                                    <div>
                                        User Account
                                    </div>
                                </h3>
                                <ul>
                                    <li>
                                        <span class="material-icons icons-size">person</span>
                                        <a href="../UsersSearch?userId=<%= user.getUserId()%>">My Profile</a>
                                    </li>
                                    <!--                        <li>
                                                                <span class="material-icons icons-size">mode</span>
                                                                <a href="#">Edit Account</a>
                                                            </li>-->
                                    <li>
                                        <span class="material-icons icons-size">insert_comment</span>
                                        <a href="commentService.jsp">Comments</a>
                                    </li>
                                    <li>
                                        <span class="fas fa-edit"></span>
                                        <a href="../secureStaff/Peace.jsp">Edit Peace</a>
                                    </li>
                                    <li>
                                        <span class="fa fa-sign-out" ></span>
                                        <a href="../" class="logOut">log Out</a>
                                    </li>
                                </ul>
                            </div>
                        </div>


                    </div>

                </div>

                </header>
                <!-- header section ends -->
                <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

                <!-- jquery cdn link  -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

                <!-- owl carousel js file cdn link  -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>


                <script>
                            var path = window.location.pathname;
                            var page = path.split("/").pop(); //get current file name
                            $(document).ready(function () {
                                $.ajax({
                                    type: 'POST',
                                    url: 'CartNotification',
                                    data: {
                                        userId: "<%=user.getUserId()%>"
                                    },
                                    success: function (data) {
//                                                                                    console.log(data);
                                        if (data === "0" || page === "cart.jsp") {
                                            $("a.cart > span").removeClass("counter");
                                        } else {
                                            $("a.cart > span.counter").text(data);
                                        }
                                    }

                                });

                            });
                </script>


                </body>

                </html>
