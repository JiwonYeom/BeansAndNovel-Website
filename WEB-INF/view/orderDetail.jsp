<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title>orderDetail</title>
    <c:import url="template/link.jsp"></c:import>

    <style>
        body {
            width: 100%;
            font-weight: 200;
        }
        
        #contents {
            width: 980px;
            margin: auto;
            /* background-color: yellow;*/
            position: relative;
            margin-top: 10px;
        }
        
        #orderSummary {
            width: 226px;
            height: 286px;
            padding: 10px;
            border: 2px solid #E0E0E0;
            background: #fff;
            position: relative;
            float: right;
            margin-top: 50px;
            border-radius: 15px;
        }
        
        #orderSummary h3 {
            font-size: 20px;
            font-weight: 700;
            color: #1c6b10;
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 5px;
        }
        
        #orderSummary table {
            width: 190px;
            line-height: 40px;
            font-size: 15px;
            font-weight: 400;
        }
        
        #productsPrice {
            width: 185px;
            height: 100px;
            padding: 20px;
        }
        
        #total {
            width: 195px;
            height: 69px;
            line-height: 40px;
            font-size: 20px;
            font-weight: 600;
            padding: 15px;
            border-top: 1px solid #4E4E4E;
        }
        
        .totalPrice {
            color: orangered;
            font-size: 30px;
        }
        
        .btn {
            color: #fff;
            background: #48874C;
            border: none;
            width: 255px;
            height: 50px;
            font-weight: 900;
            font-size: 15px;
            position: absolute;
            bottom: 30px;
            cursor: pointer;
        }
        
        .btn:hover {
            transition: .2s ease;
            background: #417144;
        }
        
        #order {
            width: 680px;
            padding-bottom: 20px;
        }
        
        #orderInfo {
            margin-left: 25px;
            font-size: 15px;
        }
        
        .price_in_bill {
            text-align: right;
        }
        
        #order h2 {
            font-size: 35px;
            font-weight: 600;
            color: #263238;
            padding: 20px;
        }
        
        #products h3,
        #checkAddress h3,
        #howToPay h3 {
            font-size: 20px;
            font-weight: 600;
            padding-top: 10px;
            padding-bottom: 20px;
            color: #263238;
        }
        
        #products {
            width: 610px;
            min-height: 220px;
            padding: 20px;
            margin: 20px;
            /*border-radius: 20px;*/
            /*box-shadow: 10px 10px 50px #efefef;*/
            /*background-color:blue;*/
            position:relative;
        }
        
        #products a {
            text-decoration: none;
            color: #3D5AFE;
        }
        
        #products a:hover{
        	text-decoration: underline;
        }
        
        #products em {
            color: #1c6b10;
        }
        
        #products .deliver_btn {
        	border:none;
            display: inline-block;
            background-color: orangered;
            width : 80px;
            height: 25px;
            text-align: center;
            line-height: 25px;
            position:absolute;
            right: 20px;
            top: 60px;
            cursor: pointer;
            color:#FFF;
            border-radius: 5px;
            
        }
        
        #products table {
            width: 600px;
            border-top: 2px solid #424242;
            text-align: center;
        }
        
        #products th,
        #products td,
        #products tr {
            padding: 5px;
        }
        
        #products td,
        #products th {
            border-bottom: 1px solid #BDBDBD;
        }
        
        #products img {
            height: 150px;
            width: 100px;
        }
        
        #products td.align {
            /*background: yellow;*/
            line-height: 180px;
        }
        
        #products th {
            background: #E8F5E9;
            font-weight: 600;
            text-align: center;
        }
        
        .img_container {
            /*background-color: red;*/
            position:absolute;
            left:0;    
            height: 150px;
            width: 100px;
            padding: 10px;
            box-shadow: 0 0 5px 5px #e2e2e2;
            float: left;
            margin-left: 15px;
            margin-right: 20px;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        
        .book_title {
            width:366px;
            height: 190px;
            /*background-color: aqua;*/
            position:relative;
        }
        
        .selected_book_info {
            width : 210px;
            height: 100px;
            position: absolute;
            left: 150px;
            top: 30%;
            text-align: left;
            /*background-color: green; */
            /*line-height: 100px;*/
        }
        
        .selected_book_info p{
            width:210px;
            /*height:15px;*/
            margin-bottom: 8px;
            /*background-color: blue;*/
            line-height: 20px;
        }
        
        .selected_book_info .writer,
        .selected_book_info .publisher {
            font-size: 13px;
            margin-bottom: 2px;
        }
        
    </style>
</head>

   <c:import url="/header"></c:import>
    <div id="contents">
        <div id="orderSummary">
            <h3>결제금액</h3>
            <div id="bill">
                <div id="productsPrice">
                    <table>
                        <tr>
                            <td>상품금액</td>
                            <td class="price_in_bill">${order.totalPrice}원</td>
                        </tr>
                        <tr>
                            <td>배송비</td>
                            <td class="price_in_bill">무료배송</td>
                        </tr>
                    </table>
                </div> <!-- // productsPrice -->
                <div id="total">
                    <h4>총 결제금액</h4>
                    <h4 class="totalPrice">${order.totalPrice}원</h4>
                </div> <!--//total -->
            </div> <!--//bill -->
        </div> <!--orderSummary -->

        <div id="order">
            <h2>주문 상세정보</h2>
            <h3 id="orderInfo">
            	주문한 날짜 : <fmt:formatDate value="${order.regdate}" pattern="YYYY년 MM월 dd일"/> ｜ 
            	주문번호 : ${order.no}
            </h3>
            <div id="products">
                <div>
                    <h3>Beans&amp;Novels에서 주문하신 상품입니다.</h3>
                    <p>현재상태 : <em>${order.nowStatus}</em> ｜ 송장번호 : <a href="">${order.invoiceNo}</a></p>
                    <c:choose>
	                    <c:when test="${order.status=='P'}">
	                    <form action="/orderDetail/updateCancel/${orderNo}" method="POST">
	                    	<input type="hidden" name="_method" value="PUT" />
	                    	<button type="submit" class="deliver_btn deliver_cancel">주문취소</button>
	                    </form>
	                    </c:when>
                    </c:choose>
                    
                    <c:choose>
	                    <c:when test="${order.status=='D'|| order.status=='F'}">
	                    <form action="/orderDetail/updateRefund/${orderNo}" method="POST">
	                    	<input type="hidden" name="_method" value="PUT" />
	                    	<button type="submit" class="deliver_btn deliver_return">반품신청</button>
	                    </form>
	                    </c:when> 
                    </c:choose>
                    <!-- 반품신청 버튼 밑에 주문취소 버튼 있음! position : absolute때문에 !!! -->
                </div>
                <hr/>
                <h3>상품정보</h3>
                <table>
                    <thead>
                        <tr>
                            <th>상품리스트</th>
                            <th>수량</th>
                            <th>합계</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="book">
                        <tr>
                            <td class="book_title">
                                <div class="img_container">
                                    <img src="${book.bookCover}" alt="${book.title}" />
                                </div> 
                                <div class="selected_book_info">
                                    <p>${book.title}</p>
                                    <p class="writer">작가 : ${book.writer}</p>
                                    <p class="publisher">출판사 : ${book.publisher}</p>
                                </div>
                            </td>
                            <td class="align">${book.quantity}</td>
                            <td class="align">${book.totalPrice}</td>
                            <td class="align">${order.nowStatus}</td>
                        </tr>
                    </c:forEach>    
                    </tbody>
                </table>
            </div> <!--//products -->
        </div> <!--//order-->
    </div> <!--//contents -->
    <c:import url="template/footer.jsp"></c:import>
    <script src="/js/jquery.js"></script>
    <script src="/js/template.js"></script>
    <script>

        //고정값이기 때문에
        //단 한번만 얻어와도 됩니다.
        var stickyTop =
            $("#contents").offset().top;
        var offset = $("#contents").offset();

        offset.top;
        offset.left;

        $(window).scroll(function () {

            var scrollTop = $(this).scrollTop();

            if (scrollTop >= stickyTop) {
                $("#orderSummary").css({
                    "position": "fixed",
                    "left": offset.left + 730,
                    "top": "50px",
                    "margin-top": 0
                });
            } else {
                $("#orderSummary").css({
                    "position": "relative",
                    "left": 0
                });
            }
        });
        
        $("#products .deliver_cancel").click(function() {
        	
    		var result = confirm("주문을 취소하시겠습니까?");
    		
    		if(result) {
    			// yes
    			location.replace('/orderDetail/${orderNo}');
    		} else {
    			// no
    		}
    		
    	});
    	
    	$("#products .deliver_return").click(function() {
    		
    		var result = confirm("반품신청을 하시겠습니까?");
    		
    		if(result) {
    			// yes
    			location.replace('/orderDetail/${orderNo}');
    		} else {
    			// no
    		} 
    		
    	});
    	
    </script>
</body>

</html>