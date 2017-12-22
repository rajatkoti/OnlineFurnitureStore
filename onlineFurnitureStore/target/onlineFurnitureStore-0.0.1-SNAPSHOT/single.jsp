<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.aricent.model.Product" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp" />
<link href="css/bootstrap3.min.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="css/single.css" rel="stylesheet" type="text/css" />
<link href="css/home.css" rel="stylesheet" type="text/css" />
<body>
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
String email = (String) request.getSession().getAttribute("email");


    	
 %>   	
<jsp:include page="navbar.jsp" />
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
  
<div class="col-md-9" style="background:#FFFFFF;">
<%
			   Object product = request.getAttribute("pr");
			   Product prod = (Product)product;
			  
			   %>
			    <div class="dreamcrub">
			   	 <ul class="breadcrumbs">
                    <li class="home">
                       <a href="index.html" title="Go to Home Page">Home</a>&nbsp;
                       <span>&gt;</span>
                    </li>
					<li class="home">
                       <a href="about.html" title="Go to Home Page">Products</a>&nbsp;
                       <span>&gt;</span>
                    </li>        
                    <li class="home">&nbsp;
                       <%= prod.getProduct_category() %>
                        <span>&gt;</span>&nbsp;
                    </li>                   
                </ul>
                <ul class="previous">
                	<li><a href="about.html">Back to Previous Page</a></li>
                </ul>
                <div class="clearfix"></div>
			   </div>
			   
			   <div class="singel_right">
			     <div class="labout span_1_of_a1">
				   <div class="flexslider">
					 <ul class="slides">
						<li data-thumb="<%= prod.getImage_path()%>">
							<img src="<%= prod.getImage_path()%>" />
						</li>
					 </ul>
				  </div>
			  </div>
			  <div class="cont1 span_2_of_a1 simpleCart_shelfItem">
				<h1><%= prod.getProduct_name() %>&nbsp;By<span style="letter-spacing:2px;"> <%= prod.getBrand_name() %> </span></h1>
				<hr style="height:2px;color:#eeeeee;"/>
			    <div class="price_single">
				  <span class="amount item_price actual" style="font-size:25px;"><i style="color:#000000;" class="fa fa-inr"></i>&nbsp;<%= prod.getActualPrice() %></span></br>
				  <div><span style="text-transform:capitalize;">Price:</span><span class="reducedfrom"><i class="fa fa-inr"></i><%= prod.getPrice() %></span>&lpar; <%= prod.getDiscount() %>&nbsp;&percnt; off &rpar;</div><br/>
				  <span>Inclusive of all taxes</span>
				  </br></br>
				  <p style="text-transform:capitalize;font-size:20px;color:#000000;"><b style="font-weight:600;">Cash on delivery</b> eligible</p>
				</div>
				<h3 class="quick">Quick Description:</h3>
				<p class="quick_desc"> <%= prod.getProduct_description() %></p>
			   
			    <div class="btn_form button item_add item_1">
				   <form style="padding-bottom:30px;">
					 <input type="hidden" id="email_input" value="<%= email %>" />
       <% if(email != null){ %>
       
         <input type="submit" value="Add to Cart" title="" onclick="addToCart(this)">
  
  <% }else { %>
     
      <input type="submit" value="Add to Cart" title="" data-toggle="modal" data-target="#basicModal" />
      
      
 
    <% } %> 

				  </form>
				</div>
			</div>
			<div class="clearfix"></div>
		   </div>
		   
									
			</div>
	 </div>
	 
	  <div class="popup" id="popup1">
  <p>Please login first and then add to cart.</p>
  
  <p>Click<a href="#" onclick="hide('popup1')">here</a> to login</p>
</div>
	</section>
 </section>
</section> 	
<script>
var cartCount = 0;
var add = $("#addCart");
var cart = $("#cart-item-count");
var email=document.getElementById("email_input").value;



function addToCart(sku) {
	alert("hello");
	var self = $(this),
	     productId=sku.parentNode.id;
 
	     cartCount++;
	 	 cart.text(cartCount);
	 	
	 	 console.log(productId);
	 	
	
	 	 $.ajax({
	 		url: 'ProductController?action=Add_To_Cart', 
			type: "POST", 
			data: "p_id="+productId+"&email="+email,
			dataType: "text",
			success: function(resultData){
		          alert("Product added to cart");
		      }
		});
	 	 
}	
	


function getId(id){
	return document.getElementById(id);
}
function show(name){
	console.log(name);
	getId(name).style.display = 'block';
}

function hide(name){
	getId(name).style.display='none';
}	
</script>	
<jsp:include page="footer.jsp" />

</body>
</html>