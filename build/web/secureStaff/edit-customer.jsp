<!DOCTYPE html>

<%@page import="model.PaymentDisplay2"%>
<%@page import="model.Payment"%>
<%
    String status = request.getParameter("status");
    boolean shippingCheck = false;
    boolean packagingCheck = false;
    boolean deliverCheck = false;

    if (status.equals("shipping")) {
        shippingCheck = true;
    }
    if (status.equals("packaging")) {
        packagingCheck = true;
    }
    if (status.equals("delivered")) {
        deliverCheck = true;
    }

    
%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Peace Dashboard Template</title>

        <link rel="shortcut icon" type="image/x-icon" href="../images/logo.jpeg">
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="../assets/css/feathericon.min.css">
        <link rel="stylesheet" href="../assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="../assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="../assets/css/style.css">

        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    </head>


    <body>
        <%Integer paymentId = Integer.parseInt(request.getParameter("paymentId"));%>
        <%Integer userId = Integer.parseInt(request.getParameter("userId"));%>
        <%String userName = request.getParameter("userName");%>
        <%String userImage = request.getParameter("userImage");%>
        <%String productTitle = request.getParameter("productTitle");%>
        <%String productImage = request.getParameter("productImage");%>
        <%Integer quantity = Integer.parseInt(request.getParameter("quantity"));%>
        <%Double paymentTotal = Double.parseDouble(request.getParameter("paymentTotal"));%>
        <%String paymentAddress = request.getParameter("paymentAddress");%>
        <%String paymentDate = request.getParameter("paymentDate");%>

        <jsp:include page="include/staffHeader.jsp" />

        <form action="UpdateStatus" method="post">
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title mt-5">Edit Customer</h3>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="row formtype">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Payment ID</label>
                                        <input name="pId" readonly class="form-control" type="text" value="<%= paymentId%>">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label>User ID</label>
                                    <div class="cal-icon">
                                        <input name="uId" readonly class="form-control" type="text" value="<%= userId%>">
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label>Username</label>
                                    <div class="cal-icon">
                                        <input name="uName" readonly class="form-control" type="text" value="<%= userName%>">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label>User Image</label>
                                    <div class="cal-icon">
                                        <input name="uImage" readonly class="form-control" type="text" value="<%= userImage%>">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Product Title</label>
                                        <div class="cal-icon">
                                            <input name="pTitle" readonly class="form-control" type="text" value="<%= productTitle%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Product Image</label>
                                        <div class="time-icon">
                                            <input name="pImage" readonly class="form-control" type="text" value="<%= productImage%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Quantity</label>
                                        <div class="cal-icon">
                                            <input name="qty" readonly class="form-control" type="text" value="<%= quantity%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <select name="sts" class="form-control" id="sel3" name="sellist1" >											
                                            <option value="packaging"  <%if (packagingCheck) {%><%="selected"%><%}%> >Packaging</option>
                                            <option value="shipping" <%if (shippingCheck) {%><%="selected"%><%}%> >Shipping</option>
                                            <option value="delivered" <%if (deliverCheck) {%><%="selected"%><%}%> >Delivered</option>

                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Total</label>
                                        <input name="pTotal" readonly class="form-control" type="text" value="<%= paymentTotal%>">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <input name="pAddress" readonly class="form-control" type="text" value="<%= paymentAddress%>">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Date</label>
                                        <input name="pDate" readonly class="form-control" type="text" value="<%= paymentDate%>">
                                    </div>
                                </div>



                            </div>

                        </div>
                    </div>
                    
                    <a href="all-customer.jsp" ><button type="button" class="btn btn-primary buttonedit">Cancel</button></a> 
                    <input type="submit" style="margin-right:20px" class="btn btn-primary buttonedit" value="save">
                </div>

            </div>

        </form>
    </div>


    <script src="assets/js/jquery-3.5.1.min.js"></script>

    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/select2.min.js"></script>

    <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="assets/plugins/raphael/raphael.min.js"></script>

    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

    <script src="assets/js/script.js"></script>
    <script>
        $(function () {
            $('#datetimepicker3').datetimepicker({
                format: 'LT'

            });
        });
    </script>
</body>

</html>