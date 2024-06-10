<%@page import="java.util.List"%>
<%@page import="model.Users"%>
<!DOCTYPE html>
<%@page import="model.Products"%>
<%
    Products products = (Products) session.getAttribute("products");

String[] allSize = products.getProductSize().split(",");
    boolean MChecked = false;
    boolean LChecked = false;
    boolean XLChecked = false;
    boolean XXLChecked = false;

    for (String size : allSize) {
        if (size.equals("XXL")) {
            XXLChecked = true;
        }
        if (size.equals("M")) {
            MChecked = true;
        }
        if (size.equals("L")) {
            LChecked = true;
        }
        if (size.equals("XL")) {
            XLChecked = true;
        }
    }
%>
<link rel="stylesheet" href="../css/productDetailsPage.css">

<html>
    <head>
        <title>Product detail page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <!--sweetalert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <%
//            session.setAttribute("userId", user);
//    Users id = (Users)session.getAttribute("userId");
//            String proName = request.getParameter("proName");
            Users user = (Users) session.getAttribute("profileuser");
            int userId = user.getUserId();
        %>
        <jsp:include page="../secureUser/include/header.jsp" />

        <main class="container">
            <!-- Left Column / Headphones Image -->
            <div class="left-column">
                <!--<img src="../images/kimet.jpg" width="180px" height="180px">-->
                <img data-image="shirt" src="../images/<%=products.getProductImage()%>" alt="">
            </div>

            <!-- Right Column -->
            <div class="right-column">

                <!-- Product Description -->
                <div class="product-description">
                    <span><%=products.getProductCategories()%></span>
                    <h1><%=products.getProductTitle()%></h1>
                </div>

                <!-- Product Configuration -->
                <div class="product-configuration">

                    <!-- Product Size -->
                    <div class="product-size">
                        <span>Choose Size</span>

                        <div class="size">
                            <div>
                                <input type="radio" id="minimal" name="size" value="M">
                                <label for="M"><span>M</span></label>
                            </div>
                            <div>
                                <input type="radio" id="large" name="size" value="L">
                                <label for="L"><span>L</span></label>
                            </div>
                            <div>
                                <input type="radio" id="xlarge" name="size" value="XL">
                                <label for="XL"><span>XL</span></label>
                            </div>
                            <div>
                                <input type="radio" id="xxlarge" name="size" value="XXL">
                                <label for="XXL"><span>XXL</span></label>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Pricing -->
                <div class="product-price">
                    <span>RM<%=String.format("%.2f", products.getProductAmount())%></span>
                    <a href="#"  onclick="add_to_cart()" class="add-to-cart">add to cart</a>
                </div>
            </div>
        </main>




        <div class="bottom-column">
            <div class="feedback">
                <h4>Please rate the wearing here !</h4>
                <form method="get" action="../CommentAdd">
                    <label>1. Your overall experience with this wearing ?</label><br>
                    <input type="text" name="about" value="<%= products.getProductTitle()%>" style="display:none;">
                    <input type="text" name="userId" value="<%= userId%>" style="display:none;">
                    <span class="star-rating"><br>
                        <input type="radio" name="ratings" value="1"><i>1 Star</i>
                        <input type="radio" name="ratings" value="2"><i>2 Star</i>
                        <input type="radio" name="ratings" value="3"><i>3 Star</i>
                        <input type="radio" name="ratings" value="4"><i>4 Star</i>
                        <input type="radio" name="ratings" value="5"><i>5 Star</i>
                    </span>
                    <div class="clear"></div> 
                    <hr class="survey-hr"> 
                    <label for="m_250commentText">2. Any Other suggestions for the wearing:</label><br/><br/>
                    <textarea cols="75" name="reviews" rows="5" cols="50" style="resize: none;"></textarea><br>
                    <br>
                    <div class="clear"></div> 
                    <input style="background:#43a7d5;color:#fff;padding:12px;border:0" onclick="myFunction()" type="submit" value="Submit your review"> 
                </form>
            </div>
        </div><br>

        <jsp:include page="include/footer.jsp" />


        <script>

            function add_to_cart() {
//                console.log($("input[name='size']:checked").val());
                if ($("input[name='size']:checked").val() === undefined) {
                    swal({
                        title: "Sorry!",
                        text: "Please select clothes size",
                        icon: "warning",
                        button: "OK"
                    });
                    return false;
                } else {

//                        $("a.add-to-cart").click(function (event) {

                    $("a.add-to-cart").addClass("size");
                    setTimeout(function () {
                        $("a.add-to-cart").addClass("hover");
                    }, 200);
                    setTimeout(function () {
                        $("a.add-to-cart").removeClass("hover");
                        $("a.add-to-cart").removeClass("size");
                    }, 600);
                    event.preventDefault();
//                        });
                }

                $.ajax({
                    type: "POST",
                    data: {
                        userId: "<%= userId %>",
                        productId: "<%= products.getProductId() %>",
                        price: "<%= products.getProductAmount() %>",
                        size: $("input[name='size']:checked").val()
                    },
                    url: "CartAdd",
                    success: function (data) {
                        console.log(data);
                        if (data === "0") {
                            $("a.cart > span").removeClass("counter");
                        } else {
                            if (data === "1") {
                                $("a.cart > span").addClass("counter");
                            }
                            $("a.cart > span.counter").text(data);
                        }

                    }

                });
            }
        </script>


        <script>
            function myFunction() {
                alert("Success sended comment.");
            }
        </script>

    </body>
</html>
