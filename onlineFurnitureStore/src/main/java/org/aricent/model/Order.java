/***********************************************************************
                         Aricent Technologies Proprietary

This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies

           File Name					:Order.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :22-June-2017
           Description                  :class containing attributes of order class and getter setter methods


           Change History

           Version                      :1.0
           Date(DD/MM/YYYY)             :6-Jan-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version

 ***********************************************************************/
package org.aricent.model;

import java.util.ArrayList;
import java.util.Date;
/**
 *	class containing attributes of order class and getter setter methods
 *	@see Order
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *  @since 22-June-2017
 */

public class Order {


	private int orderId;
	private Date orderDate;
	private long userId;
	private String shippingAddress;
	private double grossTotalAmount;

	private ArrayList<Product> product_list;
	/**
	 * Order constructor with parameters
	 * @param orderDate
	 * @param userId	 
	 * @param grossTotalAmount
	 */
	public Order(Date orderDate, long userId, double grossTotalAmount) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.userId = userId;
		this.grossTotalAmount = grossTotalAmount;

	}


	/**
	 * @return the orderId
	 */
	public int getOrderId() {
		return orderId;
	}



	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	/**
	 * @return the orderDate
	 */
	public Date getOrderDate() {
		return orderDate;
	}

	/**
	 * @param orderDate the orderDate to set
	 */
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
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
	 * @return the shippingAddress
	 */
	public String getShippingAddress() {
		return shippingAddress;
	}

	/**
	 * @param shippingAddress the shippingAddress to set
	 */
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	/**
	 * @return the grossTotalAmount
	 */
	public double getGrossTotalAmount() {
		return grossTotalAmount;
	}

	/**
	 * @param grossTotalAmount the grossTotalAmount to set
	 */
	public void setGrossTotalAmount(double grossTotalAmount) {
		this.grossTotalAmount = grossTotalAmount;
	}


	/**
	 * @return the product_list
	 */
	public ArrayList<Product> getProduct_list() {
		return product_list;
	}

	/**
	 * @param product_list the product_list to set
	 */
	public void setProduct_list(ArrayList<Product> product_list) {
		this.product_list = product_list;
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}








}
