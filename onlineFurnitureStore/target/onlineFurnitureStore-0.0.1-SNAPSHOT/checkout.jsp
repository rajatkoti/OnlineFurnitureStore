<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>        
<%@ page import="org.aricent.model.Cart" %>     
<%@ page import="org.aricent.model.Product" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>    
<jsp:include page="header.jsp" />
<link href="css/bootstrap3.min.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="css/checkout.css" rel="stylesheet" type="text/css" />

<body>
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
String email = (String) request.getSession().getAttribute("email");

    if (email != null ) {
    	
 %>   	
<jsp:include page="navbar.jsp" />
<div class="main">
	   <div class="container">
		  <div class="check_box">	
		  <%
		  ArrayList<Cart> arr= null;
		  Object result = request.getAttribute("cart");
		  arr = (ArrayList<Cart>) result;
		  
			 
			 %>   
		<div class="col-md-9 cart-items">
	
			 <h1>My Shopping Bag (<%= arr.size() %>)</h1>
				<script>
				
			   </script>
			   <c:set var="grossTotal" value="${0}" />
			 <% for(int i=0;i<arr.size();i++) {
				 double price = arr.get(i).getProductPrice();
				 int qty = arr.get(i).getProductQuantity();
			 %>
			 <div id="<%=arr.get(i).getProductId()%>" class="cart-header">
				 <div class="close1" onclick="remove(this)"> </div>
				 <div class="cart-sec simpleCart_shelfItem">
						<div class="cart-item cyc">
							 <img src="<%=arr.get(i).getProductImage()%>"  class="img-responsive" alt="">
						</div>
					   <div class="cart-item-info">
						<h3><a href="#"><%=arr.get(i).getProductName()%></a><span></span></h3>
						<ul class="qty">
							<c:set var="quantity" value="<%= qty %>"/>
							<c:set var="price" value="<%= price %>"/>
							<c:set var="total" value="${quantity*price}" />
							<c:set var="grossTotal" value="${grossTotal+total}" />
							<li id="quantity"><p>Qty : <c:out value="${quantity}" /></p></li>
							<li id="price"><p>Price :<c:out value="${price}" /></p></li> 
							<input type="hidden" id="subtotal" value="${quantity*price}" />
						</ul>
						<div class="delivery">
							 <p id="total" style="padding:8px 0px;font-size:22px;font-weight:500;">Total: <%= price %>*<%= qty %><span id="gross" style="color:#DF4782;font-size:22px;font-weight:500;"><i class="fa fa-inr"></i><c:out value="${total}" /></span></p>
							 <input type="hidden" id="email_input" value="<%= email %>" />
							 <span style="float:right;">Delivered in 2-3 business days</span>
							 <div class="clearfix"></div>
				        </div>	
					   </div>
					   <div class="clearfix"></div>
											
				  </div>
			 </div>
			 <%
			 }
			 %>
			
			 		
		 </div>
		 <div class="col-md-3 cart-total">
			 <a class="continue" href="home.jsp">Continue to basket</a>
			 <div class="price-details">
				 <h3>Price Details</h3>
				 <span>Total</span>
				 <span class="total-amount"><c:out value="${grossTotal}" /></span>
				 <span>GST</span>
				 <span class="gsttax">100.00</span>
				 <span>Delivery Charges</span>
				 <span class="deliverycharges">150.00</span>
				 <div class="clearfix"></div>				 
			 </div>	
			 <ul class="total_price">
			   <li class="last_price"> <h4>TOTAL</h4></li>	
			   <li class="real-total"><span></span></li>
			   <div class="clearfix"> </div>
			 </ul>
			
			 
			 <div class="clearfix"></div>
			 <a class="order" href="ProductController?action=BuyNow&email=<%=email %>">Place Order</a>
			
			</div>
			<div class="clearfix"></div>
	 </div>
	     </div>
	    </div>
<script>

var id ;
var newTotal;
var email;
function remove(prod_id){
	
	 id = prod_id.parentNode.id;
	 email=document.getElementById("email_input").value;
	 var prod_id="#"+id;
	 var hidden_fields = $(prod_id).find( 'input:hidden' ).val();
	 console.log("Input field"+hidden_fields);
    
	 var total='${grossTotal}';
	 console.log("Gross total before"+total);
	 newTotal=total-hidden_fields;
	 console.log("New Total"+ newTotal);
	 
	 
	 console.log("Prod id"+id);
	 document.getElementById(id).remove();
	 $.ajax({
	 		url: 'ProductController?action=Delete_From_Cart', 
			type: "POST", 
			data: "p_id="+id+"&email="+email,
			dataType: "text",
			success: function(resultData){
		          alert("Product deleted from cart");
		          changed();
		      }
		});
	 
	 
		
}

	
	
	
$(document).ready(function(){
	
	
	changed();
	var email=document.getElementById("email_input").value;
	
	
	
	
	
});

 function changed() {
	
	  
	  var IDs = [];
	  
	  
	  $(".cart-items").find(".cart-header").each(function(){ 
			IDs.push(this.id);
			console.log(IDs);
			/* var total = "<c:out value="${grossTotal}"/>"; */
			
		});
	  
	  $(".cart-total").find(".total-amount").text(newTotal);
	  var total =$(".cart-total").find('.total-amount').text();
	  var tax= $(".cart-total").find('.gsttax').text();
	  console.log("Tax:"+tax);
	  var delivery=$(".cart-total").find('.deliverycharges').text();
	  console.log("Delivery:"+delivery);
	  var finalTotal = parseInt(total)+parseInt(tax)+parseInt(delivery);
	  console.log(finalTotal);
	  $(".real-total").text(finalTotal);
	  
	}
	
</script>
	    
<jsp:include page="footer.jsp" />
<%
    }
    else{
    	%>
    	<jsp:forward page="index.jsp"/>
   <%  }

%>
</body>
</html>