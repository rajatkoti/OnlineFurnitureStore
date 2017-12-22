/***********************************************************************
                         Aricent Technologies Proprietary

This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies

           File Name					:OrderDetails.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :22-June-2017
           Description                  :class containing order details attributes and getter setter methods


           Change History

           Version                      :1.0
           Date(DD/MM/YYYY)             :22-June-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version

 ***********************************************************************/
package org.aricent.model;
/**
 *	class containing order details attributes and getter setter methods
 *	@see OrderDetails
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *    @since 22-June-2017
 */

public class OrderDetails {

	private int id;
	private String orderId;
	private long userId;
	private int productId;
	private String productName;
	private int productQuanity;
	private double productPrice;
	/**
	 * OrderDetails constructor with parameters
	 * @param id
	 * @param orderId 	 
	 * @param userId
	 * @param productId 
	 * @param productName 
	 * @param productQuanity 
	 * @param productPrice 	
	 */	
	public OrderDetails(int id, String orderId, long userId, int productId, String productName, int productQuanity,
			double productPrice) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.userId = userId;
		this.productId = productId;
		this.productName = productName;
		this.productQuanity = productQuanity;
		this.productPrice = productPrice;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the orderId
	 */
	public String getOrderId() {
		return orderId;
	}
	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	/**
	 * @return the userId
	 */
	public long getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(long userId) {
		this.userId = userId;
	}
	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}
	/**
	 * @param productId the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}
	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}
	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}
	/**
	 * @return the productQuanity
	 */
	public int getProductQuanity() {
		return productQuanity;
	}
	/**
	 * @param productQuanity the productQuanity to set
	 */
	public void setProductQuanity(int productQuanity) {
		this.productQuanity = productQuanity;
	}
	/**
	 * @return the productPrice
	 */
	public double getProductPrice() {
		return productPrice;
	}
	/**
	 * @param productPrice the productPrice to set
	 */
	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}



}
