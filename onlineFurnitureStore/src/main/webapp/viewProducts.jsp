<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>    
<%@ page import="org.aricent.model.Product" %>   


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/product.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/css/tether.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.6/angular.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
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
  </style>


<script>
var app = angular.module('myApp', []);

	  
app.controller('axajCtrl',['$http','$scope',function($http,$scope){ 
    $http.get('ProductController?action=viewAll').success(function(response){ //make a get request to mock json file.
        $scope.data = response; //Assign data received to $scope.data
        console.log(response);
    })
    .error(function(err){
        //handle error
    })
}]);

	
</script>
</head>
<body ng-app='myApp'>
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
String email = (String) request.getSession().getAttribute("email");

    
    	
 %>   	
<div id="wrap">

<div ng-controller='axajCtrl' id="columns" class="columns_4">
  <figure ng-repeat="item in data" ng-attr-id="{{item.product_id}}">
  <a href="ProductController?action=view_product&id={{item.product_id}}"><img ng-src="{{item.image_path}}" style="height:170px;">
	<figcaption >{{item.product_name}}</figcaption></a>
    <span class="price"><i class="fa fa-inr"></i>&nbsp;{{item.price}}</span>
     <input type="hidden" id="email_input" value="<%= email %>" />
   <% if(email != null){ %>
        <a class="button" onclick="addToCart(this)" >Add to Cart</a>
  
  <% }else { %>
     <a class="button" href="#" onclick="show('popup1')" >Add to Cart</a>
    <% } %> 

	</figure>
	 </div>
	</div>
	
	<div class="popup" id="popup1">
  <p>Please login first and then add to cart.</p>
  
  <p>Click<a href="#" onclick="hide('popup1')">here</a> to login</p>
</div>
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

</body>
    
    
</html>