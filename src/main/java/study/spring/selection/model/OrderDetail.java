package study.spring.selection.model;

import lombok.Data;

@Data
public class OrderDetail {
	
	private int order_detail_no;
	private String order_no;
	private int product_no;
	
	// 카트
	private int amount;				// 장바구니에 담은 개수
	private String delivery;		// 배송방법
	private String size;			// 사이즈
	private String color;			// 컬러
	
	// 상품
	private String product_name;    // 상품명
	private String product_brand;	// 브랜드
	private int product_price;		// 상품 가격
	private String product_img;		// 상품 이미지
}
