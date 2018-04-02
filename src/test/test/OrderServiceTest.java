package test;

import javax.annotation.Resource;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import service.OrderService;
import domain.Order;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class OrderServiceTest {

	@Resource
	private OrderService orderService;
	
	@Test
	public void testGetById() {
		Order order = orderService.getById(1);
		Assert.assertNotNull(order);
	}

}
