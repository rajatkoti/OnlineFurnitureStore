/***********************************************************************
                         Aricent Technologies Proprietary

This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies

           File Name					:Brand.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :22-June-2017
           Description                  :class containing brand attributes


           Change History

           Version                      :1.0
           Date(DD/MM/YYYY)             :22-June-2017
           Modified by               	:GR_TH3_JAVA_5
           Description of change        :Initial Version

 ***********************************************************************/
package org.aricent.model;
/**
 *	class containing brand attributes
 *	@see Brand
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *    @since 22-June-2017
 */

public class Brand {

	private int brand_id;
	private String brand_name;

	/**
	 * Brand constructor with parameters
	 * @param brand_id
	 * @param brand_name  	
	 */
	public Brand(int brand_id, String brand_name) {

		this.brand_id = brand_id;
		this.brand_name = brand_name;
	}

	/**
	 * @return the brand_id
	 */
	public int getBrand_id() {
		return brand_id;
	}

	/**
	 * @param brand_id the brand_id to set
	 */
	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}

	/**
	 * @return the brand_name
	 */
	public String getBrand_name() {
		return brand_name;
	}

	/**
	 * @param brand_name the brand_name to set
	 */
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}





}