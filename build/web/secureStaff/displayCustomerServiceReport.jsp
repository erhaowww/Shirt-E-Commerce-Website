

<%@page import="model.CustomerServiceTable"%>
<%@page import="java.util.List"%>
<%@page import="model.CustomerService"%>

<!-- retrieve session object, tableList -->
<%
//    String title = (String) session.getAttribute("heading");
    List<CustomerServiceTable> tableList = (List<CustomerServiceTable>) session.getAttribute("customerServiceTableList");
    List<CustomerService> chartList = (List<CustomerService>) session.getAttribute("customerServiceChartList");
    String staffName = request.getParameter("staff");
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
        <link rel="stylesheet" href="../assets/css/style.css"> </head>

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
                    <h4 class="page-title">Customer Service Reports</h4> </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-12">
                    <div class="activity">
                        <div class="activity-box">
                            <ul class="activity-list">
                                <div id="myChart" style="width:100%; max-width:600px; height:500px;"></div>

                                <% if (staffName != null) {%>
                                <div style="margin: 50px;">
                                    <h1 style="text-align: center;">Customer Service Reports(<%out.println(" for " + staffName);%>)</h1>
                                    <table id="table_id" class="table table-striped table-hover table-bordered" style="width:100%">
                                        <thead style="background-color: #b8bfc7">
                                            <tr>
                                                <th>Reply Message</th>
                                                <th>Notification Date</th>
                                                <th>Notification Time</th>
                                                <th>Username</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (CustomerServiceTable item : tableList) {%>
                                            <%if (item.getStaffName().equals(staffName)) {%>
                                            <tr>
                                                <td><%=item.getReplyMessage()%></td>
                                                <td><%=item.getNotification_date()%></td>
                                                <td><%=item.getNotification_time()%></td>
                                                <td><%=item.getUsername()%></td>
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

    <%
        int i = 0;
        String staffAndNumReq = "";
        for (CustomerService item : chartList) {
            if (i != chartList.size() - 1) {
                staffAndNumReq += "[\"" + item.getStaffName() + "\"," + item.getNumRequest() + "],";
            } else {
                staffAndNumReq += "[\"" + item.getStaffName() + "\"," + item.getNumRequest() + "]";
            }
            i++;
        }

    %>

    <script>
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Staff', 'Number of request handled'],
        <%out.println(staffAndNumReq);%>
            ]);

            var options = {
                title: 'Number of request handled by Staff'
            };

            var chart = new google.visualization.BarChart(document.getElementById('myChart'));
            function selectHandler() {
                var selectedItem = chart.getSelection()[0];
                if (selectedItem) {
                    var topping = data.getValue(selectedItem.row, 0);
//                    console.log(topping);
                    window.location.replace("displayCustomerServiceReport.jsp?staff=" + topping);
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
