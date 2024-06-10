<!DOCTYPE html>
<%@page import="model.Products"%>
<%
    Products products = (Products) session.getAttribute("products");

    String[] allSize = products.getProductSize().split(",");
    boolean offerChecked = false;
    boolean arrivalChecked = false;
    boolean popularChecked = false;

    boolean MChecked = false;
    boolean LChecked = false;
    boolean XLChecked = false;
    boolean XXLChecked = false;

    if (products.getProductCategories().equals("Limited Offer")) {
        offerChecked = true;
    }
    if (products.getProductCategories().equals("New Arrival")) {
        arrivalChecked = true;
    }
    if (products.getProductCategories().equals("Popular")) {
        popularChecked = true;
    }
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
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Peace - Edit Product</title>
        <link rel="shortcut icon" type="image/x-icon" href="../images/logo.jpeg">
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="../assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="../assets/css/feathericon.min.css">
        <link rel="stylesheet" href="../assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="../assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="../assets/css/style.css"> </head>

    <body>
        <jsp:include page="../secureStaff/include/staffHeader.jsp" />
        <div class="main-wrapper">
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title mt-5">Edit Product</h3>
                            </div>
                        </div>
                    </div>
                    <form action="ProductsUpdate?productId=<%=products.getProductId()%>" method="post" enctype="multipart/form-data" id="product-form">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="row formtype">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Product ID</label>
                                            <input class="form-control" type="text" name="id" disabled value="<%=products.getProductId()%>"> </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Product Name</label>
                                            <input class="form-control" type="text" name="name" required value="<%=products.getProductTitle()%>"> </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Product Amount</label>
                                            <input class="form-control" type="text" name="amount" pattern="^\d+(?:\.\d{1,2})?$" required value="<%=products.getProductAmount()%>"> </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Product Stock</label>
                                            <input class="form-control" type="number" name="stock" required value="<%=products.getProductStock()%>"></div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Product Image</label>
                                            <input class="form-control" type="file" id="file" name="image" accept="image/gif, image/jpeg, image/png"  id="file"  onchange="loadFile(event)" style="cursor: pointer;">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <div>
                                                <img id="output" width="150px" height="150px" style="border:1px solid black;" src="../images/product_image/<%=products.getProductImage()%>"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Product Purchase Date</label>
                                            <input type="text" name="date" class="form-control" required placeholder="dd/mm/yyyy" value="<%=products.getProductDateStart()%>" pattern="(31/(0[13578]|1[02])/(18|19|20)[0-9]{2})|((29|30)/(01|0[3-9]|1[1-2])/(18|19|20)[0-9]{2})|((0[1-9]|1[0-9]|2[0-8])/(0[1-9]|1[0-2])/(18|19|20)[0-9]{2})|(29/(02)/(((18|19|20)(04|08|[2468][048]|[13579][26]))|2000))">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Product Category</label><br>
                                            <table class="form-control" style="height: 70px;">
                                                <tr>
                                                    <td>
                                                        <input type="radio" name="category" id="Limited Offer" value="Limited Offer" <% if (offerChecked) {%><%="checked"%><%}%> required>
                                                        <label for="Limited Offer"> Limited Offer</label>
                                                    </td>
                                                    <td style="width:10px"></td>
                                                    <td>
                                                        <input type="radio" name="category" id="Popular" value="Popular" <% if (popularChecked) {%><%="checked"%><%}%>>
                                                        <label for="Popular"> Popular</label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="radio" name="category" id="New Arrival" value="New Arrival" <% if (arrivalChecked) {%><%="checked"%><%}%> >
                                                        <label for="New Arrival"> New Arrival</label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Product Size</label>
                                            <table class="form-control" style="height: 70px;">
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="size" id="M" value="M" <% if (MChecked) {%><%="checked"%><%}%>>
                                                        <label for="M"> M</label>
                                                    </td>
                                                    <td style="width:10px"></td>
                                                    <td>
                                                        <input type="checkbox" name="size" id="L" value="L" <% if (LChecked) {%><%="checked"%><%}%>>
                                                        <label for="L"> L</label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="size" id="XL" value="XL" <% if (XLChecked) {%><%="checked"%><%}%>>
                                                        <label for="XL"> XL</label>
                                                    </td>
                                                    <td style="width:10px"></td>
                                                    <td>
                                                        <input type="checkbox" name="size" id="XXL" value="XXL" <% if (XXLChecked) {%><%="checked"%><%}%>>
                                                        <label for="XXL"> XXL</label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <button type="submit" class="btn btn-primary buttonedit" >Save Product</button>

                        </div>
                    </form>
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
    <script>
                                                $(function () {
                                                    $('#datetimepicker3').datetimepicker({
                                                        format: 'LT'
                                                    });
                                                });
                                                $("#product-form").submit(function () {
                                                    var sizeChecked = $("[name='size']:checked").length > 0;
                                                    if (!sizeChecked) {
                                                        alert("Please check at least one checkbox on Product Size");
                                                        return false;
                                                    }
                                                });
                                                var loadFile = function (event) {
                                                    var image = document.getElementById('output');
                                                    image.src = URL.createObjectURL(event.target.files[0]);
                                                };
    </script>

</body>

</html>