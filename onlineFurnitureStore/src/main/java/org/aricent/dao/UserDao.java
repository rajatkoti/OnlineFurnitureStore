/***********************************************************************
                         Aricent Technologies Proprietary
 
This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies
 
           File Name					:UserDao.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :26-June-2017
           Description                  :interface containing methods related to the user
 
 
           Change History
 
           Version                      :1.0
           Date(DD/MM/YYYY)             :26-June-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version
 
 ***********************************************************************/
package org.aricent.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import org.aricent.model.User;
/**
 *	Interface containing methods related to the user
 *	@see UserDao
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *    @since 26-June-2017
 */

public interface UserDao {
	
	public boolean addCustomer(User u) throws SQLException, NoSuchAlgorithmException;
		
	public User getUser(String email);
	
	public boolean validateUser(String email,String password)throws SQLException, NoSuchAlgorithmException;

}
