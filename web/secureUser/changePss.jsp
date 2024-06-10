<%-- 
    Document   : profuke
    Created on : Mar 24, 2022, 8:07:15 AM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    </head>
    <body>
        
        <style>
            
            #imageUpload
{
    display: none;
}

#profileImage
{
    cursor: pointer;
}
            
        </style>
        
           <link rel="stylesheet" href="../css/include.css">
         <link rel="stylesheet" href="../css/profile.css">
        
<!-- header section starts  -->

<jsp:include page="include/header.jsp" />



<!-- header section ends -->



<%
    List<Users> usersList = (List) session.getAttribute("userList");
    

for(Users u : usersList){

%>
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            
            
            
            <form action="../UsersUpdatePassword" method="post" >
  
  
  
                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img width="100px" height="100px" onclick="uploadImg() style="border-radius: 50%;" class="rounded-circle mt-5" id="profileImage" src="../images/userImage/<%= u.getImage() %>" alt="<%= u.getImage() %>"><span class="font-weight-bold"><%= u.getName() %></span><span class="text-black-50" style="font-size:15px;"><%= u.getEmail() %></span><span> </span></div>
        </div> 
   
    
       
  
    <!--<input  type="submit" value="Submit">--> 

            
          
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
                <div class="row mt-2">
  <input type="text" class="form-control" name="userId" style="display: none;" value="<%= u.getUserId()  %>">
<div class="col-md-12"><label class="labels">Old Password</label><input type="password" class="form-control" name="pss" minlength="3" required></div>
                </div>
                <div class="row mt-3" >
                    <div class="col-md-12"><label class="labels">New Password</label> <input class="form-control" id="password" name="newpss" type="password" minlength="3" required/></div>
                   
                    <div class="col-md-12"><label class="labels" style="margin-top:10px;">Confirm Password:</label><input class="form-control" type="password" name="compss" minlength="3" id="confirm_password" required/></div>  
                    <span id='message'></span>
                </div>
            <div class="mt-5 text-center" > <input class="btn profile-button"  id="btt" type="submit" value="Change Password"> </input>
              
            </div>
        </div>
      
            <% } %>
            </form>
    </div>
</div>
</div>
</div>

<!-- footer section starts  -->


<jsp:include page="include/footer.jsp" />



<!-- footer section ends -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script>
    $("#profileImage").click(function(e) {
    $("#imageUpload").click();
});

 function uploadImg(){
        document.getElementById("profile_photo").click();
    }
    var loadFile = function(event) {
        var image = document.getElementById('profileImage');
        image.src = URL.createObjectURL(event.target.files[0]);
    };
$('#password, #confirm_password').on('keyup', function () {
  if ($('#password').val() == $('#confirm_password').val()) {
            $('#btt').prop('disabled', false);
    $('#message').html('Matching').css('color', 'green');

     

  } else {
          $('#message').html('Not Matching').css('color', 'red');
 $('#btt').prop('disabled', true);
        }


});
    </script>
        
        
    </body>
</html>
