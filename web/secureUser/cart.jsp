
<%@page import="model.Users"%>
<%@page import="java.util.List"%>
<%@page import="model.CartInfo"%>
<%--<%@page import="model.CartPK"%>--%>

<!-- retrieve session object -->
<%
    List<CartInfo> cartList = (List<CartInfo>) session.getAttribute("cartList");
    Users user = (Users) session.getAttribute("profileuser");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Shopping Cart</title>
        <link rel="icon" href="../images/logo.png"/>
        <link rel="stylesheet" type="text/css" href="../css/designcart.css">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <!--sweetalert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <style>
            .input-error{
                outline: 1px solid red;
            }

            input[type=number]::-webkit-inner-spin-button, 
            input[type=number]::-webkit-outer-spin-button {  

                opacity: 1;

            }

            /* Product Size */
            .product-size {
                margin-bottom: 30px;
                font-size: 14px;
            }

            .size div {
                display: inline-block;
            }
        </style>
    </head>

    <body>
        <!-- header section starts  -->
        <jsp:include page="include/header.jsp" />
        <!-- header section ends -->

        <form action="PaymentDisplay" method="post">
            <div class="container">
                <h1>Shopping Cart</h1>
                <div class="cart">
                    <div class="products">
                        <% String orderSize = "";
                            double subtotal = 0;
                            int i = 0;
                            for (CartInfo cart : cartList) {
                                orderSize = cart.getCart().getOrdersize();
                                subtotal += cart.getProduct().getProductAmount() * (double) cart.getCart().getQuantity();
                        %>

                        <div class="product">

                            <img src="../images/<%= cart.getProduct().getProductImage()%>">
                            <div class="product-info">
                                <input type="hidden" class="store_userId" name="store_userId" value="<%=  cart.getCart().getCartPK().getUserId()%>">
                                <input type="hidden" class="store_cartId" name="store_cartId" value="<%=  cart.getCart().getCartPK().getCartId()%>">
                                <input type="hidden" class="store_payId" name="store_payId" value="<%= cart.getPayment().getPaymentId()%>">
                                <input type="hidden" class="store_productId" name="store_productId" value="<%= cart.getProduct().getProductId()%>">
                                <input type="hidden" class="store_orderSize" name="store_orderSize" value="<%= cart.getCart().getOrdersize()%>">
                                <input type="hidden" class="store_orderStatus" name="store_orderStatus" value="<%= cart.getCart().getStatus()%>">
                                <input type="hidden" class="store_qty" name="store_qty" value="<%= cart.getCart().getQuantity()%>">

                                <h3 class="product-name"><%= cart.getProduct().getProductTitle()%></h3>
                                <h4 class="product-price">RM <%= String.format("%.2f", cart.getProduct().getProductAmount())%></h4>
                                <h4 class="product-get-price" style="display:none"><%= String.format("%.2f", cart.getProduct().getProductAmount())%></h4>
                                <p class="product-quantity">Qty:<input style="background: #efefef" name="cartQty" type="number" value="<%= cart.getCart().getQuantity()%>" min="1" max="15"></p>
                                <!-- Product Configuration -->
                                <div class="product-configuration">
                                    <!-- Product Size -->
                                    <div class="product-size">
                                        <span>Size:</span>
                                        <select name="orderSize" id="orderSize">
                                            <option value="" disabled>Size</option>
                                                    <option value="M" <% if (orderSize.equals("M")) 
                                                            out.print("selected");%>>M</option>
                                                    <option value="L" <% if (orderSize.equals("L")) 
                                                            out.print("selected");%>>L</option>
                                                    <option value="XL" <% if (orderSize.equals("XL")) 
                                                            out.print("selected");%>>XL</option>
                                                    <option value="XXL" <% if (orderSize.equals("XXL"))
                                                    out.print("selected");%>>XXL</option>
                                        </select>
                                    </div>
                                </div>
                                <p class="product-remove">
                                    <i class="fa fa-close" aria-hidden="true"></i>
                                    <!--<span class="remove">Remove</span>-->
                                </p>
                                <p class="product-line-price">
                                    <span class="line-price">Subtotal: RM <%= String.format("%.2f", cart.getProduct().getProductAmount() * (double) cart.getCart().getQuantity())%></span>
                                </p>
                                <p class="store-product-line-price" style="display:none">
                                    <%= String.format("%.2f", cart.getProduct().getProductAmount() * (double) cart.getCart().getQuantity())%>
                                </p>
                            </div>

                        </div>
                        <% i++;
                            }%>
                    </div>

                    <div class="cart-total">
                        <p>
                            <span>Total Price</span>
                            <span id="subtotal">RM <%= String.format("%.2f", subtotal)%></span>
                            <input type="hidden" id="passSubtotal" name="passSubtotal" value="<%= String.format("%.2f", subtotal)%>">
                        </p>
                        <p>
                            <span>Number of Items</span>
                            <span id="totalQtyItem"><%= cartList.size()%></span>
                        </p>

                        <input type="submit" name="submit" id="goToPayBtn" value="Proceed to Checkout" style="font-size: 18px;">

                    </div>
                </div>
            </div>
        </form>
        <!-- footer section starts  -->
        <jsp:include page="include/footer.jsp" />
        <!-- footer section ends -->

        <script>
            $("[type='number']").keypress(function (evt) {
                evt.preventDefault();
            });
        </script>

        <script>
            /* Recalculate cart */
            function recalculateCart() {
                var subtotal = 0;

                /* Sum up row totals */
                $(".product-info").each(function () {
//                    console.log(parseFloat($(this).children(".store-product-line-price").text()));
                    subtotal += parseFloat($(this).children(".store-product-line-price").text());
                });



                /* Update totals display */
                $("#subtotal").html("RM " + subtotal.toFixed(2));
                document.querySelector('#passSubtotal').setAttribute("value", subtotal.toFixed(2));
            }
        </script>

        <script>
            /* Assign actions */
            $(".product-quantity input").change(function () {
                updateQuantity(this);
            });

            /* Update quantity */
            function updateQuantity(quantityInput) {
                /* Calculate line price */
                var productRow = $(quantityInput).parent().parent();
                var price = parseFloat(productRow.children(".product-get-price").text());
                var quantity = $(quantityInput).val();
//                console.log(productRow.children(".product-quantity").children("input[name='cartQty']").val());
                var linePrice = price * quantity;
                var orderSize = productRow.children(".store_orderSize").val();
                var orderStatus = productRow.children(".store_orderStatus").val();
                var productId = productRow.children(".store_productId").val();
                var payId = productRow.children(".store_payId").val();
                var cartId = productRow.children(".store_cartId").val();

                /* Update line price display and recalc cart totals */
                productRow.children(".product-line-price").each(function () {
                    $(this).text("Subtotal: RM " + linePrice.toFixed(2));
                });

                productRow.children(".store-product-line-price").each(function () {
                    $(this).text(linePrice.toFixed(2));
                    recalculateCart();
                });

                $.ajax({
                    type: "POST",
                    data: {
                        userId: "<%=user.getUserId()%>",
                        cartId: cartId,
                        productId: productId,
                        payId: payId,
                        qty: quantity,
                        line_subtotal: linePrice,
                        size: orderSize,
                        status: orderStatus
                    },
                    url: "CartUpdateQtyAndPrice",
                    success: function (data) {
//                        console.log("quantity change");


                    }

                });
            }
        </script>


        <!--update size-->
        <script>
            /* Assign actions */
            $('select#orderSize').on('change', function () {
                var mainProductRow = $(this).parent().parent().parent().parent();
                var productRow = $(this).parent().parent().parent();
                var price = parseFloat(productRow.children(".product-get-price").text());
                var quantity = productRow.children(".product-quantity").children("input[name='cartQty']").val();
                var linePrice = price * quantity;
                var orderSize = this.value;
                var orderStatus = productRow.children(".store_orderStatus").val();
                var productId = productRow.children(".store_productId").val();
                var payId = productRow.children(".store_payId").val();
                var cartId = productRow.children(".store_cartId").val();
//                console.log(orderSize);

                $.ajax({
                    type: "POST",
                    data: {
                        userId: "<%=user.getUserId()%>",
                        cartId: cartId,
                        productId: productId,
                        payId: payId,
                        qty: quantity,
                        line_subtotal: linePrice,
                        size: orderSize,
                        status: orderStatus
                    },
                    url: "CartUpdateSize",
                    success: function (data) {
                        console.log(data);
                        if (data === "success") {
                            setTimeout(function () {
                                window.location.href = "CartDisplay?userId="+<%=user.getUserId()%>;
                            }, 1000);
                        }

                    }

                });
            });
        </script>

        <script>
            $(".product-remove").click(function () {
                removeItem(this);
            });

            /* Remove item from cart */
            function removeItem(removeButton) {
                /* Remove row from DOM and recalc cart total */
                var mainProductRow = $(removeButton).parent().parent();
                var productRow = $(removeButton).parent();
                var price = parseFloat(productRow.children(".product-get-price").text());
                var quantity = productRow.children(".product-quantity").children("input[name='cartQty']").val();
                var linePrice = price * quantity;
                var orderSize = productRow.children(".store_orderSize").val();
                var orderStatus = productRow.children(".store_orderStatus").val();
                var productId = productRow.children(".store_productId").val();
                var payId = productRow.children(".store_payId").val();
                var cartId = productRow.children(".store_cartId").val();
                var totalQtyItem = ($("p span#totalQtyItem").text() - 1);
                mainProductRow.remove();
                recalculateCart();
                $("p span#totalQtyItem").text((totalQtyItem));

                $.ajax({
                    type: "POST",
                    data: {
                        userId: "<%=user.getUserId()%>",
                        cartId: cartId,
                        productId: productId,
                        payId: payId,
                        qty: quantity,
                        line_subtotal: linePrice,
                        size: orderSize,
                        status: orderStatus,
                        totalQtyItem: totalQtyItem
                    },
                    url: "CartDelete",
                    success: function (data) {

                    }

                });

            }
        </script>

        <script>
            $("#goToPayBtn").click(function (e) {
                var cartList = $("p span#totalQtyItem").text();
//                 console.log(cartList);
                if (cartList === "0") {
                    swal({
                        title: "No Shopping Cart",
                        text: "Please add the product you want to the shopping cart",
                        icon: "warning",
                        button: "OK"
                    }).then(() => {
                        swal({
                            title: "Are you sure?",
                            text: "Go to Shopping",
                            icon: "info",
                            buttons: true
                        }).then((value) => {
                            console.log(value);
                            if (value) {
                                window.location.href = "ProductsDisplay";
                            } else {
                                return false;
                            }
                        });
                    });
                    return false;
                }
            });
        </script>

    </body>
</html>