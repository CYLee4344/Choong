<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>THE SELECTION</title>
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header2.css">
    <link rel="stylesheet" type="text/css" href="assets/css/payment.css">


</head>
<body>
     <div id="header">
        <ul>
            <li class="back"><a href="#" class="back2" onclick="history.back(); return false;"><img src="assets/image/back.png"></a></li>
             <li class="home"><a href="index.do"><img src="assets/image/home.png"></a></li>
            <li class="search"><a href="#" class="search2"><img src="assets/image/search.png"></a></li>
            <li class="logo"><a href="#" class="logo2"><span> <strong>배송&결제정보 입력</strong></span></a></li>
            <li class="cart"><a href="ShoppingCart.do" class="cart2"><img src="assets/image/shopping_cart.png"></a></li>

            <div class="searchbox">
                <input placeholder="search..." type="text" />
                <a href=""><img src="image/search.png"></a>
            </div>
        </ul>
    </div>
    <hr />

    <div id="container">
    		<c:set var="sum" value="0" />
       		<c:forEach var="row" items="${list}">
		        <div class="order_box">	         
		            <ul class="order_item_ul">
		                <li>
		                    <div class="order_item_content">
		                        <div class="order_item_img"><img src="${pageContext.request.contextPath}/${row.product_img}"></div>
		                        <ul>
		                        	<span>cart_no : "${row.cart_no}"</span>
		                            <li class="first"><span class="item_name">${row.product_brand}</span>
		                            <li class="first_half"><span>${row.product_name}</span></li>
		                            <li class="second"><span>${row.color} / ${row.size} / ${row.amount}개</span></li>
		                            <li class="third"><span>₩<fmt:formatNumber pattern="###,###,###" value="${row.product_price*row.amount}" /></span></li>
		                            <li class="fourth"><span class="stage">${row.delivery}</span></li>
		                        </ul>
		                    </div>
		                </li>
		            </ul>
		        </div>
		    <c:set var="sum" value="${sum + (row.product_price * row.amount)}" />
        	</c:forEach>
            <div>
               <h1 class="dcc">배송지 정보</h1>
               <h2>"${user.postcode} ${user.address} ${user.address_detail}"</h2>
			</div>
    </div>
  
    <div >
       <ul>
           <li class="payall"
           	><a href=""><span class="btn_t_1">최종 결제금액</span><span class="btn_t_2"><b>178,000</b>원</span></a>
           </li>
           <li>
               <div class="story">상품합계</div>
               <div class="money"><fmt:formatNumber pattern="###,###,###" value="${sum}" />원</div>
           </li>
           <li>
               <div class="story">배송비</div>
               <div class="money">0</div>
           </li>
       </ul>
    </div>

	<div>
		<form method="post" action="${pageContext.request.contextPath}/orderInsert.do" id="orderForm">
			<input type="hidden" name="prodArr" id="prodArr" value="" />		
			<input type="hidden" name="cartArr" id="cartArr" value="" />
			<input type="hidden" name="amountArr" id="amountArr" value="" />
			<input type="hidden" name="deliveryArr" id="deliveryArr" value="" />
			<input type="hidden" name="sizeArr" id="sizeArr" value="" />
			<input type="hidden" name="colorArr" id="colorArr" value="" />
			<input type="hidden" name="order_total" value="${sum}" />
			<div>
				<label for="">수령인</label>
				<input type="text" name="rec" value="${user.user_name}" />
			</div>
			<div>
				<label for="">우편번호</label>
				<input type="text" name="postcode" value="${user.postcode}" />
			</div>
			<div>
				<label for="">주소</label>
				<input type="text" name="address" value="${user.address}" />
			</div>
			<div>
				<label for="">상세주소</label>
				<input type="text" name="address_detail" value="${user.address_detail}" />
			</div>
			<div>
				<button type="button" id="orderSubmit">주문</button>
				<button type="button">취소</button>
			</div>
		</form>
	</div>

     <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
  			$(function() {
  				var prodArr = new Array();
				<c:forEach var="row" items="${list}">
				prodArr.push("${row.product_no}");
				</c:forEach>
				$("#prodArr").val(prodArr);
  				
				var cartArr = new Array();
				<c:forEach var="row" items="${list}">
				cartArr.push("${row.cart_no}");
				</c:forEach>
				$("#cartArr").val(cartArr);
				
				var deliveryArr = new Array();
				<c:forEach var="row" items="${list}">
				deliveryArr.push("${row.delivery}");
				</c:forEach>
				$("#deliveryArr").val(deliveryArr);
				
  				$("#orderSubmit").click(function() {
  					if (confirm("주문?")) {
  						alert("결제완료. 메인으로 이동");
  						$("#orderForm").submit();
  					} 
  				});
  				
  			});
  			
	</script>
</body>
</html>