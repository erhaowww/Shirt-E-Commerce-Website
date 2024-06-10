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
        <title>Profile Page</title>
        <link rel="icon" href="../images/logo.png"/>
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
            
            
            
            <form action="../UsersUpdate" method="post" enctype="multipart/form-data">
  
  
  
                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img width="100px" height="100px" onclick="uploadImg() style="border-radius: 50%;" class="rounded-circle mt-5" id="profileImage" src="../images/userImage/<%= u.getImage() %>" alt="<%= u.getImage() %>"><span class="font-weight-bold"><%= u.getName() %></span><span class="text-black-50" style="font-size:15px;"><%= u.getEmail() %></span><span> </span></div>
        </div> 
        <input id="imageUpload" type="file" name="image" placeholder="Photo" onchange="loadFile(event)" capture>
    
       
  
    <!--<input  type="submit" value="Submit">--> 

            
          
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
                <div class="row mt-2">
                    <input type="text" class="form-control" name="userId" style="display: none;" value="<%= u.getUserId()  %>">
                  <div class="col-md-12"><label class="labels">Name</label><input type="text" class="form-control" placeholder="Enter Name" name="name" value="<%= u.getName() %>"></div>
                </div>
                <div class="row mt-3" >
                    <div class="col-md-12"><label class="labels">PhoneNumber</label><input type="tel" pattern="[0][1][0-9]-[0-9]{7,8}" class="form-control" name="pn" placeholder="enter phone number" value="<%= u.getPhoneNum() %>"></div>
                   
                    <div class="col-md-12"><label class="labels" style="margin-top:10px;">Email ID</label><input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}" name="email" class="form-control" placeholder="enter email id" value="<%= u.getEmail() %>"></div>              
                </div>
            <div > <input class="btn profile-button" style="margin-top: 20px;" type="submit" > </input>
                <div  > <a href="changePss.jsp" class="btn profile-button" style="margin-top: 13px;" >Passsword Change </a></div>
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

    </script>
        
        
    </body>
</html>
