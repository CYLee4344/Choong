<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>THE SELECTION</title>
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header2.css">
    <link rel="stylesheet" type="text/css" href="assets/css/coupon.css">
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/bottom_bar.css">


</head>
<body>


     <div id="header">
        <ul>
            <li class="back"><a href="#" class="back2" onclick="history.back(); return false;"><img src="assets/image/back.png"></a></li>
             <li class="home"><a href="index.do"><img src="assets/image/home.png"></a></li>
            <li class="search"><a href="#" class="search2"><img src="assets/image/search.png"></a></li>
            <!--<li class="logo"><a href="#"><span><strong>페이지명<strong></span></a></li>-->
            <li class="logo"><a href="Coupon.do" class="logo2"><span> <strong>쿠폰</strong></span></a></li>
            <li class="cart"><a href="ShoppingCart.do" class="cart2"><img src="assets/image/shopping_cart.png"></a></li>
			
            <div class="searchbox">
                <input placeholder="search..." type="text" />
                <a href=""><img src="assets/image/search.png"></a>
            </div>
        </ul>
    </div>
    <hr />

 <div class="container">

    <ul class="tabs">
        <li id="li"  class="tab-link current" data-tab="tab-1">새 쿠폰</li>
        <li class="tab-link" data-tab="tab-2">기간만료</li>
        </ul>


    <div id="tab-1" class="tab-content current">
        <div class="coupon_image">
            <p class="coupon_p">신규회원</p>
            <p class="coupon_title">5% 할인</p>
            <p class="coupon_day">2020-07-29 ~ 2020-08-30</p>
            <div class="coupon_num">BT2-020-072-9EC-PU5-GH6</div>
            <span class="coupon_logo"></span></div>
    </div>


 <!--     <div class="coupon_desc">
        "더한섬닷컴 가입을 축하합니다. (온라인 전용)"
    </div> -->



    <div id="tab-2" class="tab-content">
         <div class="coupon_image">
            <p id="li" class="coupon_p">만료 쿠폰</p>
            <p class="coupon_title">5% 할인</p>
            <p class="coupon_day">2020-07-29 ~ 2020-08-02</p>
            <div class="coupon_num">BT2-020-072-9EC-PU5-GH6</div>
            <span class="coupon_logo"></span>
        </div>
    </div>
</div>

    <div class="bottom1">
        <p>쿠폰 안내</p>
        <br />


            <li>
                상품 주문 시 ‘배송&결제정보 입력’ 화면에서 쿠폰을 적용하면 할인된 금액으로 상품을 구입하실 수 있습니다.
            </li>

            <li>
                <span>반품 시 반품 비용 없이 무료로 구입하신 상품을 반품하실 수 있습니다.</span>
            </li>
            <li>
                <span>일부 상품은 쿠폰 할인 적용이 불가능합니다.</span>
            </li>
            <li>
                <span>유효기간이 지난 쿠폰은 자동 소멸됩니다.</span>
            </li>
            <li>
                <span>주문취소 시 사용한 쿠폰은 유효기간이 만료된 경우 재발급되지 않습니다.</span>
            </li>

    </div>

    <!-- footer -->
	<%@ include file="assets/inc/footer.jsp"%>
		
	<!-- bottom_bar -->
	<%@ include file="assets/inc/bottom_bar.jsp"%>

     <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    $(function() {
		$("#mybutton").click(function(e) {
			$.ajax( {
				/** ajax 기본 옵션 */
				cache: false,			 // 캐쉬 사용 금지 처리
				url: '../api/hello.html',// 읽어들일 파일의 경로
				method: 'get',			 // 통신방법 (get(기본값), post)
				data: {},				 // 접속대상에게 전달할 파라미터
				dataType: 'html',		 // 읽어올 내용 형식 (html,xml,json)
				timeout: 30000,			 // 타임아웃 (30초)

				// 통신 시작전 실행할 기능 (ex: 로딩바 표시)
				beforeSend: function() {
					// 현재 통신중인 대상 페이지를 로그로 출력함
					console.log(">> Ajax 통신 시작 >> " + this.url);
				},
				// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
				success: function(req) {
					console.log(">> 성공!!!! >> " + req);
					// 준비된 요소에게 읽어온 내용을 출력한다.
					$("#result").append(req);
				},
				// 통신 실패시 호출될 함수 (파라미터는 에러내용)
				error: function(error) {
					// 404 -> Page Not Found
					// 50x -> Server Error(웹 프로그램 에러)
					// 200, 0 -> 내용의 형식 에러(JSON,XML)
					console.log(">> 에러!!!! >> " + error.status);
				},
				// 성공,실패에 상관 없이 맨 마지막에 무조건 호출됨 ex) 로딩바 닫기
				complete: function() {
					console.log(">> Ajax 통신 종료!!!!");
				}
			} );
		}); // end #mybutton click
	});
    
        $(document).ready(function(){

    $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    });

        $("#bottom_bar li:first-child").click(function(e) {
                e.preventDefault();
                $("#category_bar").slideToggle(100);
            });
});

</script>
</body>
</html>