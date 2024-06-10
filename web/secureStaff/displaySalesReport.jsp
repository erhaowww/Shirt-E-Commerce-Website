

<%@page import="java.util.List"%>
<%@page import="model.Sales"%>

<!-- retrieve session object, itemList -->
<%
    List<Sales> itemList = (List<Sales>) session.getAttribute("salesList");
//    String title = (String) session.getAttribute("heading");
    String year = (String) session.getAttribute("year");
    double[] monthlySales = (double[]) session.getAttribute("monthlySales");
    String monthSelected = request.getParameter("month");
    String monthInEng = "";
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

        <title>Document</title>
    </head>
    <body>
        <jsp:include page="include/staffHeader.jsp" />

        <div class="page-wrapper">
            <div class="content mt-5">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="page-title">Sales Reports</h4> </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12">
                        <div class="activity">
                            <div class="activity-box">
                                <ul class="activity-list">
                                    <canvas id="myChart" style="width:100%;max-width:600px"></canvas>
                                    <p>Total Sales: <%= String.format("RM%.2f", monthlySales[12])%></p>

                                    <% if (monthSelected != null) {
                                            if (monthSelected.equals("01"))
                                                monthInEng = "Jan";
                                            else if (monthSelected.equals("02"))
                                                monthInEng = "Feb";
                                            else if (monthSelected.equals("03"))
                                                monthInEng = "Mar";
                                            else if (monthSelected.equals("04"))
                                                monthInEng = "Apr";
                                            else if (monthSelected.equals("05"))
                                                monthInEng = "May";
                                            else if (monthSelected.equals("06"))
                                                monthInEng = "June";
                                            else if (monthSelected.equals("07"))
                                                monthInEng = "July";
                                            else if (monthSelected.equals("08"))
                                                monthInEng = "Aug";
                                            else if (monthSelected.equals("09"))
                                                monthInEng = "Sept";
                                            else if (monthSelected.equals("10"))
                                                monthInEng = "Oct";
                                            else if (monthSelected.equals("11"))
                                                monthInEng = "Nov";
                                            else
                                                monthInEng = "Dec";%>

                                    <div style="margin: 50px;">
                                        <h1 style="text-align: center;">Sales Reports<%out.println(" for " + monthInEng);%>)</h1>
                                        <table id="table_id" class="table table-striped table-hover table-bordered" style="width:100%">
                                            <thead style="background-color: #b8bfc7">
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Payment Method</th>
                                                    <th>Payment Total</th>
                                                    <th>Payment Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (Sales item : itemList) {%>
                                                <%if (item.getPaymentDate().substring(3, 5).equals(monthSelected)) {%>
                                                <tr>
                                                    <td><%=item.getName()%></td>
                                                    <td><%=item.getPaymentMethod()%></td>
                                                    <td><%= String.format("RM%.2f", item.getPaymentTotal())%></td>
                                                    <td><%=item.getPaymentDate()%></td>
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
            var xValues = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"];
            var yValues = [<%= monthlySales[0]%>, <%= monthlySales[1]%>, <%= monthlySales[2]%>, <%= monthlySales[3]%>, <%= monthlySales[4]%>, <%= monthlySales[5]%>, <%= monthlySales[6]%>, <%= monthlySales[7]%>, <%= monthlySales[8]%>, <%= monthlySales[9]%>, <%= monthlySales[10]%>, <%= monthlySales[11]%>];
            var barColors = ["red", "green", "blue", "orange", "brown", "yellow", "purple", "gray", "pink", "cyan", "black", "lightgreen"];

            new Chart("myChart", {
                type: "bar",
                data: {
                    labels: xValues,
                    datasets: [{
                            backgroundColor: barColors,
                            data: yValues
                        }]
                },
                options: {
                    legend: {display: false},
                    title: {
                        display: true,
                        text: "Sales Reports " + <%= year%>
                    },

                    onClick: function (c, i) {
                        e = i[0];
                        console.log(e._index);
                        var x_value = this.data.labels[e._index];
                        var y_value = this.data.datasets[0].data[e._index];
                        console.log(x_value);
                        console.log(y_value);
                        if (e._index < 9)
                            window.location.replace("displaySalesReport.jsp?month=0" + (e._index + 1));
                        else
                            window.location.replace("displaySalesReport.jsp?month=" + (e._index + 1));

                    }
                }

            });
        </script>

        <script>
            $(document).ready(function () {
                $('#table_id').DataTable();
            });

        </script>

        <script src="../assets/js/popper.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
        <script src="../assets/js/moment.min.js"></script>
        <script src="../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="../assets/js/script.js"></script>

    </body>
</html>
