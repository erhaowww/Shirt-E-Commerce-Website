<%-- 
    Document   : cart.jsp
    Created on : Mar 31, 2022, 10:31:34 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.PaymentDisplay2"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>

<html>

    <head>

        <title>Payment History</title>
        <link rel="icon" href="../images/logo.png"/>
        <link rel="shortcut icon" type="image/x-icon" href="../images/logo.jpeg">
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="../assets/css/feathericon.min.css">
        <link rel="stylesheet" href="../assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="../assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="../css/designcart.css">

        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>

    <body>

        <!-- header section starts  -->

        <jsp:include page="include/header.jsp" />


        <!-- header section ends -->


        <section>

            <div class="container">

                <h1>History items</h1>

                <div class="cart">


                    <div class="products">
                        <%

                            List<PaymentDisplay2> dList = (List) session.getAttribute("dList");

                            for (PaymentDisplay2 d : dList) {
                        %>

                        <div class="product">

                            <img src="../images/kimet.jpg">


                            <div class="product-info">


                                <h3 class="product-title"><%= d.getProduct_title()%></h3>

                                <h4 class="product-price">RM<%= d.getPayment_total()%></h4>

                                <p class="product-quantity">Qty: <%= d.getQuantity()%></p>

                                <p class="product-date">Date: <%= d.getPayment_date()%></p>

                                <p class="product-status">Status: <%= d.getStatus()%></p>

                            </div>

                        </div>

                        <%
                            }
                        %>  
                    </div>                                         
                </div>                                         
            </div>
        </section>                                      

        <section>

            <div class="container">

                <h1>Purchased items</h1>

                <div class="cart">


                    <div class="products">
                        <%
                            List<PaymentDisplay2> aList = (List) session.getAttribute("aList");

                            for (PaymentDisplay2 a : aList) {
                        %>

                        <div class="product">

                            <img src="../images/<%= a.getProduct_image() %>">


                            <div class="product-info">


                                <h3 class="product-title"><%= a.getProduct_title()%></h3>

                                <h4 class="product-price">RM<%= a.getPayment_total()%></h4>

                                <p class="product-quantity">Qty: <%= a.getQuantity()%></p>

                                <p class="product-date">Date: <%= a.getPayment_date()%></p>

                                <p class="product-status">Status: <%= a.getStatus()%></p>

                            </div>

                        </div>

                        <%
                            }
                        %>  
                    </div>                                         
                </div>                                         
            </div>
        </section>       






        <!-- footer section starts  -->


        <jsp:include page="include/footer.jsp" />



        <!-- footer section ends -->
        <script src="../assets/js/jquery-3.5.1.min.js"></script>
        <script src="../assets/js/popper.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
        <script src="../assets/js/moment.min.js"></script>
        <script src="../assets/js/select2.min.js"></script>
        <script src="../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="../assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="../assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="../assets/plugins/datatables/datatables.min.js"></script>
        <script src="../assets/js/script.js"></script>




    </body>


</html>