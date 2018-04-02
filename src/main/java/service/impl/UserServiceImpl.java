package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.UserService;
import dao.UserMapper;
import domain.Order;
import domain.User;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public User getByName(String name) {
        return userMapper.selectByName(name);
    }
    
    @Override
	public User getById(int id) {
    	return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean update(User user) {
		userMapper.updateByPrimaryKeySelective(user);
		return true;
	}

	@Override
	public void fill(List<Order> orders) {
		for(Order order : orders) {
			User user = getById(order.getUid());
			order.setUser(user);
		}
	}

	@Override
	public List<User> list() {
		return userMapper.selectAll();
	}

	@Override
	public void add(User user) {
		userMapper.insertSelective(user);
	}

	@Override
	public void deleteById(int id) {
		userMapper.deleteByPrimaryKey(id);
	}
}
