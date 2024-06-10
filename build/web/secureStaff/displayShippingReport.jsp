

<%@page import="java.util.List"%>
<%@page import="model.Shipping"%>

<!-- retrieve session object, itemList -->
<%
    List<Shipping> itemList = (List<Shipping>) session.getAttribute("shippingList");
    double[] shippingPercentage = (double[]) session.getAttribute("shippingPercentage");
    String shippingSelected = request.getParameter("shippingSelected");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css">-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">

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


        <title>Document</title>
    </head>
    <body>
        <jsp:include page="include/staffHeader.jsp" />

        <div class="page-wrapper">
            <div class="content mt-5">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="page-title">Shipping Reports</h4> </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12">
                        <div class="activity">
                            <div class="activity-box">
                                <ul class="activity-list">
                                    <div
                                        id="myChart" style="width:100%; max-width:500px; height:400px;">
                                    </div>

                                    <% if (shippingSelected != null) {%>
                                    <div style="margin: 50px;">
                                        <h1 style="text-align: center;">Shipping Reports(<%out.println(" for " + shippingSelected);%>)</h1>
                                        <table id="table_id" class="table table-striped table-hover table-bordered" style="width:100%">
                                            <thead style="background-color: #b8bfc7">
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Address</th>
                                                    <th>Phone No</th>
                                                    <th>Product Name</th>
                                                    <th>Quantity</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (Shipping item : itemList) {%>
                                                <%if (item.getShippingMethod().equals(shippingSelected)) {%>
                                                <tr>
                                                    <td><%=item.getName()%></td>
                                                    <td><%=item.getAddress()%></td>
                                                    <td><%=item.getPhoneNum()%></td>
                                                    <td><%=item.getProductTitle()%></td>
                                                    <td><%=item.getQuantity()%></td>
                                                    <td><%=item.getShippingStatus()%></td>
                                                </tr>
                                                <%}%>
                                                <% }%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <%}%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('#table_id').DataTable();
            });

        </script>

        <script>
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Delivery', 'Mhl'],
                    ['GLS', <%= shippingPercentage[0]%>],
                    ['FEDEX', <%= shippingPercentage[2]%>],
                    ['DHL', <%= shippingPercentage[1]%>]
                ]);


                var options = {
                    title: 'Delivery'
                };

                var chart = new google.visualization.PieChart(document.getElementById('myChart'));


                function selectHandler() {
                    var selectedItem = chart.getSelection()[0];
                    if (selectedItem) {
                        var topping = data.getValue(selectedItem.row, 0);
                        window.location.replace("displayShippingReport.jsp?shippingSelected=" + topping);
                    }
                }

                google.visualization.events.addListener(chart, 'select', selectHandler);
                chart.draw(data, options);
            }
        </script>

        <script src="../assets/js/popper.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
        <script src="../assets/js/moment.min.js"></script>
        <script src="../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="../assets/js/script.js"></script>

    </body>
</html>
