package com.fastfood.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fastfood.entity.Customer;

@Transactional
@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Customer findById(String id) {
		Session session = sessionFactory.getCurrentSession();
		Customer entity = session.find(Customer.class, id);
		return entity;
	}

	@Override
	public List<Customer> findAll() {
		String hql = "FROM Customer";
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<Customer> query = session.createQuery(hql, Customer.class);
		List<Customer> list = query.getResultList();
		return list;
	}

	@Override
	public Customer create(Customer entity) {
		Session session = sessionFactory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Customer entity) {
		Session session = sessionFactory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Customer delete(String id) {
		Session session = sessionFactory.getCurrentSession();
		Customer entity = session.find(Customer.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public Customer findByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Customer WHERE email = :email";
		TypedQuery<Customer> query = session.createQuery(hql, Customer.class);
		query.setParameter("email", email);
		List<Customer> list = query.getResultList();
		return list.isEmpty() ? null : list.get(0);
	}
}