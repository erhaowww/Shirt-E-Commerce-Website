<%-- 
    Document   : all-customer
    Created on : Apr 13, 2022, 5:11:17 PM
    Author     : User
--%>

<%@page import="model.PaymentDisplay2"%>
<%@page import="model.PaymentTest"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

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
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="../assets/css/style.css"> 
</head>

<style>

    .table {
        color: #555;
        max-width: 100%;
        margin-bottom: 0;
        width: 100%;
        font-size: 15px;
        margin-top: 200px;
        margin-left: 270px;
    }

    .table.dataTable {
        border-collapse: collapse!important;
        margin-left: -5px;
    }

    .row {
        display: flex;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        margin-right: -15px;
        margin-left: 255px;
        justify-content: center;
        margin-top: 100px;
    }
    
/*       div#example_wrapper {
    position: relative !important;
    bottom: -500px !important;
}*/
@media (min-width: 576px){
.col-sm-12 {
    -ms-flex: 0 0 100%;
    flex: 0 0 100%;
    max-width: 79%;
    padding-right: 300px;
}
}
</style>

<body>
    <jsp:include page="include/staffHeader.jsp" />
    <table id="example" class="table table-striped" style="width:100%">
        <thead>
            <tr>
               <th>Payment ID</th>
                                                <th>User ID</th>
                                                <th>Username</th>
                                                <th>Profile Picture</th>
                                                <th>Product Title</th>
                                                <th>Product Image</th>
                                                <th>Quantity</th>
                                                <th>Status</th>
                                                <th>Total</th>
                                                <th>Address</th>
                                                <th>Date</th>
                                                <th></th>
            </tr>
        </thead>
        <tbody>
                                            <%

                                            List<PaymentDisplay2> payList = (List) session.getAttribute("payList");

                                            for (PaymentDisplay2 p : payList) {
                                        %>
                                            <tr>
                                                <td><%= p.getPaymentId()%></td>
                                                <td><%= p.getUser_id()%></td>
                                                <td><%= p.getUser_name()%></td>
                                                <td><%= p.getUser_image()%></td>
                                                <td><%= p.getProduct_title()%></td>
                                                <td><%= p.getProduct_image()%></td>
                                                <td><%= p.getQuantity()%></td>
                                               

       <td><%= p.getStatus()%></td>
                                                 <td><%= p.getPayment_total()%></td>
                                                <td><%= p.getPayment_address()%></td>
                                                <td><%= p.getPayment_date()%></td>


                                                <td>
                                                    <div class="dropdown dropdown-action"> 
                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v ellipse_color"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-customer.jsp?paymentId=<%= p.getPaymentId()%>&userId=<%= p.getUser_id()%>&userName=<%= p.getUser_name()%>&userImage=<%= p.getUser_image()%>&productTitle=<%= p.getProduct_title()%>&productImage=<%= p.getProduct_image()%>&quantity=<%= p.getQuantity()%>&status=<%= p.getStatus()%>&paymentTotal=<%= p.getPayment_total()%>&paymentAddress=<%= p.getPayment_address()%>&paymentDate=<%= p.getPayment_date()%>"><i class="fa fa-pencil-alt m-r-5"></i> Edit</a>         </div>
                                                    </div>

                                                </td>
                                                
                                                
                                        
                                                
                                            </tr>
                                             <%
                                            }
                                             %>
                                        </tbody>
    </table>
</body>

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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#example').DataTable();
    });
</script>

</html>