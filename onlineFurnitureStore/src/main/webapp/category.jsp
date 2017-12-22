<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="org.aricent.model.User" %>
<%@ page import="org.aricent.model.Product" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp" />
<link href="css/product.css" rel="stylesheet" />
 <link href="css/bootstrap3.min.css" rel="stylesheet" />
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <link href="css/home.css" rel="stylesheet">
  <style>
  .popup {
  display: none;
  position: fixed;
  padding: 10px;
  width: 280px;
  left: 50%;
  margin-left: -150px;
  height: 180px;
  top: 50%;
  margin-top: -100px;
  background: #FFF;
  z-index: 20;
}
#popup1 {
  -webkit-box-shadow:  0px 0px 0px 9999px rgba(0, 0, 0, 0.5);
  box-shadow:  0px 0px 0px 9999px rgba(0, 0, 0, 0.5);
}
a,
a:visited {
  text-decoration: none;
  color: #FFF;
  font-weight: bold;
  display: block;
  margin: 10px 0;
}

a:hover,
a:active {
  text-decoration: underline;
}

.popup a,
.popup a:visited {
  color: #1abc9c;
}

p {
	margin: 1em 0;
}

p+p+p {
	font-size: 60%;
}
  </style>
<body class="responsive">
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
String email = (String) request.getSession().getAttribute("email");

    
    	
 %>   	
<div id="wrapper">
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
                  <div class="col-md-9 col-lg-9">
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

<%                      
ArrayList<Product> arr= null;
Object result = request.getAttribute("pr");
arr = (ArrayList<Product>) result;

for(int i=0;i<arr.size();i++) {
%>

<div id="columns" class="col-md-4 col-lg-4">
  <figure id="<%=arr.get(i).getProduct_id()%>">
    <a href="ProductController?action=view_product&id=<%=arr.get(i).getProduct_id()%>"><img src="<%=arr.get(i).getImage_path()%>" style="height:170px;">
	<figcaption><%=arr.get(i).getProduct_name()%></figcaption></a>
    <span class="price"><%=arr.get(i).getPrice()%></span>
    <input type="hidden" id="email_input" value="<%= email %>" />
       <% if(email != null){ %>
        <a class="button" onclick="addToCart(this)" >Add to Cart</a>
  
  <% }else { %>
     <a class="button" href="#" onclick="show('popup1')" >Add to Cart</a>
     
    <% } %> 

   
	</figure>
	 </div>
	

     
<% } %>    

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

<c:set var="count" value="Hello"/> 


function addToCart(sku) {
	alert("hello");
	var self = $(this),
	     productId=sku.parentNode.id;
 
	     cartCount++;
	 	 cart.text(cartCount);
	 	
	
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
      </div> 
   </body>
</html>