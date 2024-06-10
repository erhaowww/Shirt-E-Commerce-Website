<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="model.Products"%>
<%
    List<Products> productsList = (List) session.getAttribute("proList");
    boolean nameAsc = false;
    boolean nameDesc = false;
    boolean priceAsc = false;
    boolean priceDesc = false;
    if (request.getParameter("orderBy") != null) {
        String order = request.getParameter("orderBy");

        if (order.equals("name-a-z")) {
            nameAsc = true;
        }
        if (order.equals("name-z-a")) {
            nameDesc = true;
        }
        if (order.equals("price-low-high")) {
            priceAsc = true;
        }
        if (order.equals("price-high-low")) {
            priceDesc = true;
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/product.css">
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link rel="icon" href="../images/logo.png"/>
        <title>Product Page</title>
    </head>
    <body>
        <jsp:include page="../secureUser/include/header.jsp" />
        <div class="div-container">
            <div class="col-lg-12">
                <div class="row formtype">
                    <div class="col-md-6" style="height:50px"></div>
                    <div class="col-md-6" style="height:50px"></div>
                    <div class="rightside col-md-12">
                        <form action="ProductsSearchAndSort?search=<%=request.getParameter("search")%>" method="post">
                            <select id="order sort" name="sorting" onchange="this.form.submit()">
                                <option value="none" name="default" disable hidden>Default Sorting <i class="arrow down"></i></option>
                                <option value="name-a-z" name="name-a-z" <%if (nameAsc) {%><%="selected"%><%}%>>Sort By Name A To Z</option>
                                <option value="name-z-a" name="name-z-a" <%if (nameDesc) {%><%="selected"%><%}%>>Sort By Name Z To A</option>
                                <option value="price-low-high" name="price-low-high" <%if (priceAsc) {%><%="selected"%><%}%>>Sort By Price: Low to High</option>
                                <option value="price-high-low" name="price-high-low" <%if (priceDesc) {%><%="selected"%><%}%>>Sort By Price: High to Low</option>
                            </select>
                        </form>

                    </div>
                    <% for (Products products : productsList) {%>
                    <div class="col-md-6">
                        <a href="ProductsSearchToDetail?productId=<%=products.getProductId()%>&productTitle=<%=products.getProductTitle()%>">
                            <div class="product">
                                <div class="product-image">
                                    <img src="../images/<%=products.getProductImage()%>" width="180px" height="180px">
                                </div>
                                <div class="product-details">
                                    <div class="product-name"><b><%=products.getProductTitle()%></b></div>
                                    <div class="product-cash"><b>RM<%=String.format("%.2f", products.getProductAmount())%></b></div>
                                    <div class="product-other"><%=products.getProductSize()%> <span class="rightside"><%=products.getProductCategories()%></span></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% }%> 
                    <div class="col-md-12">show <%=productsList.size()%> result</div>
                </div>
            </div>
        </div>

        <jsp:include page="../secureUser/include/footer.jsp" />
        <script>
            $('form select').on('change', function () {
                $(this).closest('form').submit();
            });
        </script>
    </body>
</html>