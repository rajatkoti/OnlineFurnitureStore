<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.aricent.model.Product" %>    
<%@ page import="java.util.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
h1{
            font-size:30px;
        }
        /*Table Style One*/
        .table .table-header{
            background:#11A8AB;
            color:#333;
        }
        .table .table-header .cell{
            padding:20px;
        }
        td{
         color:#FFFFFF !important;
        }
        @media screen and (max-width: 640px){
            table {
                overflow-x: auto;
                display: block;
            }
            .table .table-header .cell{
                padding:20px 5px;
            }
        }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>
  <script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>  
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
String u = (String) request.getSession().getAttribute("email");

    if (u != null ) {
    	
 %>   	
        <div class="main-container">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <!-- HEADER -->
            <header class="block">
                <ul class="header-menu horizontal-list">
                     <li>
                            <a class="header-menu-tab" href="admin.jsp"><span class="icon fontawesome-envelope scnd-font-color"></span>Home</a>                            
                        </li>
                    <li>
                            <a class="header-menu-tab" href="AdminController?action=viewAllCategory"><span class="icon fontawesome-envelope scnd-font-color"></span>View All Categories</a>                            
                        </li>
                         <li>
                            <a class="header-menu-tab" href="AdminController?action=viewAllBrands"><span class="icon fontawesome-envelope scnd-font-color"></span>View All Brands</a>                            
                        </li>
                        <li>
                            <a class="header-menu-tab" href="AdminController?action=view_all_products"><span class="icon fontawesome-envelope scnd-font-color"></span>View All Products</a>                            
                        </li>
                        <li>
                            <a class="header-menu-tab" href="AdminController?action=view_users"><span class="icon entypo-paper-plane scnd-font-color"></span>View All Users</a>                            
                        </li>
                        <li>
                            <a class="header-menu-tab" href="addproduct.jsp"><span class="icon entypo-paper-plane scnd-font-color"></span>Add Product</a>                            
                        </li>
                </ul>
                <ul class="nav navbar-nav pull-right">
                <li><a class="header-menu-tab" href="UserController?method=get&action=logout"><i class="fa fa-power-off" aria-hidden="true" style="color:#FFFFFF;"></i></a></li>
                <li>
               
                     
                      <a class="header-menu-tab" href="#5">Me
                   <div class="profile-picture small-profile-picture">
                        <img width="40px" alt="Anne Hathaway picture" src="images/admin.png">
                    </div>
                    </a>
                </li>    
               </ul>          
            </header>
              
              <div class="col-md-12 col-lg-12 col-sm-12" style="float:left">   
             
  <form class="form-horizontal" action=<%=response.encodeURL("ProductController?action=addProduct")%> method="POST" enctype="multipart/form-data">
<fieldset>

<!-- Form Name -->
<legend>PRODUCTS</legend>

<!-- Text input-->


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name">PRODUCT NAME</label>  
  <div class="col-md-4">
  <input id="product_name" name="product_name" placeholder="PRODUCT NAME" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->


<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_category">PRODUCT CATEGORY</label>
  <div class="col-md-4">
    <select id="product_categorie" name="product_category" class="form-control">
    <option>Bed</option>
      <option>Chair</option>
        <option>Table</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="available_quantity">AVAILABLE QUANTITY</label>  
  <div class="col-md-4">
  <input id="available_quantity" name="available_quantity" placeholder="AVAILABLE QUANTITY" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->


<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_description">PRODUCT DESCRIPTION</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="product_description" name="product_description"></textarea>
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="PRODUCT_PRICE">Product Price</label>  
  <div class="col-md-4">
  <input id="percentage_discount" name="price" placeholder="PRODUCT_PRICE" class="form-control input-md" required="" type="text">
    
  </div>
</div>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="percentage_discount">PERCENTAGE DISCOUNT</label>  
  <div class="col-md-4">
  <input id="percentage_discount" name="percentage_discount" placeholder="PERCENTAGE DISCOUNT" class="form-control input-md" required="" type="text">
    
  </div>
</div>


 <!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">main_image</label>
  <div class="col-md-4">
    <input id="filebutton" name="filebutton" class="input-file" type="file">
  </div>
</div>
<!-- File Button --> 


<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton">Single Button</label>
  <div class="col-md-4">
    <button id="singlebutton" type="submit" name="singlebutton" class="btn btn-primary">Upload</button>
  </div>
  </div>

</fieldset>
</form> 
                  </div>
     <div id="clear" style="clear:both;"></div>
        </div> <!-- end main-container -->
      </div>
    <% 
	}		
else{
	%>
      <jsp:include page="index.jsp" />
<% 
}
%>       

</body>
</html>          