<%-- 
    Document   : comments-reply
    Created on : Apr 5, 2022, 2:33:30 PM
    Author     : User
--%>

<%@page import="model.Users"%>
<%@page import="java.util.List"%>
<%@page import="model.Comment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Peace Dashboard Template</title>

    <link rel="shortcut icon" type="image/x-icon" href="../images/logo.png">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="../assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="../assets/css/feathericon.min.css">
    <link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
    <link rel="stylesheet" href="../assets/plugins/morris/morris.css">
    <link rel="stylesheet" href="../assets/css/style.css"> </head>

</head>

<body>

    <!-- Navigation bar -->
        <jsp:include page="include/staffHeader.jsp" />
    <!-- Navigation bar -->
  <% 
Comment comment = (Comment)session.getAttribute("commentDetail");
Users users = (Users)session.getAttribute("UsercommentDetail");
    List<Users> usersList = (List)session.getAttribute("commentUserList");
    
int commentId = Integer.parseInt(request.getParameter("commentId"));
int userId = Integer.parseInt(request.getParameter("userId"));
int staffId = Integer.parseInt(request.getParameter("staffId"));
  %>
    
        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col">
                            <h3 class="page-title mt-5">Reply Comment</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        
                        
                          <%
//    String commentId = (String)session.getAttribute("successText");

                          %>
                        
                        
                        <form method="get" action="NotificationDetailAdd">
                            <div class="row formtype">
                                <div class="col-md-4">
                                    <%--<%= commentId %>--%>
<!--                                     <input class="form-control" type="text" name="commentId" style="display:none;" value="">-->
                                   <input class="form-control" type="text" name="userId" style="display:none;" value="<%= userId %>">
                                   <input class="form-control" type="text" name="staffId" style="display:none;" value="<%= staffId %>">
                                     
                                     
                                    <div class="form-group">
                                        <label>To:</label>
                                        <input class="form-control" type="text" name="name" disabled value="Erhao">
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <div class="form-group">
                                          <label>Comment About:</label>
                                        <input class="form-control" type="text" name="about" disabled value="<%= comment.getCommentAbout() %>">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                         <label>Comment:</label>
                                        <textarea class="form-control" type="text" rows="5" name="comment" disabled ><%= comment.getReviews() %></textarea>
                                    </div>
                                </div>
                                
                                
                                <div class="col-md-4"></div>
                                <div class="col-md-4"></div>
                       
                                <input class="form-control" type="text" name="status" style="display:none;"  value="message">
                                <input class="form-control" type="text" name="sender" style="display:none;"  value="Staff">
                                
                                <div class="col-md-4">
                                      <label>Reply</label>
                                        <textarea class="form-control" rows="5" id="message" name="message"></textarea>
                                </div>
                                


                            </div>
                
                    </div>
                </div>
                                    
             <input type="submit" class="btn btn-primary buttonedit" value="Send"> 
          
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
        $(function() {
            $('#datetimepicker3').datetimepicker({
                format: 'LT'

            });
        });
    </script>
</body>

</html>
