package service;

import java.util.List;

import domain.Order;
import domain.User;

public interface UserService {
	public User getByName(String name);
	
	public User getById(int id);
	
	public boolean update(User user);

	public void fill(List<Order> orders);

	public List<User> list();

	public void add(User user);

	public void deleteById(int id);
}
