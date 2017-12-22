/***********************************************************************
                         Aricent Technologies Proprietary
 
This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies
 
           File Name					:ProductDaoImplementation.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :25-June-2017
           Description                  :class containing methods implementing ProductDao
 
 
           Change History
 
           Version                      :1.0
           Date(DD/MM/YYYY)             :25-June-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version
 
 ***********************************************************************/
package org.aricent.dao_implementation;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;

import java.util.List;

import org.aricent.dao.ProductDao;
import org.aricent.model.Brand;
import org.aricent.model.Cart;
import org.aricent.model.Categor;
import org.aricent.model.Order;
import org.aricent.model.OrderDetails;
import org.aricent.model.Product;
import org.aricent.utility.DbUtility;

/**
 *	class containing methods implementing ProductDao
 *	@see ProductDaoImplementation
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *    @since 25-June-2017
 */

public class ProductDaoImplementation implements ProductDao {

	static Connection currentConn = null;
	PreparedStatement ps = null;
	private Product product;

	/**
	 * ProductDaoImplementation default constructor
	 */
	public ProductDaoImplementation() {

		currentConn = DbUtility.getConnection();
	}

	/**
	 *	adds products into the database
	 *  
	 *	@param product
	 *  @return status 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 25-June-2017
	 */

	public int addProduct(Product product) throws SQLException {
		PreparedStatement p = currentConn
				.prepareStatement("insert into products(product_name,product_category,product_desc,quantity,price,discount,image_path,actual_price) values (?,?,?,?,?,?,?,?)");

		p.setString(1,product.getProduct_name());
		p.setString(2, product.getProduct_category());
		p.setString(3 , product.getProduct_description());
		p.setInt(4, product.getQuantity());
		p.setDouble(5, product.getPrice());
		p.setInt(6, product.getDiscount());
		p.setString(7,product.getImage_path());
		p.setDouble(8, product.getActualPrice());
		int status = p.executeUpdate();

		p.close();

		return status;
	}
	
	/**
	 *	method to return product id from product name
	 *  
	 *	@param product
	 *  @return status 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 25-June-2017
	 */
	public int getProductIDFromName(String name) throws SQLException {
		//Connection conn = Database.getInstance().getConnection();

		PreparedStatement p = currentConn 
				.prepareStatement("select * from product where name = ?");

		p.setString(1,name);

		ResultSet rs = p.executeQuery();

		rs.next();

		int id = rs.getInt("Id");

		p.close();

		return id;
	}
	/**
	 *	method to update product quantity in user cart and also the value in product table
	 *  
	 *	@param product_id
	 *	@param user_id
	 *  @return void 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 25-June-2017
	 */
	public void productQty(int product_id, long user_id) throws SQLException{
		Product p = null;
		Cart c;
		int flag=0;
		PreparedStatement ps = currentConn.prepareStatement("SELECT * FROM products where product_id= ?");
		ps.setInt(1, product_id);

		 ResultSet rs = ps.executeQuery();
		 while(rs.next()){
		      p = new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getDouble(7),rs.getInt(8),rs.getString(9));
		      
		 }
		 PreparedStatement ps3 = currentConn.prepareStatement("select * from cart where product_id = ? and user_id = ?");
		 ps3.setInt(1, product_id);
		 ps3.setLong(2, user_id);
		 
