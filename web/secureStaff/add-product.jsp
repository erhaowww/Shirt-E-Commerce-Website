<!DOCTYPE html>
<%@page import='java.util.Date'%>
<%@page import='java.text.SimpleDateFormat'%>'
<%
    Date today = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
    String todayDate = (formatter.format(today));
%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Peace - Add Product</title>
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
        <jsp:include page="include/staffHeader.jsp" />
        <div class="main-wrapper">
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title mt-5">Add Product</h3>
                            </div>
                        </div>
                    </div>
                    <form action="ProductsAdd" method="post" enctype="multipart/form-data" id="product-form">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="row formtype">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Product ID</label>
                                            <input class="form-control" type="num" name="id" disabled placeholder="auto generated"> </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Product Name</label>
                                            <input class="form-control" type="text" name="name" required> </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Product Amount</label>
                                            <input class="form-control" type="text" name="amount" pattern="^\d+(?:\.\d{1,2})?$" required> </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Product Stock</label>
                                            <input class="form-control" type="number" name="stock" required ></div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Product Image</label>
                                            <input class="form-control" type="file" id="file" name="image"  accept="image/gif, image/jpeg, image/png"  id="file"  onchange="loadFile(event)" style="cursor: pointer;" required >
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <div>
                                                <img id="output" width="150px" height="150px"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Product Purchase Date</label>
                                            <input type="text" name="date" class="form-control" required placeholder="dd/mm/yyyy" value="<%=todayDate%>" pattern="(31/(0[13578]|1[02])/(18|19|20)[0-9]{2})|((29|30)/(01|0[3-9]|1[1-2])/(18|19|20)[0-9]{2})|((0[1-9]|1[0-9]|2[0-8])/(0[1-9]|1[0-2])/(18|19|20)[0-9]{2})|(29/(02)/(((18|19|20)(04|08|[2468][048]|[13579][26]))|2000))">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Product Category</label><br>
                                            <table class="form-control" style="height: 70px;">
                                                <tr>
                                                    <td>
                                                        <input type="radio" name="category" id="Limited Offer" value="Limited Offer" required>
                                                        <label for="Limited Offer"> Limited Offer</label>
                                                    </td>
                                                    <td style="width:10px"></td>
                                                    <td>
                                                        <input type="radio" name="category" id="Popular" value="Popular">
                                                        <label for="Popular"> Popular</label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="radio" name="category" id="New Arrival" value="New Arrival">
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
                                                        <input type="checkbox" name="size" id="M" value="M">
                                                        <label for="M"> M</label>
                                                    </td>
                                                    <td style="width:10px"></td>
                                                    <td>
                                                        <input type="checkbox" name="size" id="L" value="L">
                                                        <label for="L"> L</label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="size" id="XL" value="XL" >
                                                        <label for="XL"> XL</label>
                                                    </td>
                                                    <td style="width:10px"></td>
                                                    <td>
                                                        <input type="checkbox" name="size" id="XXL" value="XXL">
                                                        <label for="XXL"> XXL</label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary buttonedit">Add Product</button>
                    </form>
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