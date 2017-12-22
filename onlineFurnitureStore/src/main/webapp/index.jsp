<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.aricent.model.User" %>
<%@ page import="org.aricent.model.Product" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="header.jsp" />
<body class="responsive">

<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
String u = (String) request.getSession().getAttribute("email");

    if (u != null ) {
    	
 %>   	
<div id="wrapper">
<h1>Hey</h1>
<jsp:include page="navbar.jsp" />


<jsp:include page="home.jsp" />

 <% 
	}		
else{
	
	%>
<h1>Shubham</h1>	
<jsp:include page="navbar.jsp" />
 <jsp:include page="front.jsp" />

<% 
}
%> 
    
      <jsp:include page="footer.jsp" />
      </div> 
   </body>
</html>