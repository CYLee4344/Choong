<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>THE SELECTION</title>
    <link rel="stylesheet" type="text/css" href="assets/css/MyPage.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
</head>

<body>
	<div id="header">
        <h2>마이페이지</h2>
        <a href="index.do"><img src="assets/image/close2.png"></a>
    </div>

    <ul id="menu_top">
        <li>주문</li>
        <li>혜택</li>
        <li>정보</li>
        <li>활동</li>
    </ul>

    <div id="inner_container">
    </div>

    <div id="menu_bottom_container">
        <ul id="menu_bottom">
            <li><a href="Update_Info.do">개인정보변경</a></li>
            <li><a href="${pageContext.request.contextPath}/orderList.do">주문/배송조회</a></li>
            <li><a href="QnA.do">QnA</a></li>
            <li><a href="Announcement.do">공지사항</a></li>
        </ul>
    </div>


    <div id="bottom">
    	<b class="user_name">${user.user_name}님</b>
        <a href="UserLogout.do" class="logout">로그아웃</a>
    </div>

</body>
</html>