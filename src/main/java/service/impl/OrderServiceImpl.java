package service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.OrderService;
import service.ProductService;
import dao.OrderMapper;
import domain.Order;
import domain.Product;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper orderMapper;
	@Autowired
	ProductService productService;
	
	@Override
	public void add(Order order) {
		Product product = productService.getById(order.getPid());
		product.setStock(product.getStock()-order.getNum());
		productService.update(product);
		Date date = new Date();
		order.setCreatedate(date);
		order.setOrdercode((new SimpleDateFormat("yyyyMMddHHmmss")).format(date));
		orderMapper.insertSelective(order);
	}

	@Override
	public List<Order> listByUid(int uid) {
		return orderMapper.selectByUid(uid);
	}
	
	@Override
	public List<Order> listByUidAndStatus(int uid, int status) {
		return orderMapper.selectByUidAndStatus(uid, status);
	}

	@Override
	public List<Order> list() {
		return orderMapper.selectAll();
	}

	@Override
	public Order getById(int id) {
		return orderMapper.selectByPrimaryKey(id);
	}

	@Override
	public void update(Order order) {
		orderMapper.updateByPrimaryKeySelective(order);
	}
}