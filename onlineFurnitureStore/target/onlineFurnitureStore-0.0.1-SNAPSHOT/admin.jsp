<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
                        <a class="header-menu-tab" href="#1"><span class="icon entypo-cog scnd-font-color"></span>Settings</a>
                    </li>
                    <li>
                        <a class="header-menu-tab" href="#2"><span class="icon fontawesome-user scnd-font-color"></span>Account</a>
                    </li>
                    <li>
                        <a class="header-menu-tab" href="#3"><span class="icon fontawesome-envelope scnd-font-color"></span>Messages</a>
                        <a class="header-menu-number" href="#4">5</a>
                    </li>
                    <li>
                        <a class="header-menu-tab" href="#5"><span class="icon fontawesome-star-empty scnd-font-color"></span>Favorites</a>
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
            <div class="col-md-4 col-lg-4 col-sm-4">
            <!-- LEFT-CONTAINER -->
            <div class="left-container container">
                <div class="menu-box block"> <!-- MENU BOX (LEFT-CONTAINER) -->
                    <h2 class="titular">MENU BOX</h2>
                    <ul class="menu-box-menu">
                         <li>
                            <a class="menu-box-tab" href="AdminController?action=viewAllCategory"><span class="icon fontawesome-envelope scnd-font-color"></span>View All Categories</a>                            
                        </li>
                         <li>
                            <a class="menu-box-tab" href="AdminController?action=viewAllBrands"><span class="icon fontawesome-envelope scnd-font-color"></span>View All Brands</a>                            
                        </li>
                        <li>
                            <a class="menu-box-tab" href="AdminController?action=view_all_products"><span class="icon fontawesome-envelope scnd-font-color"></span>View All Products</a>                            
                        </li>
                        <li>
                            <a class="menu-box-tab" href="AdminController?action=view_users"><span class="icon entypo-paper-plane scnd-font-color"></span>View All Users</a>                            
                        </li>
                        <li>
                            <a class="menu-box-tab" href="#10"><span class="icon entypo-calendar scnd-font-color"></span>Add Product</a>                            
                        </li>
                                  
                    </ul>
                </div>
              </div>  
            </div>
            <div class="col-md-4 col-lg-4 col-sm-4" style="float:left">    
            <!-- MIDDLE-CONTAINER -->
            <div class="middle-container container">
                <div class="profile block"> <!-- PROFILE (MIDDLE-CONTAINER) -->
                    <a class="add-button" href="#28"><span class="icon entypo-plus scnd-font-color"></span></a>
                    <div class="profile-picture big-profile-picture clear">
                        <img width="150px" alt="Admin picture" src="images/admin.png" >
                    </div>
                    <h1 class="user-name">Administrator</h1>
                    <div class="profile-description">
                        <p class="scnd-font-color">I am the one who knocks</p>
                    </div>
                    
                </div>
                
              
              
            </div>
           </div>
           <div class="col-md-4 col-lg-4 col-sm-4" style="float:left;">
            <!-- RIGHT-CONTAINER -->
            <div class="right-container container">
                
                
                <div class="calendar-day block"> <!-- CALENDAR DAY (RIGHT-CONTAINER) -->
                    <div class="arrow-btn-container">
                        <a class="arrow-btn left" href="#200"><span class="icon fontawesome-angle-left"></span></a>
                        <h2 class="titular">WEDNESDAY</h2>
                        <a class="arrow-btn right" href="#201"><span class="icon fontawesome-angle-right"></span></a>
                    </div>
                        <p class="the-day">26</p>
                        <a class="add-event button" href="#27">ADD User</a>
                </div>
                           </div> <!-- end right-container -->
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
<script type="text/javascript">
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();

if(dd<10) {
    dd = '0'+dd
} 

if(mm<10) {
    mm = '0'+mm
} 

today = mm + '/' + dd + '/' + yyyy;

document.getElementsByClassName("the-day").innerHtml= dd;
</script>
</body>
</html>