		 ResultSet rs3 = ps3.executeQuery();
		 if(rs3.next()!=false){
		     int newQuantity = rs3.getInt(5)+1;
		     PreparedStatement ps4 = currentConn.prepareStatement("UPDATE cart SET product_quantity = ? WHERE product_id = ? and user_id = ?");
		     ps4.setDouble(1, newQuantity);
		     ps4.setInt(2, product_id);
		     ps4.setLong(3, user_id);
		     
		     ps4.executeUpdate();
		     flag=1;
		 }
		 if(p!=null){
		 p.setQuantity(p.getQuantity()-1);
		 PreparedStatement ps2 = currentConn.prepareStatement("UPDATE products SET quantity = ? WHERE product_id = ?");
		 ps2.setInt(1, p.getQuantity());
		 ps2.setInt(2, p.getProduct_id());
		 
		 ps2.executeUpdate();
		 }
		    if(flag!=1){
		 PreparedStatement ps1 = currentConn.prepareStatement("insert into cart (user_id,product_id,product_name,product_quantity,product_price,product_image) values (?,?,?,?,?,?)");
		 ps1.setLong(1, user_id);
		 ps1.setInt(2, p.getProduct_id());
		 ps1.setString(3, p.getProduct_name());
		 ps1.setInt(4, 1);
		 ps1.setDouble(5, p.getPrice());
		 ps1.setString(6, p.getImage_path());
		 ps1.executeUpdate();
		 
		    }
		}
	/**
	 *	method to return the list of products
	 *  
	 *  @return products 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 25-June-2017
	 */
	public List<Product> getProducts() throws SQLException {
		List<Product> products = new ArrayList<Product>();      
		PreparedStatement pstmt = currentConn.prepareStatement("SELECT * FROM products");

		ResultSet rs =pstmt.executeQuery();


		while(rs.next())
		{

			product = new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getDouble(7),rs.getInt(8),rs.getString(9));
			products.add(product);

		}

		return products;
	}
	
	/**
	 *	method to get user cart
	 *  
	 *	@param user_id
	 *  @return cartList 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 25-June-2017
	 */
     
	public List<Cart> getCart(long user_id) throws SQLException {
		List<Cart> cartList = new ArrayList<Cart>();
		Cart c;
	
		PreparedStatement pstmt = currentConn.prepareStatement("SELECT * FROM cart where user_id = ?");
		pstmt.setLong(1, user_id);
		ResultSet rs =pstmt.executeQuery();

		while(rs.next())
		{
		    
		    c = new Cart(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getDouble(6),rs.getString(7));
		    cartList.add(c);
		    
		    
		}

		return cartList;
		}
	/**
	 *	method to place order and return order list
	 *  
	 *	@param user_id
	 *  @return List<Cart> 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 25-June-2017
	 */
	
	public List<Cart> placeOrder(long user_id) throws SQLException {
        int orderId=0;
		Cart c = new Cart();
		 List<Cart> tempList = new ArrayList<Cart>(); 
		Cart t;
		double amount = 0;
		double shipping = 150;
		double delivery = 100;
		PreparedStatement ps = currentConn.prepareStatement("SELECT * FROM cart where user_id = ?");
		ps.setLong(1, user_id);
		ResultSet rs = ps.executeQuery();
		
		java.sql.Date date = getCurrentDatetime();
		
		Order order = new Order(date,user_id,amount);
		
		PreparedStatement ps1 = currentConn.prepareStatement("insert into orders(order_date,user_id,gross_amount) values (?,?,?)");
		
		 ps1.setDate(1, date);
	     ps1.setLong(2, order.getUserId());
	     ps1.setDouble(3, amount);
	     
	     ps1.executeUpdate();
	     
	     
	     PreparedStatement ps3 = currentConn.prepareStatement("SELECT * FROM orders where user_id = ?");
			ps3.setLong(1, user_id);
			ResultSet rs1 = ps3.executeQuery();
	     while(rs1.next()){
	    	 orderId=rs1.getInt(1);
	    	 
	     }
	     order.setOrderId(orderId);
	     
		while(rs.next()){
			PreparedStatement ps2 = currentConn.prepareStatement("insert into order_details (order_id,user_id,product_id,product_name,product_price,product_quantity) values (?,?,?,?,?,?)");
			
			
			ps2.setInt(1, order.getOrderId());
			ps2.setLong(2, order.getUserId());
			ps2.setInt(3, rs.getInt(3));
			ps2.setString(4, rs.getString(4));
			double price = rs.getDouble(6)*rs.getInt(5);
			ps2.setDouble(5, rs.getDouble(6));
			ps2.setInt(6, rs.getInt(5));
			amount = amount + price;
			
			ps2.executeUpdate();
			t = new Cart(1,user_id,rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getDouble(6),rs.getString(7));
		    tempList.add(t);
		}
		
		System.out.println(tempList);
		amount = amount + shipping + delivery;
		System.out.println(order);
		
		PreparedStatement ps6 = currentConn.prepareStatement("UPDATE orders SET gross_amount = ? WHERE order_id = ?");

		ps6.setDouble(1,amount );

		ps6.setInt(2,order.getOrderId());
		 
		 ps6.executeUpdate();
	
		PreparedStatement  ps2 = currentConn.prepareStatement("DELETE from cart WHERE user_id = ?");
		    ps2.setLong(1, user_id);
		    
		    ps2.executeUpdate();

		return tempList;
		}
	
	/**
	 *	method to get the current date
	 *  
	 *  @return java.sql.Date 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 25-June-2017
	 */
	public java.sql.Date getCurrentDatetime() {
	    java.util.Date today = new java.util.Date();
	    return new java.sql.Date(today.getTime());
	}
	/**
	 *	method to get the order date
	 *  
	 *	@param id
	 *  @return Date 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 26-June-2017
	 */
	public Date getOrderDate(String id) throws SQLException{
    
		Date date=null;
		String sql = "SELECT * FROM orders where order_id ="+id;
		
		Statement st=currentConn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{
			date=rs.getDate(2);
		}
		
		return date;
	}
	/**
	 *	method to search products by productId
	 *  
	 *	@param productId
	 *  @return Product 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 26-June-2017
	 */
	public Product getProduct(int productId) throws SQLException{
		Product prod = null;
		
		String sql = "SELECT * FROM products where product_id ="+productId;
		
		Statement st=currentConn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{
			 prod = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4),
				rs.getString(5),rs.getInt(6),
				rs.getDouble(7),rs.getInt(8),rs.getString(9));
		}
		
		
