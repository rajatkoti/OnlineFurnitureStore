/***********************************************************************
                         Aricent Technologies Proprietary
 
This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies
 
           File Name					:UserController.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :1-July-2017
           Description                  :controller fetching user request and redirecting it to suitable Dao implementation
 
 
           Change History
 
           Version                      :1.0
           Date(DD/MM/YYYY)             :1-July-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version
 
 ***********************************************************************/
package org.aricent.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aricent.dao_implementation.ProductDaoImplementation;
import org.aricent.dao_implementation.UserDaoImplementation;
import org.aricent.model.User;



/**
 * Servlet implementation class UserController
 */
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("action").equals("logout")){
			
			
            request.getSession().removeAttribute("email");
            request.getSession().invalidate();
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getParameter("action").equals("doRegister"))
		{
			UserDaoImplementation register = new UserDaoImplementation();
			User u =new User();
			String firstName = request.getParameter("First_Name");
			u.setFirstName(firstName);
			String lastName = request.getParameter("Last_Name");
			u.setLastName(lastName);
			String userName = request.getParameter("UserName");
			u.setUserName(userName);
			String email = request.getParameter("Email");
			u.setEmail(email);
			String password = request.getParameter("psw");
			u.setPassword(password);
			String repeatPassword = request.getParameter("psw-repeat");
			if(u.getFirstName() !=null && u.getLastName() !=null && u.getUserName() !=null && u.getEmail() !=null && u.getPassword() !=null){
			if(password.equalsIgnoreCase(repeatPassword)){
				try {
					if(register.addCustomer(u) == true){
						request.getRequestDispatcher("success.jsp").forward(request,response);
					}
					else{
						request.getRequestDispatcher("index.jsp").forward(request,response);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			  }
			}
			else{
				request.getRequestDispatcher("index.jsp").forward(request,response);
			}
		}
			
		
		else if(request.getParameter("action").equals("doLogin")){
			UserDaoImplementation login = new UserDaoImplementation();
			ProductDaoImplementation pro = new ProductDaoImplementation();
			String email = request.getParameter("email");
			String password = request.getParameter("psw");
			
			try {
				if(login.validateUser(email, password) == true){
					
					 User user = login.getUser(email);
					 int count = pro.getNumberOfItemsInCart(user.getUserId());
					 
					 request.getSession().setAttribute("email", email);
					 request.getSession().setAttribute("items",count);
					 request.setAttribute("user", user);
					if(login.per.equals("2")){
						
					request.getRequestDispatcher("admin.jsp").forward(request,response);
				}
					else{
						
						request.getRequestDispatcher("index.jsp").forward(request,response);
					}
			} else{
				response.getWriter().println("login failed");    
				request.getRequestDispatcher("index.jsp").forward(request,response);
			}
				}catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	}