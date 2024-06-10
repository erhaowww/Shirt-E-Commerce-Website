<%@page import="model.Users"%>
<%@page import="java.util.List"%>
<%@page import="model.Comment"%>
<%@page import="model.CommentDisplay"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Hotel Dashboard Template</title>
        <link rel="shortcut icon" type="image/x-icon" href="../images/logo.png">
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

        <%

            List<CommentDisplay> commentList = (List) session.getAttribute("commentList");

        %>
        <div class="page-wrapper">
            <div class="content mt-5">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="page-title">Comments</h4> </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12">
                        <div class="activity">
                            <div class="activity-box">
                                <ul class="activity-list">

                                    <%                             for (CommentDisplay comment : commentList) {


                                    %>                                                                      
                                    <p>


                                    <li class="activity-list_li">
                                        <div class="activity-user">
                                            <a href="profile.html" title=" <%= comment.getName()%>" data-toggle="tooltip" class="avatar"> <img alt=" <%= comment.getName()%>" src="../images/<%= comment.getImage()%>" class="img-fluid rounded-circle"> </a>
                                        </div>
                                        <% for (int i = 1; i <= 5; i++) {
                                                if (comment.getRatings() >= i) { %>
                                        <span class="fa fa-star checked" style="color:orange;"></span>
                                        <%	 } else { %>  
                                        <span class="fa fa-star checked" style="color:#000;"></span>
                                        <% }
                                            }%> 
                                        <div class="activity-content">
                                            <div class="timeline-content"> <a href="profile.html" class="name"> <%= comment.getName()%></a>  <%= comment.getReviews()%> <a href="#"> About <%= comment.getAbout()%></a>
                                                <a class="activity-delete" href="../secureAdmin/CommentDelete?commentUser=<%= comment.getCommentId()%>" title="Delete">&times;</a> <a href="CommentSearch?commentId=<%= comment.getCommentId()%>&userId=<%= comment.getUserId()%>&staffId=1" class="btn btn-primary">Reply</a>   </div>

                                        </div>  </li>



                                    <%	}%> 			
                                </ul>
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
    <script>
        $(function () {
            $('#datetimepicker3').datetimepicker({
                format: 'LT'
            });
        });
    </script>
</body>

</html>