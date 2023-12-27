package com.fastfood.entity;




import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity @Table(name="OrderDetails")
public class OrderDetail {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer Id;
	//Integer OrderId;
	//Integer ProductId;
	Integer Price;
	Integer Quantity;
	
	@ManyToOne
	@JoinColumn(name="orderId")
	Order order;
	

	@ManyToOne
	@JoinColumn(name="productId")
	Product product;


	public Integer getId() {
		return Id;
	}


	public void setId(Integer id) {
		Id = id;
	}


	public Integer getPrice() {
		return Price;
	}


	public void setPrice(Integer price) {
		Price = price;
	}


	public Integer getQuantity() {
		return Quantity;
	}


	public void setQuantity(Integer quantity) {
		Quantity = quantity;
	}


	public Order getOrder() {
		return order;
	}


	public void setOrder(Order order) {
		this.order = order;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}
	
}
