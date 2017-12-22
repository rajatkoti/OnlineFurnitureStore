/***********************************************************************
                         Aricent Technologies Proprietary
 
This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies
 
           File Name					:ProductDao.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :26-June-2017
           Description                  :interface containing methods related to the product
 
 
           Change History
 
           Version                      :1.0
           Date(DD/MM/YYYY)             :26-June-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version
 
 ***********************************************************************/
package org.aricent.dao;

import java.sql.SQLException;
import java.util.List;

import org.aricent.model.Product;
/**
 *	interface containing methods related to the product
 *	@see ProductDao
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *    @since 26-June-2017
 */

public interface ProductDao {

	public int addProduct(Product product) throws SQLException;
	
	public int getProductIDFromName(String name) throws SQLException;
	public List<Product> getProducts() throws SQLException;
	
	public int getNumberOfItemsInCart(long userId) throws SQLException;
}
