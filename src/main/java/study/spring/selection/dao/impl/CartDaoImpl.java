package study.spring.selection.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import study.spring.selection.dao.CartDao;
import study.spring.selection.model.Cart;
import study.spring.selection.model.Order;
import study.spring.selection.model.OrderDetail;


@Repository
public class CartDaoImpl implements CartDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Cart> cartMoney() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Cart cart){
		sqlSession.insert("CartMapper.insert", cart);
		
	}

	@Override
	public List<Cart> listCart(int user_no) {
		return sqlSession.selectList("CartMapper.listCart", user_no);
	}
	
	/** 결제 페이지 목록 */
	@Override
	public Cart listPay(int cart_no) {
		return sqlSession.selectOne("CartMapper.listPay", cart_no);
	}

	@Override
	public void deleteCart(Cart cart) throws Exception {
		sqlSession.delete("CartMapper.deleteCart", cart);
	}

	

	@Override
	public void update(int cart_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int sumMoney(int user_no) {
		return sqlSession.selectOne("CartMapper.sumMoney", user_no);
	}
	
	/** 동일 상품인지 확인 */
	@Override
	public int countCart(int user_no, int product_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product_no", product_no);
		map.put("user_no", user_no);
		return sqlSession.selectOne("CartMapper.countCart", map);
	}
	
	/** 장바구니 동일상품 반영 */
	@Override
	public void updateCart(Cart cart) {
		sqlSession.update("CartMapper.updateCart", cart);
	}

	@Override
	public void modifyCart(Cart cart) {
		// TODO Auto-generated method stub
		
	}
	
	// 주문 생성
	@Override
	public void insertOrder(Order order) {
		sqlSession.insert("CartMapper.orderInsert", order);
	}
	
	// 주문상세 생성
	@Override
	public void insertOrderDetail(OrderDetail orderDetail) {
		sqlSession.insert("CartMapper.orderDetailInsert", orderDetail);
		
	}


}
