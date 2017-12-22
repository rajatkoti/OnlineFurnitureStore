<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <div id="outer">
 <div id="outer-canvas"> 
  
 <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <a href="#category"><img src="images/slider1.jpg" style="height:500px;width:100%;" alt="Los Angeles"></a>
    </div>

    <div class="item">
      <a href="#category"><img src="images/slider2.jpg" style="height:500px;width:100%;" alt="Chicago"></a>
    </div>

    <div class="item">
      <a href="#category"><img src="images/slider3.jpg" style="height:500px;width:100%;" alt="New York"></a>
    </div>
    <div class="item">
      <a href="#category"><img src="images/slider4.gif" style="height:500px;width:100%;" alt="New York"></a>
    </div>
    <div class="item">
      <a href="#category"><img src="images/slider5.png" style="height:500px;width:100%;" alt="New York"></a>
    </div>
    <div class="item">
      <a href="#category"><img src="images/slider6.jpg" style="height:500px;width:100%;" alt="New York"></a>
    </div>
   
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    <!-- Services -->
    <section class="services-block hidden-xs">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-sm-4 col-lg-4 divider-right"> <a href="#" class="item"> <span class="icon icon-airplane-2"></span> <span class="title">Free shipping</span> <span class="description">on orders over $200</span> </a> </div>
          <div class="col-xs-12 col-sm-4 col-lg-4 divider-right"> <a href="#" class="item"> <span class="icon icon-clock"></span> <span class="title">9 day returns</span> <span class="description">moneyback guarantee</span> </a> </div>
          <div class="col-xs-12 col-sm-4 col-lg-4"> <a href="#" class="item"> <span class="icon icon-umbrella "></span> <span class="title">24/7 Support </span> <span class="description">online consultations</span> </a> </div>
        </div>
      </div>
    </section>
    <!-- //end Services --> 
    
    <!-- Filters -->
    <section id="category" class="filters-by-category header-filter clearfix">
      <div class="container">
        <ul class="option-set" data-option-key="filter">
          <li><a href="ProductController?action=get_products_by_category&category=Beds" data-option-value=".category1" class="selected">Bed</a></li>
          <li>/</li>
          <li><a href="ProductController?action=get_products_by_category&category=Coffee_and_Centre_Tables" data-option-value=".category2" class="">Table</a></li>
          <li>/</li>
          <li><a href="ProductController?action=get_products_by_category&category=Sofas" data-option-value=".category3" class="">Sofa</a></li>
        </ul>
      </div>
    </section>
    
   <jsp:include page="viewProducts.jsp" />

    <!-- Brands -->
    <section class="container content-row">
      <h3>BRANDS</h3>
      <div class="brands carouFredSel row">
        <div class="carouFredSel-controls">
          <div class="carouFredSel-buttons"><a id="brands-carousel-prev" class="prev" href="#"></a><a id="brands-carousel-next" class="next" href="#"></a></div>
        </div>
        <div class="brands-carousel">
          <ul class="slides">
            <li><a href="#"><img src="images/brands/logo1.png" style="height:70px;" alt=""></a></li>
            <li><a href="#"><img src="images/brands/logo3.png" style="height:70px;" alt=""></a></li>
            <li><a href="#"><img src="images/brands/logo4.png" style="height:70px;" alt=""></a></li>
            <li><a href="#"><img src="images/brands/logo5.png" style="height:70px;" alt=""></a></li>
            <li><a href="#"><img src="images/brands/logo8.png" style="height:70px;" alt=""></a></li>
            <li><a href="#"><img src="images/brands/logo1.png" style="height:70px;" alt=""></a></li>
             <li><a href="#"><img src="images/brands/logo3.png" style="height:70px;" alt=""></a></li>
              <li><a href="#"><img src="images/brands/logo4.png" style="height:70px;" alt=""></a></li>
               <li><a href="#"><img src="images/brands/logo5.png" style="height:70px;" alt=""></a></li>
                <li><a href="#"><img src="images/brands/logo8.png" style="height:70px;" alt=""></a></li>
          </ul>
        </div>
      </div>
    </section>
    <!-- //end Brands -->
     <div id="outer-overlay"></div>
 </div>
 </div>   