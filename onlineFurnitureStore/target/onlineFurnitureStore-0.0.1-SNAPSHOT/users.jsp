<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.aricent.model.User" %>    
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
<
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
String email = (String) request.getSession().getAttribute("email");

    if (email != null ) {
    	
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
            <!-- MIDDLE-CONTAINER -->
           <table class="table">
            <tr class="table-header">
                    <th class="cell">User ID</th>
                    <th class="cell">First Name</th>
                    <th class="cell">Last Name</th>
                    <th class="cell">UserName</th>
                    <th class="cell">Email</th>
                    <th class="cell">User Type</th>
                </tr>
           <%
           ArrayList<User> arr= null;
           Object result = request.getAttribute("userList");
           arr = (ArrayList<User>) result;
           
           for(int i=0;i<arr.size();i++) {
           %>
                <tr style="color:#eee;">
                    <td><%= arr.get(i).getUserId()   %></td>
                    <td><%= arr.get(i).getFirstName() %></td>
                    <td><%= arr.get(i).getLastName()  %></td>
                    <td><%= arr.get(i).getUserName() %></td>
                    <td><%= arr.get(i).getEmail()  %></td>
                    <td><% if(arr.get(i).getType() == 2){
                    	%>
                    	Admin<% }
                    	else{
                    	%>Standard User<%} %></td>
                    }
                
                </tr>
              <%
           }
              %> 
            </table>
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