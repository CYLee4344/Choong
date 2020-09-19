<%@ page language="java" contentType="text/html; charset=utf-8" 	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>THE SELECTION</title>
<%@ include file="assets/inc/same_css.jsp"%>
<link rel="stylesheet" type="text/css" href="assets/css/header2.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/shoppingcart.css">

</head>
<body>
	<div id="header">
		<ul>
			<li class="back"><a href="#"
				onclick="history.back(); return false;"><img
					src="assets/image/back.png"></a></li>
			<li class="home"><a href="index.do"><img
					src="assets/image/home.png"></a></li>
			<li class="search"><a href="#"><img src="assets/image/search.png"></a></li>
			<div class="searchbox">
				<input placeholder="search..." type="text" /> <a href=""><img
					src="assets/image/search.png"></a>
			</div>
			<li class="title"><h1>장바구니</h1></li>
			<li class="cart"><a href="cartList.do"><img
					src="assets/image/shopping_cart.png"></a></li>
		</ul>
	</div>

    <c:choose>
    	<c:when test="${map.count == 0}">
    		<div id="checkBox">
		            <input type="checkbox" id="cartCount" />
		            <label for="cartCount"></label><span>담은 상품(0개)</span>
		    </div>
	    	<div id="container">
		        <div id="text-area">장바구니에 담긴 상품이 없습니다.</div>
		
		        <div id="continue-button">
		            <a href="${pageContext.request.contextPath}/index.do">쇼핑계속하기</a>
		        </div>
	    	</div>
	    	
	    	<!-- footer -->
			<%@ include file="assets/inc/footer.jsp"%>
			
			<!-- bottom_bar -->
    		<%@ include file="assets/inc/bottom_bar.jsp"%>
        </c:when>
        
        <c:otherwise>
        	<div id="order_list_wrap">
		        <div id="checkBox">
		            <input type="checkbox" id="allCheck"/>
		            <label for="allCheck"></label>
            		<span>담은 상품(${map.count}개)</span>
		        </div>		   
		        <c:forEach var="row" items="${map.list}">
			        <div class="order_box">
			            <input type="checkbox" id="${row.cart_no}" class="chkBox" data-cart_no="${row.cart_no}" 
			            value="${row.product_price*row.amount}" />
			            <label for="${row.cart_no}"></label>		         
			            <ul class="order_item_ul">
			                <li>
			                    <div class="order_item_content">
			                        <div class="order_item_img"><img src="${pageContext.request.contextPath}/${row.product_img}"></div>
			                        <ul>
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
	        	</c:forEach>
	        </div>
	        <div id="summary_wrap">
		        총<span id="cartCount"></span>개 상품
		        <ul id="summary_wrap_ul">
		            <li>
		                <div class="summary_title">상품 합계</div>
		                <div class="summary_content" id="summary_sum">₩0</div>
		            </li>
		            <li>
		                <div class="summary_title">배송비</div>
		                <div class="summary_content">₩0</div>
		            </li>
		            <li>
		                <div class="summary_title">합계</div>
		                <div class="summary_content">₩0</div>
		            </li>
		        </ul>
		    </div>
		
		    <div id="button_container">
		        <div class="btn3">
		            <button class="soldout">품절상품삭제</button>
		            <button class="chod">선택상품삭제</button>
		        </div>
		        <form action="${pageContext.request.contextPath}/payList.do" method="post" id="orderForm">
		        	<input type="hidden" name="chbox[]" id="chbox" value="" />
		        	<button type="button" id="orderSuccess">선택상품 주문하기</button>
		        </form>
		    </div>
	    </c:otherwise>
	</c:choose>


	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			
			/** 결제 페이지로 이동*/
			$("#orderSuccess").click(function() {
				var checkArr = new Array();
				$("input[class='chkBox']:checked").each(function() {
                    checkArr.push($(this).attr("data-cart_no"));
                });
				
				$("#chbox").val(checkArr);
				if (confirm("주문?")) {
					alert("결제 페이지로 이동");
					$("#orderForm").submit();
				}
			});
			
			/** 상품 하나 이상 선택해야만 주문 가능 */
			$(".btn2 a").click(function() {
				var result = 0;
				$("input[class='chkBox']:checked").each(function() {
                    result += 1;
                });
				if(!result) {
					alert("주문할 상품을 선택해주세요.");
				}
			});
	
	        /** 전체 체크 */
	        $("#allCheck").click(function() {
	            var chk = $("#allCheck").prop("checked");
	            if(chk) {
	                $(".chkBox").prop("checked", true);
	            } else {
	                $(".chkBox").prop("checked", false);
	            }
	        });
	
	        /** 개별 체크박스 선택 시 전체 체크 해제 */
	        $(".chkBox").click(function() {
	            $("#allCheck").prop("checked", false);
	        });
			
	        /** 선택된 항목 삭제 */
	        $("button.chod").click(function() {
	            var confirm_val = confirm("정말 삭제?");
	
	            if (confirm_val) {
	                var checkArr = new Array();
	
	                $("input[class='chkBox']:checked").each(function() {
	                    checkArr.push($(this).attr("data-cart_no"));
	                });
	                
	                $.ajax({
	                	url : "${pageContext.request.contextPath}/cartDelete.do",
	                	type: "post",
	                	data : {chbox : checkArr},
	                	success : function(result) {
	                		if(result == 1) {
	                			location.href = "${pageContext.request.contextPath}/cartList.do";
	                		} else {
	                			alert("삭제 실패");
	                		}	
	                	}
	                });                
	            }	
	        });
	        
	          	        
	        /** 선택상품 금액 합계 */
	        $("#allCheck, .chkBox").click(function() {
	        	var sum = 0;
	        	var count = 0;
	        	var checked_array = new Array();
		        $("input:checkbox[class='chkBox']:checked").each(function() {
		        	checked_array.push(this.value);
		        	count += 1;
		        });
		        $("#cartCount").html(count);
	        	for (i=0; i<checked_array.length; i++) {
	        		sum += parseInt(checked_array[i]);
	        	}
	        	$("#summary_sum").html("₩" + sum);
	        });
	        
	        		
	    }); // function 끝
	    
	</script>

</body>
</html>