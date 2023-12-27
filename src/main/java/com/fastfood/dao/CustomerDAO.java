package com.fastfood.dao;

import java.util.List;

import com.fastfood.entity.Customer;



public interface CustomerDAO {
	Customer findById(String id);
	List<Customer>findAll();
	Customer create(Customer entity);
	void update(Customer entity);
	Customer delete(String id);
	Customer findByEmail(String email);
}
