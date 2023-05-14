package user.model;

public class Order extends Product{
	private int orderId;
	private int uid;
	private int qunatity;
	private String date;
//	private int  totalamt;
	private String payment;
	private String status;
	private String billno;
	
	public Order() {
	}
	
	public Order(int orderId, int uid, int qunatity, String date,String payment,String status,String billno) {
		super();
		this.orderId = orderId;
		this.uid = uid;
		this.qunatity = qunatity;
		this.date = date;
//		this.totalamt=totalamt;
		this.payment=payment;
		this.status=status;
		this.billno=billno;
		
	}

	public Order(int uid, int qunatity, String date) {
		super();
		this.uid = uid;
		this.qunatity = qunatity;
		this.date = date;
	}

	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	

	public String getbillno() {
		return billno;
	}
	
	public void setbillno(String billno) {
		this.billno=billno;
	}
	
	public String getpayment() {
		return payment;
	}
	public void setpayment(String payment) {
		this.payment = payment;
	}
	
	public String getstatus() {
		return status;
	}
	
	public void setstatus(String status) {
		this.status=status;
	}
	

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getQunatity() {
		return qunatity;
	}
	public void setQunatity(int qunatity) {
		this.qunatity = qunatity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
