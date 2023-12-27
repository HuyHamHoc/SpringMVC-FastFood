package com.fastfood.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity @Table(name="Products")
public class Product {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer Id;
	String Name;
	Integer Price;
	String Image;
	//Integer CategoryId;
	Integer Quantity;
	String Description; 
	
	@ManyToOne
	@JoinColumn(name="categoryId")
	Category category;
	
	@OneToMany(mappedBy="product")
	List<OrderDetail> orderDetails;

	public Integer getId() {
		return Id;
	}


	public void setId(Integer id) {
		Id = id;
	}


	public String getName() {
		return Name;
	}


	public void setName(String name) {
		Name = name;
	}


	public Integer getPrice() {
		return Price;
	}


	public void setPrice(Integer price) {
		Price = price;
	}


	public String getImage() {
		return Image;
	}


	public void setImage(String image) {
		Image = image;
	}


	public Integer getQuantity() {
		return Quantity;
	}


	public void setQuantity(Integer quantity) {
		Quantity = quantity;
	}


	public String getDescription() {
		return Description;
	}


	public void setDescription(String description) {
		Description = description;
	}


	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}


	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}


	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}


	
	
}
