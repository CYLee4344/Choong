<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>THE SELECTION</title>
    <link rel="stylesheet" type="text/css" href="assets/css/Delivery.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <%@ include file="assets/inc/same_css.jsp"%>   

</head>
<body>
	 <!-- 바디 -->
    <div id="body">
        <!-- 헤더 -->
        <div id="header">
            <ul>
                <li class="back"><a href="javascript:history.back()"><img src="assets/image/back.png"></a></li>
                <li class="search"><a href="#"><img src="assets/image/search.png"></a></li>
                <div class="searchbox">
                    <input placeholder="search..." type="text" />
                    <a href=""><img src="assets/image/search.png"></a>
                </div>
                <li class="title"><h1>주문/배송조회</h1></li>
                <li class="cart"><a href="ShoppingCart.do"><img src="assets/image/shopping_cart.png"></a></li>
            </ul>
        </div>

        <!-- 기간 검색 -->
        <div id="search_wrap">
            <div id="search2">
                <ul class="search2">
                    <li>1주일</li>
                    <li>1개월</li>
                    <li>3개월</li>
                    <li>조건검색</li>
                </ul>
                <div id="date">
                    <ul class="date">
                        <li class="cal"><input type="date" class="date start"></li>
                        <li class="blank">~</li>
                        <li class="cal"><input type="date" class="date end"></li>
                    </ul>
                    <span id="btn">검색</span>
                </div>
            </div>
        </div>

        <!-- 본문 - 주문없을 시 -->
        <!-- <div id="text_area"><p>주문 내역이 없습니다.</p></div>
        <div id="blank_area"></div> -->

        <!-- 본문 - 주문 있을 때 -->
        <div id="order_list_wrap">
            <div class="order_box">
                <div class="order_info pickup">
                    <div class="deliv_method">방문수령 200804P06827051</div>
                    <div class="deliv_sub">2020.08.04. 23:38:18</div>
                    <div class="menu_vertical">
                        <img src="assets/image/bin.png">
                    </div>
                    <!-- <div id="cancel_box">
                        <img src="image/close.png">
                        <ul>
                            <li>주문취소</li>
                        </ul>
                    </div> -->
                </div>
                <ul class="order_item_ul">
                    <li>
                        <div class="order_item_content">
                            <div class="order_item_img"><img src="assets/image/SJSJ.jpg"></div>
                            <ul>
                                <li class="first"><span class="item_name">SJSJ</span><span> 3/4 벌룬 슬리브 탑</span></li>
                                <li class="second"><span>PALE BEIGE / 82 / 1개</span></li>
                                <li class="third"><span>275,500원</span></li>
                                <li class="fourth"><span class="stage">입금대기</span><span>(2020.08.04)</span></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="order_box">
                <div class="order_info truck">
                    <div class="deliv_method">택배배송 200804P06827051</div>
                    <div class="deliv_sub">2020.08.04. 23:38:18</div>
                    <div class="menu_vertical"><img src="assets/image/bin.png"></div>
                </div>
                <ul class="order_item_ul">
                    <li>
                        <div class="order_item_content">
                            <div class="order_item_img"><img src="assets/image/SJSJ.jpg"></div>
                            <ul>
                                <li class="first"><span class="item_name">SJSJ</span><span> 3/4 벌룬 슬리브 탑</span></li>
                                <li class="second"><span>PALE BEIGE / 82 / 1개</span></li>
                                <li class="third"><span>275,500원</span></li>
                                <li class="fourth"><span class="stage">입금대기</span><span>(2020.08.04)</span></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>

        </div>

        <!-- 배송안내 -->
        <div id="info">
            <h3>주문 배송 조회 안내</h3>
            <ul>
                <li>반품신청은 배송완료 후 7일까지 가능합니다.</li>
                <li>배송지 수정은 주문완료 상태까지만 가능합니다.</li>
                <li>배송준비 중 단계에서는 주문 취소/변경이나 배송지 변경이 불가능합니다.</li>
                <li>가상계좌 결제 시, 4시간 내 입금하지 않으면 주문이 자동으로 취소됩니다.</li>
            </ul>
        </div>

    <!-- 푸터 -->
    <%@ include file="assets/inc/footer.jsp"%>    
	
	<!-- bottom_bar -->
    <%@ include file="assets/inc/bottom_bar.jsp"%>
    
    <!-- 모달(주문취소창) -->
    <div id="modal">
        <!-- 헤더 -->
        <div id="header">
            <ul>
                <li class="title"><h1>주문취소</h1></li>
                <li class="delivery_cancel close_btn"><img src="assets/image/close2.png"></a></li>
            </ul>
        </div>

        <div id="cancel_info_box">
            <p id="cancel_order_num">주문번호 : <b>200804P06827051</b></p>
            <p id="cancel_order_date">(주문일자 : <span>2020.08.04. 23:38:18)</span></p>
        </div>

        <!-- 주문 -->
        <div id="order_list_wrap">
            <div class="order_box">
                <ul class="order_item_ul">
                    <li>
                        <div class="order_item_content">
                            <div class="order_item_img"><img src="assets/image/SJSJ.jpg"></div>
                            <ul>
                                <li class="first"><span class="item_name">SJSJ</span><span> 3/4 벌룬 슬리브 탑</span></li>
                                <li class="second"><span>PALE BEIGE / 82 / 1개</span></li>
                                <li class="third"><span>275,500원</span></li>
                                <li class="fourth"><span class="stage">입금대기</span><span>(2020.08.04)</span></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div id="refund_box">
            <ul>
                <li>환불 예상내역</li>
                <li>275,000원</li>
            </ul>
        </div>

        <div id="refund_info_box">
            <div id="refund_info_box_inner_box">
                <div class="title">
                                             주문취소안내
                    <img src="assets/image/plus.png">
                </div>
                <div class="content">
                    <h5>주문취소처리</h5>
                    <ul>
                        <li>
                            카드결제 취소 : 카드 결제는 카드사로 즉시 취소 요청합니다. <br/>
                            단, 카드사에서 승인취소 처리를 하는데 2-3일이 소요될 수 있습니다.
                        </li>
                        <li>
                            실시간 계좌 이체 : 결제를 진행하신 계좌로 환불 처리 됩니다.
                        </li>
                        <li>
                            가상계좌: 등록하신 환불계좌로 2-3일내 입금처리 됩니다.
                        </li>
                        <li>
                            포인트: 주문 취소 후 즉시 복원 됩니다.
                        </li>
                        <li>
                            기프트 카드: 주문 취소 후 포인트로 복원 되며, 복원 비율은 1:1 입니다.
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="cancel_button_final">
            <span>275,000원 주문취소</span>
        </div>

        <!-- 팝업창  -->
        <div id="pop_container">
            <div id="pop">
                    <span>주문을 취소하시겠습니까?</span>
                <img src="assets/image/close2.png">
                    <span>확인</span>
            </div>
        </div>
    </div>
    
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        $(function() {
        $(".search").click(function() {
                    $(".title").toggle();
                    $(".searchbox").toggle();
                });

        $("#bottom_bar li:first-child").click(function(e) {
                e.preventDefault();
                $("#category_bar").slideToggle(100);
            });

        $("#search2 .search2 li:last-child").click(function() {
                $("#date").slideToggle(150);
            });


        // 모달창 열기
        $("#order_list_wrap .menu_vertical img").click(function(event) {
            $("#modal").addClass("open");
            $("#modal").css('overflow', 'auto');
            $('#body').css({'overflow': 'hidden', 'height': '100%'});
        });

        // + -> -
        $("#refund_info_box_inner_box .title img").click(function() {
            var src = $("#refund_info_box_inner_box .title img");
            if (src.attr("src") == "assets/image/plus.png") {
                src.attr("src", "assets/image/minus.png");
            } else {
                src.attr("src", "assets/image/plus.png");
            }
                $("#refund_info_box_inner_box .content").slideToggle(150);
            });

        // 모달창 닫기
        $("#modal .close_btn img").click(function() {
            $("#modal").removeClass("open");
            $('#body').css({'overflow': 'auto', 'height': '100%'});
        });

        // 조건검색 날짜 지정
        $("input.end").val(new Date().toISOString().substring(0, 10));
        $("input.start").attr('max', new Date().toISOString().substring(0, 10));

        // 팝업창 열기
        $("#cancel_button_final").click(function() {
            $("#pop_container").fadeIn(300);
            $("#pop").fadeIn(300);
            $('#modal').css({'overflow': 'hidden', 'height': '100%'});
        });

        // 팝업창 닫기
        $("#pop img").click(function() {
            $("#pop_container").fadeOut(300);
            $("#pop").fadeOut(300);
            $('#modal').css({'overflow': 'auto', 'height': '100%'});
        });

        // 팝업, 모달 닫기
        $("#pop span:last-child").click(function() {
            $("#pop_container").fadeOut(300);
            $("#pop").fadeOut(300);
            $("#modal").removeClass("open");
            $('#body').css({'overflow': 'auto', 'height': '100%'});
        });
    });

    </script>
</body>
</html>