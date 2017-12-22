/***********************************************************************
                         Aricent Technologies Proprietary

This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies

           File Name					:Cart.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :22-June-2017
           Description                  :contains cart attributes


           Change History

           Version                      :1.0
           Date(DD/MM/YYYY)             :22-June-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version

 ***********************************************************************/
package org.aricent.model;
/**
 *	contains cart attributes
 *	@see Cart
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *    @since 22-June-2017
 */

public class Cart {

	private int cart_id;
	private long userId;
	private int productId;
	private String productName;
	private int productQuantity;
	private Double productPrice;
	private String productImage;
	/**
	 * Cart constructor with parameters
	 * @param cart_id
	 * @param userId	 
	 * @param productId
	 * @param productName
	 * @param productQuantity
	 * @param productPrice
	 * @param productImage
	 */
	public Cart(int cart_id, long userId, int productId, String productName, int productQuantity, Double productPrice,String productImage) {
		super();
		this.cart_id = cart_id;
		this.userId = userId;
		this.productId = productId;
		this.productName = productName;
		this.productQuantity = productQuantity;
		this.productPrice = productPrice;
		this.productImage = productImage;
	}
	/**
	 * Cart default constructor	
	 */
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the cart_id
	 */
	public int getCart_id() {
		return cart_id;
	}
	/**
	 * @param cart_id the cart_id to set
	 */
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
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
	 * @return the productQuantity
	 */
	public int getProductQuantity() {
		return productQuantity;
	}
	/**
	 * @param productQuantity the productQuantity to set
	 */
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	/**
	 * @return the productPrice
	 */
	public Double getProductPrice() {
		return productPrice;
	}
	/**
	 * @param productPrice the productPrice to set
	 */
	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}
	/**
	 * @return the productImage
	 */
	public String getProductImage() {
		return productImage;
	}
	/**
	 * @param productImage the productImage to set
	 */
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Cart [cart_id=" + cart_id + ", userId=" + userId + ", productId=" + productId + ", productName="
				+ productName + ", productQuantity=" + productQuantity + ", productPrice=" + productPrice
				+ ", productImage=" + productImage + "]";
	}
	


}