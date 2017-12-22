<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %> 
<%@ page import="org.aricent.model.Cart" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<link rel="stylesheet" type="text/css" href="css/navbar.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.6/angular.js"></script>
<style>
#form select:focus {
    box-shadow: 0 0 5px #eef5f0;
    border: 1px solid #eef5f0;
}

.errorText {
	color: #fd5e53;
	font-size: 0.8em;
	padding-top: 0.25em;
}

input[type=text] {
	height: 2.5em;
	width: 350px;
  padding: 3px 0px 3px 3px;
  border: 1px solid #DDDDDD;
	outline: none;
  -webkit-transition: all 0.30s ease-in-out;
  -moz-transition: all 0.30s ease-in-out;
  -ms-transition: all 0.30s ease-in-out;
  -o-transition: all 0.30s ease-in-out;
}

input[type=text]:focus, textarea:focus {
  box-shadow: 0 0 5px #30ba8f;
  border: 1px solid #30ba8f;
}

input#submit, input#reset { 
	border: none;
  color: white;
	margin: 2em 0;
	width: auto;
	background-color: #30ba8f;
	padding: 0.5em 1em;
	font-size: 1em;
	cursor: pointer;
	display: inline;
	font-family: Simplifica, sans-serif;
	opacity: 0.8;
}

input#reset {
	float: right;
	clear: after;
}

#form #submit:hover, #reset:hover {
	background-color: #30ba8f;
	opacity: 1;
}

#form #submit:focus, #reset:focus {
	background-color: #43cea3;
	outline: none;
	opacity: 1;
}

#success {
	width: 250px;
	margin: 0 auto;
	background-color: #30ba8f;
	text-align: center;
	padding: 1em;
	color: white;
	font-size: 1.2em;
	display: none;
}


</style>
<script>
var app = angular.module('myApp', []);

	  
app.controller('axajCtrl',['$http','$scope',function($http,$scope){ 
    $http.get('ProductController?action=Add_To_Cart').success(function(response){ //make a get request to mock json file.
        $scope.data = response; //Assign data received to $scope.data
        console.log(response);
    })
    .error(function(err){
        //handle error
    })
}]);

	
</script>

 <div class="container-navbar col-lg-12 col-md-12" style="width:100%;padding:0px;">

      <!-- Static navbar -->
      <nav class="navbar navbar-inverse" style="margin-bottom:0px;padding-top:10px;padding-bottom:10px;">
        <div class="container-navbar-fluid">
          <div class="navbar-header col-lg-3 col-md-3">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
              <a href="index.jsp" class="logo"><span style="color:#2F889A;">Aricent</span><span>Kraft</span></a>
          </div>
          <div id="navbar" class="navbar-collapse collapse col-md-offset-1 col-lg-offset-1">
            <ul class="nav navbar-nav">
              <li class="active"><a href="index.jsp">Home</a></li>
              <li><a href="#">About</a></li>
              <li><a href="#">Contact</a></li>
              <li class="dropdown">
                <div href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color:#eee;">Products <span class="caret"></span></div>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="ProductController?action=get_products_by_category&category=Beds">Beds</a></li>
                  <li><a href="ProductController?action=get_products_by_category&category=Beanbags">Bean Bags</a></li>
                  <li><a href="ProductController?action=get_products_by_category&category=Coffee_and_Centre_Tables">Coffee and Center Tables</a></li>
                  <li><a href="ProductController?action=get_products_by_category&category=Sofas">Sofas</a></li>
                  <li><a href="ProductController?action=get_products_by_category&category=TV_Cabinets">TV Cabinets</a></li>
                   <li><a href="ProductController?action=get_products_by_category&category=Collapsible_Wardrobes">Collapsible Wardrobes</a></li>
                </ul>
              </li>
            </ul>
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility            
String email= null;

