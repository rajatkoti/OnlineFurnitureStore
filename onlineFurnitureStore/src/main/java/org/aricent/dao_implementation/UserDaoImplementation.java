/***********************************************************************
                         Aricent Technologies Proprietary

This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies

           File Name					:UserDaoImplementation.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :28-June-2017
           Description                  :class implementing the methods of user dao


           Change History

           Version                      :1.0
           Date(DD/MM/YYYY)             :28-June-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version

 ***********************************************************************/
package org.aricent.dao_implementation;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.aricent.dao.UserDao;
import org.aricent.model.User;
import org.aricent.utility.DbUtility;
/**
 *	class implementing the methods of user dao
 *	@see UserDaoImplementation
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *    @since 28-June-2017
 */

public class UserDaoImplementation implements UserDao{
	static Connection currentConn = null;
	static ResultSet rs = null;
	PreparedStatement ps = null;
	public String per;
	public User user;
/**
 * UserDaoImplementation default constructor 
 */
	public UserDaoImplementation() {
		currentConn = DbUtility.getConnection();

	}


/**
 *	method to add customer in the database
 *  
 *	@param u
 *  @return boolean
 *  @see UserDaoImplementation
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *  @since 28-June-2017
 */

	public boolean addCustomer(User u) throws SQLException, NoSuchAlgorithmException {
		boolean flag = false;

		MessageDigest m = MessageDigest.getInstance("MD5");
		m.update(u.getPassword().getBytes(),0,u.getPassword().length());

		String pass = new BigInteger(1,m.digest()).toString(16);
		u.setPassword(pass);
		try {
			ps= currentConn.prepareStatement("Insert into user(first_name,last_name,username,email,password) values(?,?,?,?,?)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ps.setString(1,u.getFirstName());
		ps.setString(2, u.getLastName());
		ps.setString(3, u.getUserName());
		ps.setString(4, u.getEmail());
		ps.setString(5, u.getPassword());


		int count = ps.executeUpdate();
		if(count > 0){
			flag=true;
		}
		else{
			flag=false;
		}

		return flag;

	}
	/**
	 *	method to get customer in the database
	 *  
	 *  @return List<User>
	 *  @see UserDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 28-June-2017
	 */
	public List<User> getUsers() throws SQLException {

		List<User> users = new ArrayList<User>();      
		PreparedStatement pstmt = currentConn.prepareStatement("SELECT * FROM user");
		User u = new User();
		ResultSet rs =pstmt.executeQuery();


		while(rs.next())
		{

			u = new User(rs.getLong(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getInt(10),rs.getInt(11));
			users.add(u);

		}

		return users;

	}

	/**
	 *	method to get user by email id
	 *
	 *  @param email
	 *  @return User
	 *  @see UserDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 28-June-2017
	 */	

	public User getUser(String email) {
		User u = null ;
		try{
			ps= currentConn.prepareStatement("select * from user where email=?");
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			rs.next();

			u = new User(rs.getLong(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),
					rs.getString(8), rs.getString(9),rs.getInt(10),rs.getInt(11));

			ps.close();



		}catch(SQLException e){
			e.printStackTrace();
		}

		return u;
	}

	/**
	 *	method to validate user
	 *  @param email
	 *  @param password
	 *  @return boolean
	 *  @see UserDaoImplementation
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 28-June-2017
	 */	

	public boolean validateUser(String email, String password) throws SQLException, NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		boolean flag=false;
		int permit=1;

		ps= currentConn.prepareStatement("select * from user where email=? AND password=? ");
		MessageDigest m = MessageDigest.getInstance("MD5");
		m.update(password.getBytes(),0,password.length());

		String pass = new BigInteger(1,m.digest()).toString(16);
		ps.setString(1, email);
		ps.setString(2, pass);


		ResultSet rs = ps.executeQuery();
		//		System.out.println(rs.next());
		/*if (rs.next()) {
	        System.out.println(rs.getString(1));
	    }*/
		if (rs.next()) {

			per = rs.getString("permission");

			flag=true;

		}
		else{
			return flag;
		}


		return flag;

	}

}
