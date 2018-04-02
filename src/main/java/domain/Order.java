package domain;

import java.util.Date;

public class Order {
	private Product product;
	
	private User user;
	
    private Integer id;

    private String ordercode;

    private Integer num;

    private Float payment;

    private String address;

    private String receiver;

    private String mobile;

    private String usermessage;

    private String salermessage;

    private Date createdate;

    private Integer status;

    private Integer uid;

    private Integer pid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrdercode() {
        return ordercode;
    }

    public void setOrdercode(String ordercode) {
        this.ordercode = ordercode == null ? null : ordercode.trim();
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Float getPayment() {
        return payment;
    }

    public void setPayment(Float payment) {
        this.payment = payment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver == null ? null : receiver.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getUsermessage() {
        return usermessage;
    }

    public void setUsermessage(String usermessage) {
        this.usermessage = usermessage == null ? null : usermessage.trim();
    }

    public String getSalermessage() {
        return salermessage;
    }

    public void setSalermessage(String salermessage) {
        this.salermessage = salermessage == null ? null : salermessage.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Product getProduct() {
    	return product;
    }
    
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public User getUser() {
    	return user;
    }
    
	public void setUser(User user) {
		this.user = user;
	}
}