if((email = (String)request.getSession().getAttribute("email")) != null)
	{
	Object number = request.getSession().getAttribute("items");
	int count =(Integer)number;
	
 %>
 <ul class="nav navbar-nav navbar-right">
 <c:set var="count" value="<%= count %>"/> 
                  <!-- inbox dropdown start-->
              <li id="header_inbox_bar">
                  <a href="ProductController?action=getMyCart&email=<%= email%>">
                      <i class="fa fa-shopping-cart"></i>
                      <span id="cart-item-count" class="badge bg-important product-count"><c:out value="${count}" /></span>
                  </a>
                  <ul ng-controller='axajCtrl' class="dropdown-menu extended inbox">
                      <div class="notify-arrow notify-arrow-red"></div>
                     
                      

                      <li ng-repeat="item in data">
                          <a href="#">
                              <span class="photo"><img alt="avatar" ng-src="{{item.product_image}}" style="width:35px;height:35px;"></span>
                                    <span class="subject">
                                    <span class="from"><{{item.product_name}}</span>
                                    <span class="time">{{item.product_price}}</span>
                                    </span>
                                    <span class="message">
                                       
                                    </span>
                          </a>
                      </li>
                      <a class="btn btn-success" href="">Checkout</a>
                     <li>
                          <p class="red">You have <span id="cart-item-count">0</span>items in cart.</p>
                      </li>
                  
                  </ul>
              </li>
 
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span>
                        <strong><%= email %></strong>
                        <span class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="navbar-login">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <p class="text-center">
                                            <span class="glyphicon glyphicon-user icon-size"></span>
                                        </p>
                                    </div>
                                    <div class="col-lg-8">
                                        <p class="text-left"><strong>Username</strong></p>
                                        <p class="text-left small"><%= email %></p>
                                        <p class="text-left">
                                            <a href="#" class="btn btn-primary btn-block btn-sm">Edit Profile</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="navbar-login navbar-login-session">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <p>
                                            <a href="UserController?method=get&action=logout" class="btn btn-danger btn-block">Logout</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
 <% 
	}		
else{
	
	%>
            <ul style="margin-left:-100px;" class="main-nav navbar-nav navbar-right">
             <li><a class="cd-signin" style="color:#FFF;" href="#0">Login</a></li>
              <li><a class="cd-signup" style="color:#FFF;" href="#0">Register</a></li>
            </ul>
            <div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container"> <!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="#0">Sign in</a></li>
				<li><a href="#0">New account</a></li>
			</ul>

			<div id="cd-login"> <!-- log in form -->
				<form class="cd-form" action=<%=response.encodeURL("UserController?action=doLogin")%> method="post">
					<p class="fieldset">
						<label class="image-replace cd-email" for="signin-email">E-mail</label>
						<input class="full-width has-padding has-border" id="signin-email" name="email" type="email" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">Password</label>
						<input class="full-width has-padding has-border" id="signin-password" name="psw" type="text"  placeholder="Password">
						<a href="#0" class="hide-password">Hide</a>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="remember-me" checked>
						<label for="remember-me">Remember me</label>
					</p>

					<p class="fieldset">
						<input class="full-width" type="submit" value="Login">
					</p>
				</form>
				
				<p class="cd-form-bottom-message"><a href="#0">Forgot your password?</a></p>
				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div> <!-- cd-login -->

			<div id="cd-signup"> <!-- sign up form -->
				<form id="signup-form" class="cd-form" action=<%=response.encodeURL("UserController?action=doRegister")%> method="post">
					
					<p class="fieldset">
						<label for="fname" class="image-replace cd-username">FirstName *</label>
						<input name="First_Name" type="text" id="fname" class="full-width has-padding has-border required">
					    <div id="errFName" class="errorText"></div>
					</p>
					
					
						
						
					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">LastName *</label>
						<input  name="Last_Name" class="full-width has-padding has-border required" id="lname" type="text" placeholder="Last Name"/>
						<div id="errLName" class="errorText"></div>
					</p>
					
					
					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">Username *</label>
						<input  name="UserName" class="full-width has-padding has-border required" id="username" type="text" placeholder="Username" />
						<div id="errUName" class="errorText"></div>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-email">E-mail *</label>
						<input name="Email" class="full-width has-padding has-border required" name="emailBlur" id="email" type="email" placeholder="E-mail">
						<div id="errEmail" class="errorText"></div>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Password</label>
						<input name="psw" class="full-width has-padding has-border required" id="password" type="text"  placeholder="Password">
						<a href="#0" class="hide-password">Hide</a>
						<span class="cd-error-message">Error message here!</span>
					</p>
                    
                    <p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Confirm Password</label>
						<input name="psw-repeat" class="full-width has-padding has-border" id="signup-password" type="text"  placeholder="Confirm Password">
						<a href="#0" class="hide-password">Hide</a>
						<span class="cd-error-message">Error message here!</span>
					</p>
					
					

					<p class="fieldset">
						<input class="full-width has-padding" id="submit" class="submit" type="submit" value="Create account">
					</p>
				</form>

				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div> <!-- cd-signup -->

			<div id="cd-reset-password"> <!-- reset password form -->
				<p class="cd-form-message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>

				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-email" for="reset-email">E-mail</label>
						<input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="Reset password">
					</p>
				</form>

				<p class="cd-form-bottom-message"><a href="#0">Back to log-in</a></p>
			</div> <!-- cd-reset-password -->
			<a href="#0" class="cd-close-form">Close</a>
		</div> <!-- cd-user-modal-container -->
	</div> <!-- cd-user-modal -->
      
      
            
 <% 
}
%>            
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
      
      </div>
