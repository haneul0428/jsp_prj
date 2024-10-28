package day1018;

import java.util.Date;

public class ProductVO {
	private int itemNo, price;
	private String img;
	private Date date;
	
	public ProductVO() {
		super();
	}
	
	public ProductVO(int itemNo, String img, int price, Date date) {
		super();
		this.itemNo = itemNo;
		this.img = img;
		this.price = price;
		this.date = date;
	}
	
	public int getItemNo() {
		return itemNo;
	}
	
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getImg() {
		return img;
	}
	
	public void setImg(String img) {
		this.img = img;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "ProductVO [itemNo=" + itemNo + ", price=" + price + ", img=" + img + ", date=" + date + "]";
	}
}//c
