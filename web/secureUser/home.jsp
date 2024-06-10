<%-- 
    Document   : home
    Created on : Mar 23, 2022, 4:09:25 PM
    Author     : User
--%>

<%@page import="model.CommentDisplay"%>
<%@page import="model.Notification"%>
<%@page import="model.Comment"%>
<%@page import="java.util.List"%>
<%@page import="model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/logo.png"/>
    <title>Peace</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

   <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/css/lightgallery.min.css">

   <script src="https://kit.fontawesome.com/1935d064dd.js" crossorigin="anonymous"></script>


   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


   <!-- owl carousel css file cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">

   <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="../css/style.css">

</head>
<body>

<!-- header section starts  -->

<jsp:include page="include/header.jsp" />




<% 
 List<Products> productsList = (List) session.getAttribute("ProductsList");
 List<CommentDisplay> commentList = (List) session.getAttribute("commentList");
//  List<Notification> notitList = (List) session.getAttribute("notitList");
    int count = 0;
%>


<!-- header section ends -->

<!-- home section starts  -->

<section class="home" id="home">

    <div class="slide-container active">
        <div class="slide">
            <div class="content">
                <span>Peace white shirt</span>
                <h3>Peace comfort shirt</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat maiores et eos eaque veritatis aut laboriosam earum dolorem iste atque.</p>
                <a href="#" class="btn">View More</a>
            </div>
            <div class="image">
                <img src="../images/t-shirt2.jpg" class="shoe" width="200" height="650" alt="">
            </div>
        </div>
    </div>

    <div class="slide-container">
        <div class="slide">
            <div class="content">
                <span>Peace red shirt</span>
                <h3>Peace comfort shirt</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat maiores et eos eaque veritatis aut laboriosam earum dolorem iste atque.</p>
                <a href="#" class="btn">View More</a>
            </div>
            <div class="image">
                <img src="../images/t-shirt4.jpg" class="shoe" width="200" height="850" alt="">
            </div>
        </div>
    </div>

    <div class="slide-container">
        <div class="slide">
            <div class="content">
                <span>Peace blue shirt</span>
                <h3>Peace comfort shirt</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat maiores et eos eaque veritatis aut laboriosam earum dolorem iste atque.</p>
                <a href="#" class="btn">View More</a>
            </div>
            <div class="image">
                <img src="../images/t-shirt3.jpg" class="shoe" width="200" height="850" alt="">
            </div>
        </div>
    </div>

    <div id="prev" class="fas fa-chevron-left" onclick="prev()"></div>
    <div id="next" class="fas fa-chevron-right" onclick="next()"></div>

</section>

<!-- home section ends -->


<!-- home Promotion section start -->


        <h1 class="heading"> <span>Limited Offer</span> </h1>
        <section class="banner">
            <div class="box-container">
                <% for (Products products : productsList) {%>
                <% if (products.getProductCategories().equals("Limited Offer")) {%>
                <%if (count == 3) {
                        break;
                    }%>
                <a href="ProductsSearchToDetail?productId=<%=products.getProductId()%>&&productTitle=<%=products.getProductTitle()%>" class="box">
                    <img src="../images/product_image/<%=products.getProductImage()%>"  alt="">
                    <div class="content">
                        <span style="text-decoration: none;">limited offer</span>
                        <h3>upto 40% off</h3>
                    </div>
                </a>
                <%count++;%>
                <% }%>
                <% }%>
            </div>
        </section>


        <!-- home Promotion section end -->

        <h1 class="heading" style="margin-top:200px"> <span>New Arrival</span> </h1>


        <div class="slide-container2">
            <img id="slide-left" class="arrow2" src="../images/arrow-left.png">
            <section class="container2" id="slider">
                <% for (Products products : productsList) {%>
                <% if (products.getProductCategories().equals("New Arrival")) {%>
                <div class="thumbnail">
                    <img src="../images/product_image/<%=products.getProductImage()%>"  height="300px" alt="">
                    <div class="product-details">
                        <h2><%=products.getProductTitle()%></h2>
                        <p><%=products.getProductAmount()%></p>
                        <a href="ProductsSearchToDetail?productId=<%=products.getProductId()%>&productTitle=<%=products.getProductTitle()%>">View Product</a>
                    </div>
                </div>
                <% }%>
                <% }%>

            </section>
            <img id="slide-right" class="arrow2" src="../images/arrow-right.png">
        </div>
    </main>



    <!-- home Promotion section end -->





    <!-- popular section starts  -->


    <h1 class="heading" style="margin-top:200px"> <span>Popular Shirt</span> </h1>



    <section class="popular" id="popular">


        <div class="popular-container">
            <% for (Products products : productsList) {%>
            <% if (products.getProductCategories().equals("Popular")) {%>
            <a href="ProductsSearchToDetail?productId=<%=products.getProductId()%>&&productTitle=<%=products.getProductTitle()%>" class="box">
                <img src="../images/product_image/<%=products.getProductImage()%>" alt="">
                <div class="icon"> <i class="fas fa-plus"></i> </div>
            </a>
            <% }%>
            <% }%>
            
        </div>

    </section>

    <!-- popular section ends -->
 



 <!-- review section starts  -->


<h1 class="heading" style="margin-top:200px; "> <span>Customer's Review</span>  </h1>



<section class="review" id="review">


    <div class="swiper review-slider">

        <div class="swiper-wrapper">

            
               <% for (CommentDisplay comment : commentList) {%>

             <div class="swiper-slide box">
                <img src="../images/<%= comment.getImage()  %>" alt="">
                <p>Only "Peace" shirt can find real Peace</p>
                <h3><%= comment.getName()  %></h3>
                <div class="stars">
                    <% for(int i=1;i<=5;i++){
            if(comment.getRatings()>=i){ %>
             <i class="fas fa-star"></i>
     <%	 }else{ %>  
  <i class="fas fa-star-o"></i>
      <% }}%> 
                           
                </div>
                <!--fa fa-star-o-->
            </div>
            <% }%>
            
           

<!--            <div class="swiper-slide box">
                <img src="../images/erhao.jpg" alt="">
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Unde sunt fugiat dolore ipsum id est maxime ad tempore quasi tenetur.</p>
                <h3>Er Hao</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
            </div>

            <div class="swiper-slide box">
                <img src="../images/jason.jpg" alt="">
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Unde sunt fugiat dolore ipsum id est maxime ad tempore quasi tenetur.</p>
                <h3>Jason Tan</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
            </div>

            <div class="swiper-slide box">
                <img src="../images/junquan.jpg" alt="">
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Unde sunt fugiat dolore ipsum id est maxime ad tempore quasi tenetur.</p>
                <h3>Jun Quan</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
            </div>

            <div class="swiper-slide box">
                <img src="../images/popular10.jpg" alt="">
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Unde sunt fugiat dolore ipsum id est maxime ad tempore quasi tenetur.</p>
                <h3>Khai Ray</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
            </div>
            -->
        </div>

    </div>

</section>


 <!-- review section ends -->










<!-- footer section starts  -->

<jsp:include page="include/footer.jsp" />




<!-- footer section ends -->









 <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

<!-- jquery cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- owl carousel js file cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<!-- custom js file link  -->

<script src="../js/script.js"></script>



    
</body>
</html>