//		while(rs.next()){
//
//			
//
//		}
        System.out.println(prod);
		return prod;

	}
	/**
	 *	method to get the number of items in the cart
	 *  
	 *	@param userId
	 *  @return int 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 26-June-2017
	 */ 
	public int getNumberOfItemsInCart(long userId) throws SQLException{
		
		
      String sql = "SELECT * FROM cart where user_id ="+userId;
		
		Statement st=currentConn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		
		int count = 0;

		while (rs.next()) {
		    ++count;
		    // Get data from the current row and use it
		}

		return count;
	}
	
	/**
	 *	method to delete the product
	 *  
	 *	@param productId
	 *  @return void
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 26-June-2017
	 */	
	public void deleteProduct(int productId) throws SQLException{
		String deleteSQL = "DELETE DBUSER WHERE product_id = ?";
		ps = currentConn.prepareStatement(deleteSQL);
		ps.setInt(1, productId);

		ps.executeUpdate();

	}
	/**
	 *	method to search products by name
	 *  
	 *	@param pname
	 *  @return Product
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 25-June-2017
	 */
	public Product getProductByName(String pname) 
	{

		try {
			PreparedStatement s = currentConn.prepareStatement("select * from products where product_name = ?");
			
			s.setString(1,pname);  
			ResultSet rs=s.executeQuery();  
			
			while(rs.next())
			{
				
				Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4),
						rs.getString(5),rs.getInt(6),
						rs.getDouble(7),rs.getInt(8),rs.getString(9));

		   }
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
		
	}
	/**
	 *	method to get the brand list
	 *  
	 *	@param user_id
	 *  @return List<Brand> 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 26-June-2017
	 */	
	public List<Brand> getbrand() throws SQLException {
		List<Brand> brands = new ArrayList<Brand>();
		PreparedStatement pstmt = currentConn.prepareStatement("SELECT * FROM brand");
		Brand brand ;

		ResultSet rs =pstmt.executeQuery();


		while(rs.next())
		{

			brand = new Brand(rs.getInt(1),rs.getString(2));
			brands.add(brand);

		}

		return brands;
	}
	/**
	 *	method to delete products from user cart
	 *  
	 *	@param user_id
	 *	@param product_id
	 *  @return List<Cart> 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 26-June-2017
	 */	
	public List<Cart> getCartAfterDeletion(long user_id,int product_id) throws SQLException{
		int qty = 0;
		int qty1 = 0;
		List<Cart> cartList = new ArrayList<Cart>();
		Cart c;
		PreparedStatement ps4 = currentConn.prepareStatement("select * from cart where user_id = ? and product_id = ? ");
		ps4.setLong(1, user_id);
		ps4.setInt(2, product_id);
		ResultSet rs = ps4.executeQuery();

		while(rs.next()){
		     qty = rs.getInt(5);
		}

		PreparedStatement ps5 = currentConn.prepareStatement("select * from products where product_id = ?  ");

		ps5.setInt(1, product_id);
		ResultSet rs5 = ps5.executeQuery();

		while(rs5.next()){
		     qty1 = rs5.getInt(6);
		}



		PreparedStatement ps6 = currentConn.prepareStatement("UPDATE products SET quantity = ? WHERE product_id = ?");

		ps6.setInt(1, qty+qty1);

		ps6.setInt(2, product_id);
		 
		 ps6.executeUpdate();


		PreparedStatement ps3 = currentConn.prepareStatement("Delete from cart where user_id = ? and product_id = ?");
		ps3.setLong(1, user_id);
		ps3.setInt(2, product_id);

		ps3.executeUpdate();

		cartList = getCart(user_id);



		return cartList;
		}
	/**
	 *	method to get order details of the user
	 *  
	 *	@param user_id
	 *  @return List<OrderDetails> 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 27-June-2017
	 */	
	public List<OrderDetails> getOrderDetails(long user_id) throws SQLException {
		List<OrderDetails> orderList = new ArrayList<OrderDetails>();
		OrderDetails o;
		PreparedStatement pstmt = currentConn.prepareStatement("SELECT * FROM order_details where user_id = ?");
		pstmt.setLong(1, user_id);
		ResultSet rs =pstmt.executeQuery();

		while(rs.next())
		{
		    
		    o = new OrderDetails(rs.getInt(1),rs.getString(2),rs.getLong(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getDouble(7));
		    orderList.add(o);
		    
		}

		return orderList;
		}
	/**
	 *	method to get the products by category
	 *  
	 *	@param user_id
	 *  @return List<Product> 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 25-June-2017
	 */	
	public List<Product> getProductsByCategory(String category_name) throws SQLException {
		List<Product> prod_list = new ArrayList<Product>();      
		PreparedStatement pstmt = currentConn.prepareStatement("SELECT * FROM products WHERE product_category=?");
		pstmt.setString(1, category_name);  
		ResultSet rs =pstmt.executeQuery();


		while(rs.next())
		{

			product = new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getDouble(7),rs.getInt(8),rs.getString(9));
			prod_list.add(product);

		}

		return prod_list;
	}
	/**
	 *	method to get the products of specific brands
	 *  
	 *	@param brand_name
	 *  @return List<Product> 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 27-June-2017
	 */	
	public List<Product> getProductsByBrand(String brand_name) throws SQLException {
		List<Product> prod_list = new ArrayList<Product>();      
		PreparedStatement pstmt = currentConn.prepareStatement("SELECT * FROM products WHERE brand_name=?");
		pstmt.setString(1, brand_name);  
		ResultSet rs =pstmt.executeQuery();


		while(rs.next())
		{

			product = new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getDouble(7),rs.getInt(8),rs.getString(9));
			prod_list.add(product);

		}

		return prod_list;
	}
	/**
	 *	method to get category list
	 *  
	 *  @return List<Categor> 
	 *  @see ProductDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 27-June-2017
	 */
	public List<Categor> getcategory() throws SQLException {
		List<Categor> categories = new ArrayList<Categor>();
		PreparedStatement pstmt = currentConn.prepareStatement("SELECT * FROM categories");
		Categor cat= null;

		ResultSet rs =pstmt.executeQuery();


		while(rs.next())
		{

			cat = new Categor(rs.getInt(1),rs.getString(2));
			categories.add(cat);

		}

		return categories;
	}

}