<script src="js/navbar.js"></script>
      <script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>
  <script src="http://www.atlasestateagents.co.uk/javascript/tether.min.js"></script>
 <script src="js/header.js" ></script> 
 <script src="js/bootstrap.min.js"></script>
<script>
var validateEmail = function(elementValue) {
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return emailPattern.test(elementValue);
}
    
$('#email').keyup(function() {

    var value = $(this).val();
    var valid = validateEmail(value);

    if (!valid) {
        $(this).css('color', 'red');
        
    } else {
        $(this).css('color', '#5EBA7D');
       
    }

});

window.onload = init;
window.onsubmit = onSubmit;

function init() {
	setControls();
	//selectFocus();
}

//Checking all fields before submitting form
function onSubmit(){
	var result = true;
	result = checkFirstName() && result;
	result = checkLastName() && result;
	result = checkHan() && result;
	result = checkEmail() && result;
	result = checkPhone() && result;
	return result;
}

//Reset default texts and hide error messages on resetting form
window.onreset = function(e){
	init();
	e.preventDefault();
};

function hideErrors(){
	var errorElem = document.getElementsByClassName('errorText');
	for (var i=0; i<errorElem.length; i++) {
		errorElem[i].style.display = 'none';
	}
}

//Set default texts and validation functions
function setControls() {
	//Populating the array with objects 
	//containing default texts and corresponding validation functions
	var setupArray = [
		 {
		 	defaultText: 'Enter your first name',
		    validate: checkFirstName 
		 },
		 {
		 	defaultText: 'Enter your last name',
			validate: checkLastName
		 },
		 {
			 	defaultText: 'Enter your username',
				validate: checkUserName
	     },
		 {
			 defaultText: 'Enter your email address',
			 validate: checkEmail
		 }
	];
	
// Set required fields
	var requiredFields = document.getElementsByClassName('required');
	//Displaying default text in each field
	for (var i=0; i<requiredFields.length; i++) {
		requiredFields[i].value = setupArray[i].defaultText;
		requiredFields[i].style.color = '#a8a8a8';
		requiredFields[i].style.fontStyle = 'italic';
		
		// Assigning each object to the corresponding field 
		requiredFields[i].setupObject = setupArray[i];
		
		requiredFields[i].onfocus = function() {
			if (this.value === this.setupObject.defaultText) {
				this.value = '';
				this.style.color = '#000';
				this.style.fontStyle = 'normal';
			}
		} //end focus
		requiredFields[i].onblur = function() {
			if (this.value === '') {
				this.value = this.setupObject.defaultText;
				this.style.color = '#a8a8a8';
				this.style.fontStyle = 'italic';
			}
			this.setupObject.validate();
		} //end blur
	} //end for loop
	
// Set phone field
	var phoneField = document.getElementById('phone');
	phoneField.value = '';
	phoneField.onblur = checkPhone;
	
	hideErrors();
} //end setup

