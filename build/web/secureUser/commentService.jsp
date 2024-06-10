<%-- 
    Document   : commentService
    Created on : Apr 9, 2022, 11:52:51 AM
    Author     : User
--%>


<%@page import="model.Users"%>

<head>
    <title>Feedback</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" />

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="../css/comment.css"> 
    <link rel="icon" href="../images/logo.png"/>

</head>


<body>

<!--<body>-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <!-- header section starts  -->

<jsp:include page="include/header.jsp" />


<!-- header section ends -->

 <%  Users user = (Users) session.getAttribute("profileuser"); %>
<div class="card">
    <div class="row">
     
        <div class="col-10">
            <div class="comment-box ml-2">
                <h4>Add a comment</h4>
              
                <form action="../CommentAdd">
                    
                      <div class="rating"> <input type="radio" name="ratings" value="5" id="5"><label for="5">☆</label> <input type="radio" name="ratings" value="4" id="4"><label for="4">☆</label> <input type="radio" name="ratings" value="3" id="3"><label for="3">☆</label> <input type="radio" name="ratings" value="2" id="2"><label for="2">☆</label> <input type="radio" name="ratings" value="1" id="1"><label for="1">☆</label> </div>
                
                    
                    
                      <input type="text" name="userId" style="display:none;" value="<%= user.getUserId() %>">   <!-- REMEMBER CHANGE -->
                    
                    <input type="text" name="about" style="display:none;" value="Service">
                    
                <div class="comment-area"> <textarea class="form-control" name="reviews" placeholder="what is your view?" rows="4"></textarea> </div>
                <div class="comment-btns mt-2">
                    <div class="row">
                        <div class="col-6">
                            <div class="pull-left"> <button class="btn btn-success btn-sm">Cancel</button> </div>
                        </div>
                        <div class="col-6">
                            <div class="pull-right">  <input type="Submit" class="btn btn-success send btn-sm" value="Send"> </input> </div>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>



<!-- footer section starts  -->

<jsp:include page="include/footer.jsp" />




<!-- footer section ends -->
</body>
</html>
