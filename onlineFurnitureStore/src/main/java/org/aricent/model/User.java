/***********************************************************************
                         Aricent Technologies Proprietary

This source code is the sole property of Aricent Technologies. Any form of utilization
of this source code in whole or in part is  prohibited without  written consent from
Aricent Technologies

           File Name					:User.java
           Principal Author				:GR_TH3_JAVA_5
           Date of First Release        :22-June-2017
           Description                  :class containing user attributes and getter setter methods


           Change History

           Version                      :1.0
           Date(DD/MM/YYYY)             :6-Jan-2017
           Modified by               	:GR_TH3_JAVA_5 
           Description of change        :Initial Version

 ***********************************************************************/
package org.aricent.model;
/**
 *	class containing user attributes and getter setter methods
 *	@see User
 *	@version 1.0
 *	@author GR_TH3_JAVA_5
 *    @since 22-June-2017
 */

public class User {


	private long userId;
	private String firstName;
	private String lastName;
	private String password;
	private String email;
	private String userName;
	private String address;
	private String city;
	private String state;
	private int pin;
	private int type;

	/**
	 * User default constructor
	 */
	public User() {
		super();
	}

	/**
	 * User constructor with parameters
	 * @param userId
	 * @param firstName 	 
	 * @param lastName
	 * @param password
	 * @param email
	 * @param userName 	 
	 * @param address
	 * @param city	
	 * @param state
	 * @param pin
	 * @param type
	 */

	public User(long userId, String firstName, String lastName, String password, String email, String userName,
			String address, String city, String state, int pin, int type) {
		super();
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.email = email;
		this.userName = userName;
		this.address = address;

		this.city = city;
		this.state = state;
		this.pin = pin;
		this.type = type;

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
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}

	/**
	 * @return the pin
	 */
	public int getPin() {
		return pin;
	}

	/**
	 * @param pin the pin to set
	 */
	public void setPin(int pin) {
		this.pin = pin;
	}

	/**
	 * @return the type
	 */
	public int getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(int type) {
		this.type = type;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "User [userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", password="
				+ password + ", email=" + email + ", userName=" + userName + ", address=" + address + ", city=" + city
				+ ", state=" + state + ", pin=" + pin + ", type=" + type + "]";
	}


}
