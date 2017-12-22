/***********************************************************************
                         Aricent Technologies Proprietary
 
This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies
 
           File Name					:AdminController.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :29-June-2017
           Description                  :controller fetching admin request and redirecting it to suitable Dao implementation
 
 
           Change History
 
           Version                      :1.0
           Date(DD/MM/YYYY)             :29-June-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version
 
 ***********************************************************************/
package org.aricent.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.aricent.dao_implementation.ProductDaoImplementation;
import org.aricent.dao_implementation.UserDaoImplementation;
import org.aricent.model.Brand;
import org.aricent.model.Categor;
import org.aricent.model.Product;
import org.aricent.model.User;

/**

Servlet implementation class AdminController
*/
public class AdminController extends HttpServlet {


private static final long serialVersionUID = 1L;

public AdminController() {


}

/**

@see HttpServlet#HttpServlet()
*/
/**
 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	if(request.getParameter("action").equals("viewAllCategory")){ 
		
		List<Categor> cat_list = new ArrayList<Categor>();
		ProductDaoImplementation pro = new ProductDaoImplementation();
		try {
			cat_list = pro.getcategory();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("category_list",cat_list);
		request.getRequestDispatcher("categories.jsp").forward(request, response);
	}
	else if(request.getParameter("action").equals("viewAllBrands")){ 
		
		List<Brand> brand_list = new ArrayList<Brand>();
		ProductDaoImplementation pro = new ProductDaoImplementation();
		try {
			brand_list = pro.getbrand();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("brand_list",brand_list);
		request.getRequestDispatcher("brands.jsp").forward(request, response);
	}
	
	 else if(request.getParameter("action").equalsIgnoreCase("view_users")){
    	 UserDaoImplementation use = new UserDaoImplementation();
         List<User> userList = new ArrayList<User>();
         try {
             userList=use.getUsers();
             request.setAttribute("userList", userList);
             request.getRequestDispatcher("users.jsp").forward(request,response);

         } catch (SQLException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
         }
    }
	 else if(request.getParameter("action").equals("view_all_products")){
	        ProductDaoImplementation pro = new ProductDaoImplementation();
	        List<Product> productList = new ArrayList<Product>();
	        try {
	            productList=pro.getProducts();
	            request.setAttribute("productList", productList);
	             request.getRequestDispatcher("products.jsp").forward(request,response);
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	    }

}

/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    
    if(request.getParameter("action").equals("add_product")){
        Product p = new Product();
        final Part filePart = request.getPart("file");
        final String fileName = getFileName(filePart);
        String Str1 = new String(fileName );
        char[] ch= Str1.toCharArray();
        for(int i=0;i<ch.length;i++){
            if(ch[i]=='\\'){
                ch[i]='/';
            }
        }
        
        String s1 = new String(ch);
        p.setImage_path(Str1);
        
        String productName = request.getParameter("product_name");
        p.setProduct_name(productName);
        String productCategory = request.getParameter("product_category");
        p.setProduct_category(productCategory);
        String productDescription = request.getParameter("product_description");
        p.setProduct_description(productDescription);
        String productPrice = request.getParameter("product_price");
        p.setPrice(Double.parseDouble(productPrice));
        String productQuantity = request.getParameter("product_quantity");
        p.setQuantity(Integer.parseInt(productQuantity));
        String productDiscount = request.getParameter("product_discount");
        p.setDiscount(Integer.parseInt(productDiscount));
        ProductDaoImplementation pro = new ProductDaoImplementation();
        try {
            pro.addProduct(p);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    
    if(request.getParameter("action").equals("delete_product")){
        Product p = new Product();
        String productId = request.getParameter("product_id");
        p.setProduct_id(Integer.parseInt(productId));
        ProductDaoImplementation pro = new ProductDaoImplementation();
        try {
            pro.deleteProduct(p.getProduct_id());
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }           
    }
   
    
    
    
}
private String getFileName(final Part part) {
    final String partHeader = part.getHeader("content-disposition");
    
    for (String content : part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(content.indexOf('=') + 1).trim()
                    .replace("\"", "");
        }
    }
    return null;
}

}