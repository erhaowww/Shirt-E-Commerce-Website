<%-- 
    Document   : Success
    Created on : Apr 7, 2022, 9:10:54 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
  </head>
    <style>
      body {
        text-align: center;
        padding: 40px 0;
        background: #EBF0F5;
      }
        h1 {
          color: #88B04B;

          font-weight: 900;
          font-size: 40px;
          margin-bottom: 10px;
        }
        p {
          color: #404F5E;

          font-size:20px;
          margin: 0;
        }
      i {
        color: #9ABC66;
        font-size: 100px;
        line-height: 200px;
        margin-left:-15px;
      }
      .card {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
      }
      
      .button {
    width: 50%;
    display: block;
    margin: 20px auto;
    border-radius: 25px;
    padding: 10px;
    text-decoration: none;
    color: #9ABC66;
    text-align: center;
    letter-spacing: 0.05em;
    border-style: solid;
  border-color: #9ABC66;
}

.button:hover{
    background: #9ABC66;
    color: white;
}

    </style>
    

    <body>

        
      <div class="card">
      <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
        <i class="checkmark">✓</i>
      </div>
          
          
        <h1>Success</h1> 
        <%
  boolean success = (Boolean)session.getAttribute("success");
    String successText = (String)session.getAttribute("successText");
  if (success) {%>
       <p><%= successText  %></p>
  <% }else{%>
      <p>2122</p>
<% }%>

     <a href="../CommentDisplay" class="button" id="s_button">Back</a>
          
      </div>
    </body>
</html>
