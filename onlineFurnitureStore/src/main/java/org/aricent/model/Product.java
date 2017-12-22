/***********************************************************************
                         Aricent Technologies Proprietary

This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies

           File Name					:Product.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :22-June-2017
           Description                  :class containing product attributes and getter setter methods


           Change History

           Version                      :1.0
           Date(DD/MM/YYYY)             :22-June-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version

 ***********************************************************************/
package org.aricent.model;
/**
 *	class containing product attributes and getter setter methods
 *	@see Product
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *    @since 22-June-2017
 */

public class Product {

	private int product_id;
	private String product_category;
	private String brand_name;
	private String product_name;
	private String product_description;
	private int quantity;
	private double price;
	private int discount;
	private String image_path;
	private double actualPrice;
/**
 * Product default constructor 
 */
	public Product(){

	}
	/**
	 * Product constructor with parameters
	 * @param product_id
	 * @param product_name	 
	 * @param product_category
	 * @param brand_name 
	 * @param product_description
	 * @param quantity	 
	 * @param price
	 * @param discount
	 * @param image_path 		
	 */
	public Product(int product_id,String product_name, String product_category,  String brand_name,
			String product_description, int quantity, double price, int discount, String image_path) {
		super();
		this.product_id = product_id;
		this.product_category = product_category;
		this.brand_name = brand_name;
		this.product_name = product_name;
		this.product_description = product_description;
		this.quantity = quantity;
		this.price = price;
		this.discount = discount;
		this.image_path = image_path;
		this.actualPrice = calculatePrice(this.price,this.discount);
	}



	/**
	 * @return the product_id
	 */
	public int getProduct_id() {
		return product_id;
	}



	/**
	 * @param product_id the product_id to set
	 */
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}



	/**
	 * @return the product_category
	 */
	public String getProduct_category() {
		return product_category;
	}



	/**
	 * @param product_category the product_category to set
	 */
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
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



	/**
	 * @return the product_name
	 */
	public String getProduct_name() {
		return product_name;
	}



	/**
	 * @param product_name the product_name to set
	 */
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}



	/**
	 * @return the product_description
	 */
	public String getProduct_description() {
		return product_description;
	}



	/**
	 * @param product_description the product_description to set
	 */
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}



	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}



	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}



	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}



	/**
	 * @return the discount
	 */
	public int getDiscount() {
		return discount;
	}



	/**
	 * @param discount the discount to set
	 */
	public void setDiscount(int discount) {
		this.discount = discount;
	}



	/**
	 * @return the image_path
	 */
	public String getImage_path() {
		return image_path;
	}



	/**
	 * @param image_path the image_path to set
	 */
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}



	/**
	 * @return the actualPrice
	 */
	public double getActualPrice() {
		return actualPrice;
	}



	/**
	 * @param actualPrice the actualPrice to set
	 */
	public void setActualPrice(double actualPrice) {
		this.actualPrice = actualPrice;
	}

	/**
	 *	method calculating actual price of the product after discount
	 *  
	 *	@param price
	 *	@param discount
	 *  @return finalAmount
	 *  @see Product
	 *	@version 1.0
	 *	@author GR_TH3_JAVA_5
	 *  @since 22-June-2017
	 */


	public double calculatePrice(double price,int discount){
		double discountedPrice = (discount*price)/100;
		double finalAmount = price - discountedPrice;

		return finalAmount;

	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + product_id;
		result = prime * result + ((product_name == null) ? 0 : product_name.hashCode());
		return result;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", product_category=" + product_category + ", brand_name="
				+ brand_name + ", product_name=" + product_name + ", product_description=" + product_description
				+ ", quantity=" + quantity + ", price=" + price + ", discount=" + discount + ", image_path="
				+ image_path + ", actualPrice=" + actualPrice + "]";
	}






}
