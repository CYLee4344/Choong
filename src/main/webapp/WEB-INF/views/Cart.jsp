<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>THE SELECTION</title>
<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
<title>Insert title here</title>
</head>
<body>
<h2>장바구니</h2>
            <c:forEach var="row" items="${list}">
                <tr align="center">
                    <td>${row.product_name}</td>
                    
                    <td><fmt:formatNumber value="${row.product_price}"
                            pattern="#,###,###" /></td>
                    <td>
                    	<img src="${pageContext.request.contextPath}/${row.product_img}">
                    </td>
                    <td>
                       ${row.product_brand}
                    </td>
                </tr>
            </c:forEach>
            </table>
            <button id="btnUpdate">수정</button>
            <button type="button" id="btnDelete">장바구니 비우기</button>
            //btnUpdate와 btnDelete id는 위쪽에 있는 자바스크립트가 처리한다.

<button type="button" id="btnList">상품목록</button>
</body>
</html>