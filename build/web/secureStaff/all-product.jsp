<!DOCTYPE html>
<html lang="en">
    <%@page import="java.util.List"%>
    <%@page import="model.Products"%>

    <%
        List<Products> productsList = (List) session.getAttribute("ProductsList");
    %>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Peace - Product</title>
        <link rel="shortcut icon" type="image/x-icon" href="../images/logo.jpeg">
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="../assets/css/feathericon.min.css">
        <link rel="stylesheet" href="../assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="../assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="../assets/css/style.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css"> 
        
    </head>

    <body>
        <div class="main-wrapper">
            <jsp:include page="include/staffHeader.jsp" />
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="mt-5">
                                    <h4 class="card-title float-left mt-2">Products</h4> <a href="add-product.jsp" class="btn btn-primary float-right veiwbutton">Add Product</a> </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="datatable table table-stripped" id="sort">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>NAME</th>
                                                    <th>PURCHASE_DATE</th>
                                                    <th>IMAGE</th>
                                                    <th>STOCK</th>
                                                    <th>AMOUNT</th>
                                                    <th>SIZE</th>
                                                    <th>CATEGORY</th>
                                                    <th class="text-right">Actions</th>
                                                </tr>

                                            </thead>
                                            <tbody>
                                                <% for (Products products : productsList) {%>
                                                <tr>
                                                    <td><%=products.getProductId()%></td>
                                                    <td><%=products.getProductTitle()%></td>
                                                    <td><%=products.getProductDateStart()%></td>
                                                    <td><img src="../images/product_image/<%=products.getProductImage()%>" width="50px" height="50px"></td>
                                                    <td><%=products.getProductStock()%></td>
                                                    <td><%=products.getProductAmount()%></td>
                                                    <td><%=products.getProductSize()%></td>
                                                    <td><%=products.getProductCategories()%></td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> 
                                                                <a class="dropdown-item" href="../secureAdmin/ProductsSearchToEdit?productId=<%=products.getProductId()%>"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a> <a class="dropdown-item" href="../secureAdmin/delete-product-confirmation.jsp?productId=<%=products.getProductId()%>&&productTitle=<%=products.getProductTitle()%>"><i class="fas fa-pencil-alt m-r-5"></i> Delete</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <% }%> 
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
            $(function () {
                $('#datetimepicker3').datetimepicker({
                    format: 'LT'
                });
            });
            $(document).ready(function () {
                $('#sort').DataTable();
            });
        </script>
    </body>

</html>