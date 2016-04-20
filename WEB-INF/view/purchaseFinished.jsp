<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Beans&amp;Novel Bookstore</title>
	<c:import url="template/link.jsp"></c:import>
    <style>
        #contents {
            width: 980px;
            height: 350px;
            margin: auto;
            font-weight: 900;
            font-size: 20px;
            text-align: center;
        }
        
        #contents h1,
        #contents h2,
        #contents h3 {
            margin-bottom: 18px;
        }
        
        #contents h1 {
            color: #1c6b10;
            font-size: 30px;
            padding-top: 40px;
        }
        
        #contents a {
            text-decoration: none;
            color: #3D5AFE;
        }
        
        #contents a:hover {
            text-decoration: underline;
        }
        
        .total_price {
            color: orangered;
        }
    </style>
</head>
<c:import url="/header"></c:import>

        <div id="contents" class="hide_area">
            <div id="contents" class="hide_area">
                <div class="aux">
                <input type="hidden" name="userNo" value="${loginUser.no}"/>
                <input type="hidden" name="no" value="${orderList.no}"/>
                    <h1>주문해 주셔서 감사합니다!</h1>
                    <h2>주문번호 : <a href="/orderDetail/${orderList.no }">${orderList.no }</a> </h2>
                    <h2>주문총액 : <em class="total_price">${orderList.totalPrice }원</em></h2>
                    <h3>주문 상세내역이 곧 고객님의 이메일로 발송됩니다.</h3>
                </div>
                <!--//aux end -->
            </div>
            <!-- //contents -->
        </div>
        <!-- //contents -->

<c:import url="template/footer.jsp"></c:import>
    <script src="js/jquery.js"></script>
    <script src="js/template.js"></script>
    <script>
    
    
        
</script>
</body>

</html>