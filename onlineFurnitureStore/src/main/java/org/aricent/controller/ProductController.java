/***********************************************************************
                         Aricent Technologies Proprietary
 
This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies
 
           File Name					:.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :30-June-2017
           Description                  :controller fetching admin request and redirecting it to suitable Dao implementation
 
 
           Change History
 
           Version                      :1.0
           Date(DD/MM/YYYY)             :30-June-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version
 
 ***********************************************************************/
package org.aricent.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.aricent.dao_implementation.ProductDaoImplementation;
import org.aricent.dao_implementation.UserDaoImplementation;
import org.aricent.model.Brand;
import org.aricent.model.Cart;
import org.aricent.model.Categor;
import org.aricent.model.OrderDetails;
import org.aricent.model.Product;
import org.aricent.model.User;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
/**
 * Servlet implementation class ProductController
 */
@MultipartConfig(maxFileSize = 16177215) 
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 if(request.getParameter("action").equals("viewAll")){
			 
				
				ProductDaoImplementation pro = new ProductDaoImplementation();
				
				
				try {
					 response.setContentType("application/json");
					 response.setCharacterEncoding("utf-8");
					 PrintWriter out = response.getWriter();
					 Random r = new Random();
				     Product[] arr1 = new Product[12];
				     
					 List<Product> pro_list = new ArrayList<Product>();
				     List<Product> tempList = new ArrayList<Product>();
					 pro_list = pro.getProducts();
					 for(int i = 0; i < 12; i++) {
				            arr1[i] = pro_list.get(r.nextInt(pro_list.size()));
				            tempList.add(arr1[i]);
				        }
					 
					 String json = new Gson().toJson(tempList);
					
		             out.write(json);
     
		            
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}catch(Exception e){
					System.out.println(e.getMessage());
				}
				
			}
		
		else if(request.getParameter("action").equals("view_category")){

	          ProductDaoImplementation pro = new ProductDaoImplementation();
	          List<Categor> catList = new ArrayList<Categor>();
	            try {
	                catList=pro.getcategory();
	                request.setAttribute("Category", catList);
	                request.getRequestDispatcher("").forward(request,response);

	            } catch (SQLException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	         
	     }
	    
	     else if(request.getParameter("action").equals("view_brand")){
	         
	          ProductDaoImplementation pro = new ProductDaoImplementation();
	          List<Brand> brandList = new ArrayList<Brand>();
	            try {
	                brandList=pro.getbrand();
	                request.setAttribute("Brand", brandList);
	                request.getRequestDispatcher("").forward(request,response);

	            } catch (SQLException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	         
	     }
		 
	     else if(request.getParameter("action").equals("view_product")){
	    	 
	    	 String s = request.getParameter("id");
	    	 int id = Integer.parseInt(s);
	 		 ProductDaoImplementation obj =new  ProductDaoImplementation();
	 		Product p = null;
	 		
	 		try {
				p=obj.getProduct(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 		request.setAttribute("pr",p);
	 		request.getRequestDispatcher("single.jsp").forward(request,response); 
	 	
	     }
        else if(request.getParameter("action").equals("get_products_by_category")){
	    	 
	    	 String s = request.getParameter("category");
	 		 ProductDaoImplementation obj =new  ProductDaoImplementation();
	 		 List<Product> prod_list = new ArrayList<Product>();
			 
	 		try {
				prod_list=obj.getProductsByCategory(s);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 		request.setAttribute("pr",prod_list);
	 	    request.getRequestDispatcher("category.jsp").forward(request,response); 
	 		
	 	
	     }
        else if(request.getParameter("action").equals("get_products_by_brand")){
	    	 
	    	 String s = request.getParameter("brand");
	 		 ProductDaoImplementation obj =new  ProductDaoImplementation();
	 		 List<Product> prod_list = new ArrayList<Product>();
			 
	 		try {
				prod_list=obj.getProductsByBrand(s);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 		request.setAttribute("pr",prod_list);
	 	    request.getRequestDispatcher("category.jsp").forward(request,response); 
	 		
	 	
	     }
        else if(request.getParameter("action").equals("getMyCart")){
        	User user = null;
        	String s = request.getParameter("email");
        	 ProductDaoImplementation obj =new  ProductDaoImplementation();
        	 UserDaoImplementation u = new UserDaoImplementation();
        	 List<Cart> c_list = new ArrayList<Cart>();
        	 user= u.getUser(s);
        	 try {
				c_list = obj.getCart(user.getUserId());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	 request.setAttribute("cart",c_list);
 	 	    request.getRequestDispatcher("checkout.jsp").forward(request,response); 
        }
		 
        else if(request.getParameter("action").equals("BuyNow")){
			User u = null;
			List<OrderDetails> order_list= null ;
			Date d =null;
			List<Cart> cart_list = null;
			UserDaoImplementation uDao = new UserDaoImplementation();
			ProductDaoImplementation pro = new ProductDaoImplementation();
			String email = request.getParameter("email");
			u=uDao.getUser(email);
			try {
				cart_list=pro.placeOrder(u.getUserId());
				order_list = pro.getOrderDetails(u.getUserId());
				d = pro.getOrderDate(order_list.get(0).getOrderId());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("date",d);
			request.setAttribute("user", u);
			request.setAttribute("cart", cart_list);
			request.setAttribute("order", order_list);
		    request.getRequestDispatcher("invoice.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	
		 if(request.getParameter("action").equals("Add_To_Cart")){
			Product p = new Product();
			List<Cart> cart_list= null ;
			User u = null;
			ProductDaoImplementation pro = new ProductDaoImplementation();
			UserDaoImplementation uDao = new UserDaoImplementation();
			String productId = request.getParameter("p_id");
			String email = request.getParameter("email");
			
			int user_id = 0;
			u = uDao.getUser(email);
			p.setProduct_id(Integer.parseInt(productId));
			try {
			pro.productQty(p.getProduct_id(),u.getUserId());
			cart_list = pro.getCart(u.getUserId());
			request.getSession().setAttribute("cartList", cart_list);
			
			response.setContentType("application/json");
			 response.setCharacterEncoding("utf-8");
			 PrintWriter out = response.getWriter();
			 
			 String json = new Gson().toJson(cart_list);
				
             out.write(json);
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}

			    }
		
		else if(request.getParameter("action").equals("Delete_From_Cart")){
			List<Cart> cart_list= null ;
			User u = null;
			ProductDaoImplementation pro = new ProductDaoImplementation();
			UserDaoImplementation uDao = new UserDaoImplementation();
			int productId = Integer.parseInt(request.getParameter("p_id"));
			String email = request.getParameter("email");
			
			u=uDao.getUser(email);
			try {
				cart_list=pro.getCartAfterDeletion(u.getUserId(), productId);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getSession().setAttribute("cart", cart_list);
			request.setAttribute("cart", cart_list);
			request.getRequestDispatcher("checkout.jsp").forward(request,response); 
		}
		
		
		
	}

	
}
