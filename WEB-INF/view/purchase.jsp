<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title>결제페이지</title>
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
            
        }
        #orderSummary {
            width: 226px;
            height: 346px;
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
            line-height: 50px;
            font-size: 18px;
            font-weight: 400;
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
            background: linear-gradient(#1c6b10,#08511c);
            border: none;
            width: 205px;
            height: 45px;
            font-weight: 900;
            font-size: 15px;
            position: absolute;
            bottom: 20px;
            cursor: pointer;
            border-radius: 5px;
            font-family: 'Kakao',sans-serif;
        }
        
        .btn:hover {
            transition: .2s ease;
            background: linear-gradient(#08511c,#08511c);
        }
        
        .bigbtn {
            margin-left: 10px;
        }
        
        #order {
            width: 680px;
            padding-bottom: 20px;
/*            box-shadow: 0 16px 28px 0 rgba(0, 0, 0, 0.22), 0 25px 55px 0 rgba(0, 0, 0, 0.21);*/
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
        
        #order th {
            font-weight: 600;
            text-align: center;
        }
        
        #products h3,
        #checkAddress h3,
        #howToPay h3 {
            font-size: 25px;
            font-weight: 600;
            padding-bottom: 15px;
            color: #263238;
        }
        
        #products {
            width: 610px;
            min-height: 220px;
            padding: 20px;
            margin: 20px;
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
        
                
        #checkAddress .address_detail span{
            /*background: red;*/
            display: inline-block;
            margin-top: 5px;
            margin-bottom: 5px;
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
        
        #checkAddress {
            width: 610px;
            height: 170px;
            padding: 20px;
            margin: 20px;
            position: relative;
        }
        
        #checkAddress td,
        #checkAddress tr,
        #checkAddress th {
            padding: 5px;
        }
        
        #checkAddress table {
            width: 600px;
            border-top: 2px solid #424242;
        }
        
        #checkAddress td,
        #checkAddress th {
            border-bottom: 1px solid #BDBDBD;
        }
        
        .add_address {
            width: 130px;
            position: absolute;
            top: 0px;
            right: 30px;
        }
        
        #howToPay {
            width: 610px;
            height: 220px;
            padding: 20px;
            margin: 20px;
        }
        
        #howToPay h3 {
        	padding-top:40px; /* 추가 */
        	
        }
        #howToPay td,
        #howToPay tr {
            padding: 5px;
        }
        
        #howToPay table {
            width: 600px;
            border-top: 2px solid #424242;
        }
        
        #howToPay td {
            border-bottom: 1px solid #BDBDBD;
        }
        
        .title_in_table,
        #products th,
        #checkAddress th {
            background: #E8F5E9;
        }
        
        /* 배송지 선택 팝업 */
        #addressPopupWrap{
            background: rgba(0,0,0,.4);
            position: fixed;
            width: 100%;
            height: 100%;
            z-index: 6;
            display: none;
        }
        #addressPopupBox{
            background: white;
            min-width: 400px;
            height: 550px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -200px;
            margin-top: -250px;
            border-radius: 10px;
        }
        #addressPopupBox h3{
            font-size: 25px;
            height: 39px;
            line-height: 39px;
            font-weight: 700;
            text-align: center;
            background: #424242;
            color: white;
            border-bottom: 1px solid #424242;
        }
        #addressChoice span{
            font-size: 15px;
            display: inline-block;
            margin-bottom: 10px;
        }
        #addressChoice,#addressChoice ul{
            width: 380px;
            height: 480px;       
        }
        #addressChoice{
            width: 430px;
            /*background-color: yellow;*/
            margin: 10px;
            overflow-y: scroll;
            border-bottom: 1px solid #424242;
        }
        #addressChoice ul{
            margin: auto;
        }
        #addressChoice ul li{
            background: white;
            width: 380px;
            min-height: 10px;
            border-bottom: 1px solid #424242;
            font-weight: 700;
            padding-left: 5px;
            padding-top: 15px;
            padding-bottom: 10px;
            cursor: pointer;
        }
        #addressChoice ul li:hover{
            background-color: #EEEEEE;
        }
       #addressChoice ul li.choice_event{
            background-color: #E0E0E0;
        }
        #addressChoice ul li:first-child{
            border-bottom: 1px solid #424242;
            /*background: green;*/
        }
        #addressChoice ul li:last-child{
            border-bottom: none;
           /* background: silver;*/
        }
        #addressChoice a{
            display: block;
            width: 380px;
            min-height: 80px;
            text-decoration: none;
            color: black;
        }
        .change_address{
            margin: auto;
            width: 270px;
            /*background-color: blueviolet;*/
            text-align: center;
        }
        .change_address button{
            width: 100px;
            height: 30px;
            line-height: 28px;
            background:#2E7D32;
            cursor: pointer;
            margin: 0 5px;
            border: none;
            /*border-radius: 5px;*/
            color: white;
        }
        .change_address button:hover {
            transition: .2s ease;
            background: linear-gradient(#08511c,#08511c);
        }
        .choice_address_name{
            color: #388E3C;
            margin-top: 10px;
        }
    </style>
</head>

<c:import url="template/purchase-ex.jsp"></c:import>
<c:import url="/header"></c:import>

    <div id="contents">
    <form action="/purchaseFinished"  method="post">
        <div id="orderSummary">
            <h3>결제내역</h3>
            <input type="hidden" name="userNo" value="${login.no}"/>
            <input type="hidden" name="totalPrice" value="${total}"/>
            
            
            <div id="bill">
                <div id="productsPrice">
                    <table>
                        <tr>
                            <td>상품금액</td>
                            <td class="price_in_bill">${total }원</td>
                        </tr>
                        <tr>
                            <td>배송비</td>
                            <td class="price_in_bill">무료배송</td>
                        </tr>
                    </table>
                </div>
                <!--//productsPrice -->
                <div id="total">
                    <h4>총 결제금액</h4>
                    <h4 class="totalPrice">${total }원</h4>
                </div>
                <!--//total -->
                	
					<button class="btn bigbtn" type="submit">구매하기</button>
				
            </div>
            <!--//bill -->
        </div>
        <!--orderSummary -->

        <div id="order">
            <h2>주문 및 결제</h2>
            <div id="products">
                <h3>상품정보</h3>
                <table>
                    <thead>
                        <tr>
                            <th>상품리스트</th>
                            <th>가격</th>
                            <th>수량</th>
                            <th>합계</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    <c:forEach items="${bookList }" var="book">
                       <tr>
                       <input type="hidden" name="cartNo" value="${book.no }"/>
                       <input type="hidden" name="bookNo" value="${book.bookNo}"/>
                           <td class="book_title">
                               <div class="img_container">
                                   <img src="${book.bookCover }" alt="${book.title }"  name="bookCover"/>
                               </div>
                               <div class="selected_book_info">
                                   <p>${book.title }</p>
                                   <c:if test="${book.writer != '지은이가 없습니다.' }">
                                   <p class="writer" name="writer">작가 : ${book.writer }</p>
                                   </c:if>
                                   <p class="publisher" name="publisher">출판사 : ${book.publisher }</p>
                               </div>
                           </td>
                           <td class="align">${book.salesPrice }원</td>
                           <td class="align" >${book.quantity }개</td>
                           <td class="align" >${book.eachTotal }원</td>
                           <input type="hidden" name="quantity" value="${book.quantity}"/>
                           <input type="hidden" name="bookCover" value="${book.bookCover}"/>
                           <input type="hidden" name="eachTotal" value="${book.eachTotal}"/>
                           <input type="hidden" name="title" value="${book.title}"/>
                           <input type="hidden" name="writer" value="${book.writer}"/>
                           <input type="hidden" name="publisher" value="${book.publisher}"/>
                       </tr>
                       </c:forEach>
                    </tbody>
                </table>

            </div>
            <!--//products -->

            <div id="checkAddress">
                <h3>기본 배송지</h3>
                <table>
                    <thead>
                        <tr>
                            <th>배송지</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="address_detail">
                            <input type="hidden" name="zipcode" value="${oneAddress.zipcode }"/>
                            <input type="hidden" name="address" value="${oneAddress.address }"/>
                                배송지  명 : <span>${oneAddress.name }</span><br />
                                우편번호 : <span>${oneAddress.zipcode }</span><br />
                                받으시는분 : <span>${oneAddress.recipient }</span><br />
                                배송지주소 : 
                                <span>${oneAddress.address }</span><br />
                                연락처 : <span>${oneAddress.phone }</span>               
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button id="addressAddBtn" class="btn add_address">배송지 변경</button>

            </div>
            <!--//checkAddress -->

            <div id="howToPay">
                <h3>결제정보</h3>
                <table>
                    <tbody>
                        <tr>
                            <td for="payment" class="title_in_table">결제수단 선택</td>
                            <td>
                                <p>
                                  <span>
                               		<input id="creditCard" class="payment" name="payment" value="" type="radio" checked/>
                               		<label for="creditCard">신용카드</label>
                                
                            		<input id="phone" class="payment" name="payment" value="" type="radio"disabled />
                               		<label for="phone">휴대폰 결제</label> 
                               
                               		<input id="account" class="payment" name="payment" value="" type="radio" disabled/>
                               		<label for="account">무통장입금</label>
                               	</span>
                                </p>
                            </td>
                        </tr>
                        <!-- 신용카드로 결제시 -->
                        <tr>
                            <td class="title_in_table"> 카드선택</td>
                            <td>
                                <select>
                                    <option value="">선택하세요.</option>
                                    <option value="">신한</option>
                                    <option value="">BC</option>
                                    <option value="">KB국민</option>
                                    <option value="">삼성</option>
                                    <option value="">현대</option>
                                    <option value="">롯데</option>
                                    <option value="">하나SK</option>
                                    <option value="">외환</option>
                                    <option value="">NH채움</option>
                                    <option value="">씨티</option>
                                    <option value="">우리</option>
                                    <option value="">IBK기업은행</option>
                                    <option value="">수협</option>
                                    <option value="">신협</option>
                                    <option value="">우체국</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="title_in_table">할부개월</td>
                            <td>
                                <select>
                                    <option value="">일시불</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
            <!--//howToPay -->
        </div>
        <!--//order-->
        </form>
    </div>
    
    
    <!--//contents -->
   <c:import url="template/footer.jsp"></c:import>
    <script src="/js/jquery.js"></script>
    <script src="/js/template.js"></script>
    <script>
        var $addressPopupWrap = $("#addressPopupWrap");
        
        
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
            }//if else end
        });//scroll end
        $("#addressAddBtn").click(function(e){
        	e.preventDefault();
        	//alert("here");
            location.href="/mypage";
        })
/*         $("#addressAddBtn").click(function(e){
        	e.preventDefault();
        	//alert("here");
            $addressPopupWrap.fadeIn();
            $("html").css("overflow-y","hidden");
        })
 */
        $("#changeCancelBtn").click(function(){
            $addressPopupWrap.fadeOut();
            $("html").css("overflow-y","scroll");
        })

        //배송지 선택창에서 클릭시 배경색 바뀜
        $("#addressChoice ul li").click(function(){
            //alert("test");
            $(".choice_event").removeClass("choice_event");
            $(this).addClass("choice_event");
        })

        $("#changeBtn").click(function(){
            var changeCheckMsg = confirm("변경 하시겠습니까?");
            if(changeCheckMsg == false){
            	//alert("선택되지 않었습니다.");
               return false;
			}
        })
    </script>
</body>

</html>