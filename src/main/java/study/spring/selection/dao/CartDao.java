package study.spring.selection.dao;

import java.util.List;

import study.spring.selection.model.Cart;
import study.spring.selection.model.Order;
import study.spring.selection.model.OrderDetail;


public interface CartDao {
	public List<Cart> cartMoney();
	public void insert(Cart cart); //장바구니 추가
	public List<Cart> listCart(int user_no); //장바구니 목록
	public Cart listPay(int cart_no); //결제 페이지 목록
	public void deleteCart(Cart cart) throws Exception; //장바구니 비우기
	public void update(int cart_no); 
	public int sumMoney(int user_no); //장바구니 금액 합계
	public int countCart(int user_no, int product_no); //장바구니 상품 갯수
	public void updateCart(Cart cart); //장바구니 수정 
	public void modifyCart(Cart cart);
	public void insertOrder(Order order); // 주문 생성
	public void insertOrderDetail(OrderDetail orderDetail); // 주문상세 생성
	public List<OrderDetail> orderList(Order order);		// 주문 내역
	
	public List<Order> orderOuter(Order order); 
	public List<OrderDetail> orderInner(Order order); 
}
