package study.spring.selection.service;

import java.util.List;

import study.spring.selection.model.Product;

public interface ProductService {
	

	/** 상품 목록 */
	public List<Product> productList();
	
	/** 상품 상세 */
	public Product productDetail(int product_no);
	
}