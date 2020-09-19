package study.spring.selection.model;

import lombok.Data;

@Data
public class Product {
	private int product_no;
	private String product_name;
	private int product_price;
	private String product_content;
	private String product_brand;
	private String product_category;
	private String product_img;
}