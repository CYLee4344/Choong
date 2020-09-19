<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="assets/inc/same_css.jsp"%>
<link rel="stylesheet" type="text/css" href="assets/css/header.css">
<link rel="stylesheet" type="text/css" href="assets/css/MyHeart.css">
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<ul>
			<li class="back"><a href="javascript:history.back()"><img
					src="assets/image/back.png"></a></li>
			<li class="search"><a href="#"><img src="assets/image/search.png"></a></li>
			<div class="searchbox">
				<input placeholder="search..." type="text" /> <a href=""><img
					src="assets/image/search.png"></a>
			</div>
			<li class="title"><h1>마이하트</h1></li>
			<li class="cart"><a href="ShoppingCart.do"><img
					src="assets/image/shopping_cart.png"></a></li>
		</ul>
	</div>
	<div class="container">
		<div class="page-header">
			<ul>
				<li>ㆍ위시리스트에는 상품이 최대 50개까지 저장됩니다.</li>
				<li>ㆍ마이하트에 담은 상품 중 판매종료가 된 상품은<br />&nbsp&nbsp 자동삭제됩니다.</li>
			</ul>
		</div>
		<div class="two_option clear">
			<div class="del">선택상품삭제</div>
			<div class="select">
				<select>
					<option>전체</option>
					<option>베스트</option>
					<option>신상품</option>
					<option>추천상품</option>
				</select>
			</div>
		</div>
		<div id="product" class="clear">
			<ul id="grid">
			</ul>
		</div>
		<div id="pagination" class="hs_paging bottom">
			<a href="javascript:void(0);" class="pre disabled"> << </a> 
			<a href="javascript:void(0);" class="cur">1</a> 
			<a href="javascript:#">2</a>
			<a href="javascript:#">3</a> 
			<a href="javascript:#">4</a> 
			<a href="javascript:#">5</a> 
			<a href="javascript:#" class="nxt"> >> </a>
		</div>
		<input type="button" name="" class="btn_basket" value="장바구니담기">
	</div>

	<div id="modal">
		<div id="modal_bg"></div>
		<div id="options">
			<div class="wrapper">
				<div class="btn_close">X</div>
				<div class="box clear">
					<div class="img_box">
						<img src="assets/image/main2.jpg">
					</div>
					<div class="cont_box">
						<ul>
							<li>Fourm The Store</li>
							<li>[Palette]</li>
							<li class="price">\138,000</li>
						</ul>
					</div>
				</div>
				<div class="btn_box">
					<input type="button" name="ok" value="선택완료">
				</div>
			</div>
		</div>
		<div id="go_basket">
			<div class="btn_close">X</div>
			<p>장바구니로 이동하시겠습니까?</p>
			<input type="button" onclick="location.href='ShoppingCart.do'"
				name="ok" value="확인">
		</div>

	</div>
	<script type="text/x-handlebars-template" id="list-item-tmpl">
        {{#item}}
		<li>
            <div class="img">
                <a href="Detail.do">
                    <img src="{{img}}" class="img_g">
                </a>
            </div>
			<div class="box_list">
                        <input type='checkbox' class='del_box' id="cb3" value="삭제">
                        <label id="cb4" for="cb3"></label>
            </div>
            <div class="info">
                <p class="brand"><strong>{{brand}}</strong></p>
                <p class="desc">{{desc}}</p>
                <p class="price"><span>\</span>{{price}}</p>
            </div>
        </li>
        {{/item}}
    </script>
	<%@ include file="assets/inc/bottom_bar.jsp"%>
	
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="assets/plugins/handlebars/handlebars-v4.0.11.js"></script>
	<script type="text/javascript">
	Handlebars.registerHelper('commas', function(value) {
    	return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    });
		function add_item() {
			$.get("assets/json/item.json", function(req) {
				var template = Handlebars.compile($("#list-item-tmpl").html());
				var html = template(req)
				$("#grid").append(html);
			});
		}
		$(function() {
			add_item()
			$("#bottom_bar li:first-child").click(function(e) {
				e.preventDefault();
				$("#category_bar").slideToggle(100);
			});
			$(".btn_basket").click(function() {
				$("#modal").addClass("show");
			});
			$("#modal #options .btn_close").click(function() {
				$("#modal").removeClass("show");
			});
			$("#modal #options input").click(function() {
				$("#modal #go_basket").show();
				$("#modal #options .wrapper").css({
					"z-index" : "-1"
				});
			});
			$("#modal #go_basket .btn_close").click(function() {
				$("#modal #go_basket").hide();
			});
			$("#modal #go_basket .btn_close").click(function() {
				$("#modal #go_basket").hide();
				$("#modal #options .wrapper").css({
					"z-index" : "1"
				});
				$("#modal").removeClass("show");
			});
			$("#modal #modal_bg").click(function() {
				$("#modal #go_basket").hide();
				$("#modal #options .wrapper").css({
					"z-index" : "1"
				});
				$("#modal").removeClass("show");
			});
		});
	</script>
</body>
</html>