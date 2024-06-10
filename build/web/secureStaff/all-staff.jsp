<!DOCTYPE html>
<html lang="en">
    <%@page import="java.util.List"%>
    <%@page import="model.Staff"%>

    <%
        List<Staff> staffList = (List) session.getAttribute("StaffList");
    %>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>All Staff</title>
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
        <jsp:include page="include/staffHeader.jsp" />
        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col">
                            <div class="mt-5">
                                <h4 class="card-title float-left mt-2">All Staff</h4> <a href="../secureAdmin/add-staff.jsp" class="btn btn-primary float-right veiwbutton">Add Staff</a> </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-table">
                            <div class="card-body booking_card">
                                <div class="table-responsive">
                                    <table class="datatable table table-stripped table table-hover table-center mb-0" id="sort">
                                        <thead>
                                            <tr>
                                                <th>Staff Name</th>
                                                <th>Staff ID</th>
                                                <th>Password</th>
                                                <th>Email</th>
                                                <th>Phone Number</th>
                                                <th class="text-right">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (Staff staff : staffList) {%>
                                            <tr>
                                                <td>
                                                    <h2 class="table-avatar">
                                                        <a href="profile.jsp" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="../images/staff_image/<%=staff.getImage()%>" alt="User Image"></a>
                                                        <a href="profile.jsp"><%=staff.getName()%></a>
                                                    </h2>
                                                </td>
                                                <td><%=staff.getStaffId()%></td>
                                                <td><%=staff.getPassword()%></td>
                                                <td><%=staff.getEmail()%></td><!--<a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="ea9e85878793888f98848b86aa8d878b8386c4898587">[email&#160;protected]</a>-->
                                                <td><%=staff.getPhoneNum()%></td>
                                                <td class="text-right">
                                                    <div class="dropdown dropdown-action"> <a href="" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v ellipse_color"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right"> 
                                                            <a class="dropdown-item" href="../secureAdmin/StaffSearch?staffId=<%=staff.getStaffId()%>"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a> <a class="dropdown-item" href="../secureAdmin/delete-staff-confirmation.jsp?staffId=<%=staff.getStaffId()%>&&staffName=<%=staff.getName()%>"><i class="fas fa-pencil-alt m-r-5"></i> Delete</a>
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