<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <link href="css/bootstrap3.min.css" rel="stylesheet" />
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <link href="css/home.css" rel="stylesheet">

  <section id="container" class="">
      <!--header start-->
     
      
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="row">
                  <div class="col-md-3">
                      <jsp:include page="sidebar.jsp" />
                      
                  </div>
                  <div class="col-md-9">
                      <section class="panel">
                          <div class="panel-body">
                              <div class="pro-sort">
                                  <label class="pro-lab">Sort By</label>
                                  <select class="styled" >
                                      <option>Default Sorting</option>
                                      <option>Popularity</option>
                                      <option>Average Rating</option>
                                      <option>Newness</option>
                                      <option>Price Low to High</option>
                                      <option>Price High to Low</option>
                                  </select>
                              </div>
                              <div class="pro-sort">
                                  <label class="pro-lab">Show</label>
                                  <select class="styled" >
                                      <option>Result Per Page</option>
                                      <option>2 Per Page</option>
                                      <option>4 Per Page</option>
                                      <option>6 Per Page</option>
                                      <option>8 Per Page</option>
                                      <option>10 Per Page</option>
                                  </select>
                              </div>
                          </div>
                      </section>

                      <jsp:include page="viewProducts.jsp" />

     

     


  </section>
  