// Set focus on first field
function selectFocus () {
	var firstElem = document.getElementById('fname');
	firstElem.focus();
} //end focus

// Validation functions
function checkFirstName() {
	var fName = document.getElementById('fname');
	var errFName = document.getElementById('errFName');
	if (fName.value === '' || fName.value === 'Enter your first name') {
		errFName.innerHTML='Please enter your first name';
		errFName.style.display='block';
		return false;
	} else {
		errFName.style.display='none';
	}
	return true;
}

function checkLastName(){
	var lName = document.getElementById('lname');
	var errLName = document.getElementById('errLName');
	if (lName.value === '' || lName.value === 'Enter your last name') {
		errLName.innerHTML='Please enter your last name';
		errLName.style.display='block';
		return false;
	} else {
		errLName.style.display='none';
	}
	return true;
}

function checkUserName(){
	var uName = document.getElementById('username');
	var errUName = document.getElementById('errUName');
	if (uName.value === '' || uName.value === 'Enter your last name') {
		errUName.innerHTML='What do you like us to call you?';
		errUName.style.display='block';
		return false;
	} else {
		errUName.style.display='none';
	}
	return true;
}

function checkEmail(){
	var email = document.getElementById('email');
	var emailRegex = /[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}/;
	var errEmail = document.getElementById('errEmail');
	if (email.value === '' || email.value === 'Enter your email address') {
		errEmail.innerHTML='Please enter your email address';
		errEmail.style.display='block';
		return false;
	} else if (!emailRegex.test(email.value)) {
		errEmail.innerHTML='Please enter a valid email address'
		errEmail.style.display='block';
		return false;
	} else {
		errEmail.style.display='none';
	}
	return true;
}

function checkPhone(){
	var phone = document.getElementById('phone');
	var cleared = phone.value.replace(/[\(\)\.\-\ ]/g, '');
	var phoneRegex = /^(\+44\s?7\d{3}|\(?07\d{3}\)?)\s?\d{3}\s?\d{3}$/;
	var errPhone = document.getElementById('errPhone');
	if (phone.value != '' && !phoneRegex.test(cleared)) {
		errPhone.innerHTML='Please enter a valid phone number';
		errPhone.style.display='block';
		return false;
	}
	else {
		errPhone.style.display='none';
	}
	return true;
}

var result = $("#password-strength");

$('#password').keyup(function(){
    $(".bar-text").html(checkStrength($('#password').val()))
})  

function checkStrength(password){

//initial strength
var strength = 0

if (password.length == 0) {
    result.removeClass()
    return ''
}
//if the password length is less than 7, return message.
if (password.length < 9) {
    result.removeClass()
    result.addClass('normal')
    return 'Normal'
}

//length is ok, lets continue.

//if length is 8 characters or more, increase strength value
if (password.length > 9) strength += 1

//if password contains both lower and uppercase characters, increase strength value
if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/))  strength += 1

//if it has one special character, increase strength value
if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/))  strength += 1

//if it has two special characters, increase strength value
if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,",%,&,@,#,$,^,*,?,_,~])/)) strength += 1

//now we have calculated strength value, we can return messages

//if value is less than 2
if (strength < 2) {
    result.removeClass()
    result.addClass('medium')
    return 'Medium'
} else if (strength == 2 ) {
    result.removeClass()
    result.addClass('strong')
    return 'Strong'
} else {
    result.removeClass()
    result.addClass('vstrong')
    return 'Very Strong'
}
}
});


</script>
