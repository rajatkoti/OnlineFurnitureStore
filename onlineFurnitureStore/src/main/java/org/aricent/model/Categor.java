/***********************************************************************
                         Aricent Technologies Proprietary

This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies

           File Name					:Categor.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :22-June-2017
           Description                  :contains attributes of categor and getter setter methods


           Change History

           Version                      :1.0
           Date(DD/MM/YYYY)             :22-June-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version

 ***********************************************************************/
package org.aricent.model;
/**
 *	contains attributes of categor and getter setter methods
 *	@see Categor
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *    @since 22-June-2017
 */

public class Categor {

	private int category_id;
	private String category_name;

	/**
	 * Categor constructor with parameters
	 * @param category_id
	 * @param category_name 	 

	 */
	public Categor(int category_id, String category_name) {

		this.category_id = category_id;
		this.category_name = category_name;
	}

	/**
	 * @return the category_id
	 */
	public int getCategory_id() {
		return category_id;
	}

	/**
	 * @param category_id the category_id to set
	 */
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	/**
	 * @return the category_name
	 */
	public String getCategory_name() {
		return category_name;
	}

	/**
	 * @param category_name the category_name to set
	 */
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}



}