package service;

import java.util.List;

import domain.Order;

public interface OrderService {

	void add(Order order);

	List<Order> listByUid(int uid);
	
	List<Order> listByUidAndStatus(int uid, int status);

	List<Order> list();

	Order getById(int id);

	void update(Order order);	
}