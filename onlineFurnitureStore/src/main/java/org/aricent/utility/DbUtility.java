/***********************************************************************
                         Aricent Technologies Proprietary
 
This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies
 
           File Name					:DbUtility.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :23-June-2017
           Description                  :class to open and close the session from the database
 
 
           Change History
 
           Version                      :1.0
           Date(DD/MM/YYYY)             :23-June-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version
 
 ***********************************************************************/
package org.aricent.utility;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
/**
 *	class to open and close the session from the database
 *	@see DbUtility
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *    @since 23-June-2017
 */

public class DbUtility {
	private static Connection conn;
/**
 *	Method setting connectivity with the database 
 
 *  @return Connection
 *  @see DbUtility 
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *  @since 23-June-2017
 */

	public static Connection getConnection() 
	{
		if( conn != null )
		{
			return conn;
		}

		InputStream inputStream = DbUtility.class.getClassLoader().getResourceAsStream("/Db.properties");
		Properties properties = new Properties();

		try {

			properties.load(inputStream);
			Class.forName("com.mysql.jdbc.Driver"); 
			String url = properties.getProperty("url");
			String user = properties.getProperty("user");
			String password = properties.getProperty("password");

			conn = DriverManager.getConnection( url, user, password );

		} catch (IOException e) {
			e.printStackTrace();
		} catch(ClassNotFoundException e){
			e.getMessage();
		}   catch (SQLException e) {

			e.printStackTrace();
		}

		return conn;
	}

	/**
	 *	Method closing connectivity with the database 
	 
	 *  @return Connection
	 *  @see DbUtility 
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 23-June-2017
	 */
	public static void closeConnection( Connection toBeClosed )
	{
		if(toBeClosed == null)
			return;

		try {

			toBeClosed.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


}

