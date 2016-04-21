<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title>장바구니</title>

<c:import url="template/link.jsp"></c:import>


    <style>
        html {
            width: 100%;
            height:100%;
        }
        
        body {
            width: 100%;
            font-family: 'bon', sans-serif;
            font-weight: 200;
        }
        
        #contents {
            width: 980px;
            overflow: hidden;
            margin: 0 auto;
            padding-top: 50px;
            
        }
        
        #aux {
            padding-top: 20px;
            /*            background-color: aliceblue;*/
            /*box-shadow: 0 -10px 30px 5px #e8e8e8;*/
        }
        
        #itemBox table {
            border-top: 1px solid #999;
            border-bottom: 1px solid #999;
            /*box-shadow: 0 5px 20px 3px #e8e8e8;*/
        }
        
        #itemBox th {
            height: 20px;
            border-bottom: 1px solid #e0e0e0;
            text-align: center;
            font-weight: 300;
            line-height: 50px;
            width: 50px;
        }
        
        #itemBox th:last-child {
            width: 120px;
        }
        
        #itemBox td {
            text-align: center;
            padding-top: 20px;
            padding-bottom: 30px;
            border-top: 1px solid #e0e0e0;
        }
        
        #itemBox td:nth-child(1) {
        padding-left:20px;
            text-align: left;
            /*            padding-left: 50px;*/
            /*            background-color: yellow;*/
        }
        
        #itemBox td:nth-child(2) {
            width: 100px;
        }
        
        #itemBox td:nth-child(4) {
            font-weight: bold;
            color: orangered;
        }
        
        .img_container {
            float: left;
            width: 80px;
            background-color: white;
            padding: 10px;
            box-shadow: 0 0 5px 5px #e2e2e2;
            margin-right: 25px;
        }
        
        .img_container img {
            width: 80px;
            height: 120px;
        }
        
        .info_box {
            width: 350px;
            line-height: 23px;
        }
        
        .info_box h2 {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 10px;
        }
        
        .info_box p {
            font-size: 15px;
            line-height: 20px;
            margin-top: 10px;
            color: gray;
        }
        
        #itemBox .non_dc {
            font-size: 13px;
            text-decoration: line-through;
            color: gray;
            line-height: 30px;
        }
        
        #itemBox h3 {
            font-size: 15px;
            line-height: 17px;
            font-weight: 200;
            margin-bottom: 3px;
        }
        
        .quantity {
            width: 80px;
        }
        
        .quantity input {
            width: 40px;
            height: 30px;
            padding-right: 5px;
            text-align: center;
            margin-bottom: 8px;
            border-radius: 5px;
            border: 1px solid gray;
            background: linear-gradient(#e2e2e2, #FFF);
        }
        
        .quantity a {
            display: block;
            text-decoration: none;
            color: darkblue;
            font-size: 15px;
            line-height: 20px;
            margin-bottom: 3px;
            color:#424242;
        }
        
        .quantity a:hover {
            text-decoration: underline;
        }
        
        #noItemBox {
            width: 700px;
            height: 400px;
            /*            background-color:pink;*/
            
        }
        
        #noItemBox h2 {
            padding-top: 120px;
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            color: gray;
        }
        
        #noItemBox h2 a {
            font-size: 17px;
            display: block;
            margin-top: 40px;
            text-decoration: none;
            color: #1c6b10;
        }
        
        #noItemBox h2 a:hover {
            text-decoration: underline;
        }
        
        #itemBox {
            width: 700px;
            min-height: 300px;
            margin-bottom:0;
            padding-bottom:0;
            /*            display: none;*/
        }
        #itemBox h1{
            font-size: 20px;
            margin-bottom: 10px;
        }
        #summaryBox {
            background-color: white;
            width: 230px;
            min-height: 150px;
            /*            background-color: yellow;*/
            float: right;
            border: 1px solid #999;
            border-radius: 5px;
            padding: 15px 20px 20px 15px;
        }
        
        #summaryBox h3 {
            font-size: 25px;
            font-weight: 500;
            color: #1c6b10;
            margin-bottom: 10px;
        }
        
        #summaryBox table {
            line-height: 30px;
        }
        
        #summaryBox th,
        #summaryBox td {
            width: 250px;
        }
        
        #summaryBox td:nth-child(even) {
            text-align: right;
        }
        
        #summaryBox hr {
            margin-bottom: 30px;
        }
        
        #summaryBox .total {
            float: left;
            width: 40%;
            /*            background-color: pink;*/
            font-size: 20px;
        }
        
        #summaryBox #totalPrice {
            float: left;
            width: 60%;
            /*            background-color: orange;*/
            text-align: right;
            font-size: 20px;
            font-weight: 600;
            color: orangered;
        }
        
        #summaryBox button {
            margin-top: 20px;
            height: 40px;
            width: 100%;
            border: solid 1px gray;
            border-radius: 5px;
            background: linear-gradient(#1c6b10,#08511c);
            color: white;
            cursor: pointer;
            
        }
        #summaryBox button:active{
            background:#08511c;
        }
    
        #deleteSelected{
            border: 1px solid #1c6b10;
            background:white;
            color: #1c6b10;
            border-radius: 5px;
            cursor:pointer;
            margin-bottom: 10px;
        }
        #deleteSelected:hover{
            background:#d7e8dc;
            
        }
        
              #recentViewList {
            height:355px;
            margin-top: 20px;
            /*background-color: burlywood;*/
        }
        
        .contents_wrap {
            position: relative;
            width:700px;
/*            background: violet;*/
            
        }

        
        .contents_wrap .left,
        .contents_wrap .right {
            width: 40px;
            height: 40px;
            border-radius: 20px;
            position: absolute;
            top:100px; /* 175px or 135px */
            font-size: 25px;
            line-height: 40px;
            text-align: center;
            z-index: 1;
            cursor: pointer;
            background-color: #FFF;
            /*box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);*/
        }
        
        .contents_wrap .left {
            left: 0;
            text-indent: -2px;
        }

        .contents_wrap .right {
            right: 0;
            text-indent: 2px;
        }
        
        .contents_title {
            position: relative;
            /*background-color: red;*/
        }
        
        .contents_title h2 {
            font-size: 20px;
            display: inline-block;
            font-weight: 600;
            margin-left:0px;
            color:#1c6b10;
            text-indent:25px;
            /*background-color: green;*/
        }
        
        .contents_title .more_btn {
            font-size: 15px;
            display: inline-block;
            position: absolute;
            padding: 5px 10px; 
            top: 0;
            right: 0;
            color: #424242;
            text-decoration: none;
            border-radius: 3px;
            border: 1px solid #BDBDBD;
            background-color: #EEEEEE;
            margin-top:-4px;
        }
        
        .contents_all {
            width: 700px;
            height: 320px;
            margin-top:15px;
            /*position:relative;*/
            background-color: aqua;
/*            display: none;*/
        } 
        
                .no_recent{
/*            background-color: pink;*/
            width:100%;
            height:400px;
                    display: none;
        }
        .no_recent h2{
            text-align: center;
            font-size:25px;
            font-weight: 400;
            line-height: 200px;
        }
        .book_list_wrap {
            width: 700px;
            height: 320px;
            position: relative;
            margin: auto;
            background-color: white;
            overflow: hidden;
        }
        
        .contents_list {
            width: 1400px;
            height: 320px;
            position: absolute;
            left:0;
            top:0;
            overflow: hidden;
/*            background-color: rebeccapurple;*/
        }
        
        .list{
            width: 700px;
            height: 320px;
            position: absolute;
            padding: 0 20px;
            /*background:#FFF;*/
            
            
        }
        
        .contents_list .first{
/*            background-color: red;*/
        }
        
        .contents_list .second{
/*            background: gray;*/
            left:700px;
            
        }
        
        .contents_list {
            width: 840px; /*width: 2560px;*/
            height: 320px;
            top: 0;
            left: 0;
            transition: .5s ease;
/*            background-color: cadetblue;*/
        }
        
        .contents_list2 {
            width: 840px;
            height: 320px;
            background-color: blueviolet;
            left: 840px;
            /**/ display: none;
        }
        
        .contents_list .books_info{
            width: 140px;
            height: 250px;
            margin-left: 20px; 
            float: left;  
            white-space: nowrap;
       	overflow:hidden;
       	text-overflow:ellipsis;
            /*background-color: antiquewhite;*/
        } 
        
        .contents_list .books_info:first-child {
            margin-left:0px;
        }
        
        .contents_list .books_info .contents_books{
            width:120px;
        } 
        
        .contents_list .books_info .contents_books img {
            width: 120px;
            height: 170px; 
            margin-bottom: 12px;
            margin: auto;
        }
        
        .contents_list .books_info .contents_books p {
            text-align: center;
            margin-bottom: 7px;
        }
        
        .contents_list .books_info .contents_books a {
            text-decoration: none;
        }
        
        .contents_list .books_info .contents_books .book_name {
            line-height: 20px;
        }
        
        .contents_list .books_info .contents_books .book_grade {
            width: 120px;
            height: 23px;
            /*background-color: aquamarine;*/
            background-image: url(img/stars.png);
            background-position: 0px 0px; 
            background-repeat: no-repeat;
            margin: -1px auto;
            
        }
        
        .contents_list .books_info .contents_books .book_grade .txt_grade{
            width: 95px;
            height: 23px;
            /*background-color: red;*/
            background-image: url(img/stars.png);
            background-position: 0 -25px;
            background-repeat: no-repeat;
            /*margin: -1px auto;*/
        }
        hr{
            width:90%;
        }
        .change_quantity {
            /*background-color: red;*/
            text-align: center;
        }
        .quantity a.minus,
        .quantity a.plus {
            display: inline-block;
            color:#424242;
            font-size: 20px;
        }
        #cover{
        position:fixed;
        left:0;
        top:0;
        width: 100%;
        height: 100%;
        z-index:10;
        
        background-color:rgba(255,255,255,.7);
		background-image:url(/img/ajax-loader.gif);
		background-position: center;
		background-repeat: no-repeat;
		display:none;
        }
        a{
        text-decoration:none;
        color:black;}
        
    </style>
</head>

<c:import url="/header"></c:import>

 
    <div id="contents">
    
        <div id="aux">
            <div id="summaryBox">
                <h3>결제내역</h3>
                <table>
                    <tbody>
                        <tr>
                            <td>상품총금액</td>
                            <td><span id="subPrice">${totalPrice }</span>원</td>
                        </tr>
                        <tr>
                            <td>주문상품수량</td>
                            <td><span id="subCount">${totalCount }</span>개</td>
                        </tr>
                        <tr>
                            <td>배송비</td>
                            <td>0원</td>
                        </tr>
                    </tbody>
                </table>
                <hr/>
                <p class="total">주문합계: </p>
                <p id="totalPrice">${totalPrice }원</p>
                <form action=""  id="finalize">
                <button>주문하기</button>
                </form>
            </div>
            
            <!--아무것도 담기지 않았을 때-->
            <c:choose>
           <c:when test="${totalCount==0 }">
          
            <div id="noItemBox">
                <h2>아직 장바구니에 담긴 도서가 없습니다.
        <a href="/index">쇼핑 계속하기</a></h2>

            </div>
        </c:when>
            <c:otherwise>
            <div id="itemBox">
                <!--<h1>총 3개의 상품이 있습니다</h1>-->
                
                <table border="1">
                    <thead>
                        <tr>
                            
                            <th>상품정보</th>
                            <th>판매가</th>
                            <th>수량</th>
                            <th>합계</th>
                        </tr>
                    </thead>
                    <tbody class="item_list">
                    <!-- 템플릿 삽입 -->
                    
                    </tbody>
                </table>
	
                     </div>
                     </c:otherwise>
                </c:choose>
                 
                <script type="text/template" id="cartTmp">
                <@_.each(bookList,function(book){@>
                        <tr>
                            
                            <td>
                            
                                <div class="img_container"><a href="/bookDetail/<@=book.bookNo@>"><img src="<@=book.bookCover @>"  alt="<@=book.title @>"/></a></div>
                                <div class="info_box">
                                    <h2><a href="/bookDetail/<@=book.bookNo@>"><@=book.title @> </a></h2>
                                    <h3>작가: <a href="/book/writer/<@=book.writer@>/page/1"><@=book.writer @></a></h3>
                                    <h3>출판사: <a href="/book/writer/<@=book.publisher@>/page/1"><@=book.publisher @></a></h3>
                                    <!-- 3월 30일 - 오늘 날짜에 이틀 더하기 -->
                                    <!-- <p>오늘 안에 주문하시면 <em>3월 30일</em>에 받으실 수 있습니다</p>-->
                                </div>
                            </td>
                            <td>
                                <p class="sales_price"><@=book.salesPrice @>원</p>
                                <p class=non_dc>24,000원</p>
                            </td>
                            <td class="quantity">
                                <input type="text" class="item_quantity" name="quantity" value="<@=book.quantity @>" data-no="<@=book.no@>"/>
                                <div class="change_quantity">
                                    <a href="" title="수량변경" class="minus" data-no="<@=book.no @>" data-price="<@=book.salesPrice @>">
                                        <i class="fa fa-minus-circle"></i>
                                    </a>
                                    <a href="" title="수량변경" class="plus" data-no="<@=book.no @>" data-price="<@=book.salesPrice @>">
                                        <i class="fa fa-plus-circle"></i>
                                    </a>
                                    <!--<a href="" title="수량변경">수량변경</a>-->
                                </div>
								<form action="/cart/delete" method="POST">
								<input type="hidden" name="_method" value="DELETE"/>
								<input type="hidden" name="itemNo" value="<@=book.no@>"/>
                                <button type="submit" title="삭제" class="item_delete" data-no="<@=book.no @>">삭제</a>
								</form>
                            </td>
                            <td class="total_price">
                                <span class="calcPrice"><@=book.quantity * book.salesPrice@></span>원
                            </td>
                        </tr>
                        
                        <@});@>
                        
</script>

            <!--//itemBox-->
                
                
    <!--최근본상품-->
    
                <div id="recentViewList">
    <script type="text/template" id="bookTmp">
                    <@_.each(recents, function(book){@>
                        <div class="books_info">
                                    <div class="contents_books">
                                        <a href="/bookDetail/<@=book.no@>">
                                            <img src="<@=book.bookCover@>" />
                                        </a>
                                        <p class="book_name"><a href="/bookDetail/<@=book.no@>"><@=book.title@></a></p>
                                        <p class="book_author"><a href="/book/writer/<@=book.writer@>/page/1"><@=book.writer@></a></p>
                                        <div class="book_grade">
                                            <div class="txt_grade" style="width:<@=book.rating *12@>px"></div>    
                                        </div> 
                                    </div>
                                </div> 
                    <@ }); @>
                </script>
            <div class="contents_wrap"> <!-- position:relative 상태 -->
               
                <div class="contents_title">
                    <h2>최근 본 도서</h2>
                    
                    
                    
                </div> <!-- // contents_title -->   
               <div class="no_recent">
                    <h2>최근 본 도서가 없습니다</h2>
                    </div>
                <div class="contents_all">
                    
                     
                    <div class="book_list_wrap recent">
                        <div class="contents_list">
                            <div class="list">
                                <div class="books_info">
                                    <div class="contents_books">
                                        <a href="">
                                            <img src="img/book1.jpg" />
                                        </a>
                                        <p class="book_name"><a href="">나미야 잡화점의 기적</a></p>
                                        <p class="book_author"><a href="">히가시노 게이고</a></p>
                                        <div class="book_grade">
                                            <div class="txt_grade"></div>    
                                        </div> <!-- // book_grade -->
                                    </div> <!-- // contents_books -->
                                </div> <!-- // books_info --> 

                                <div class="books_info">
                                    <div class="contents_books">
                                        <a href="">
                                            <img src="img/book2.jpg" alt="나미야 잡화점의 기적 이미지" />
                                        </a>
                                        <p class="book_name"><a href="">나미야 잡화점의 기적</a></p>
                                        <p class="book_author"><a href="">히가시노 게이고</a></p>
                                        <div class="book_grade">
                                            <div class="txt_grade"></div>    
                                        </div> <!-- // book_grade -->
                                    </div> <!-- // contents_books -->
                                </div> <!-- // books_info -->  

                                <div class="books_info">
                                    <div class="contents_books">
                                        <a href="">
                                            <img src="img/book3.jpg" alt="나미야 잡화점의 기적 이미지" />
                                        </a>
                                        <p class="book_name"><a href="">나미야 잡화점의 기적</a></p>
                                        <p class="book_author"><a href="">히가시노 게이고</a></p>
                                        <div class="book_grade">
                                            <div class="txt_grade"></div>    
                                        </div> <!-- // book_grade -->
                                    </div> <!-- // contents_books -->
                                </div> <!-- // books_info --> 

                                <div class="books_info">
                                    <div class="contents_books">
                                        <a href="">
                                            <img src="img/book1.jpg" alt="나미야 잡화점의 기적 이미지" />
                                        </a>
                                        <p class="book_name"><a href="">나미야 잡화점의 기적</a></p>
                                        <p class="book_author"><a href="">히가시노 게이고</a></p>
                                        <div class="book_grade">
                                            <div class="txt_grade"></div>    
                                        </div> <!-- // book_grade -->
                                    </div> <!-- // contents_books -->
                                </div> <!-- // books_info -->   

                                
                            </div><!-- first -->
                            <div class="second list hide"></div>
                        </div><!-- contentsList -->
                            
                    </div> <!-- // book_list_wrap -->
                </div> <!-- // contents_all -->
                
                
            </div> <!-- // contentsWrap -->            
        </div> <!-- //contentsMiddle -->
        </div>
        <!--//aux-->
        </div>
        <div id="cover">
    </div>
    <!--//contents-->
    
        
<c:import url="template/footer.jsp"></c:import>
    <script src="/js/jquery.js"></script>
    <script src="/js/underscore-min.js"></script>
    <script src="/js/template.js"></script>
    <script>
    _.templateSettings = {
    		interpolate : /\<\@\=(.+?)\@\>/gim,
    		evaluate : /\<\@(.+?)\@\>/gim,
    		escape : /\<\@\-(.+?)\@\>/gim
    	};
    
    var $itemList= $('tbody.item_list');
    displayCartList();
    
    
    
//        var stickyTop =
//            $("#aux").offset().top;
        var offset = $("#aux").offset();

//        offset.top;
//        offset.left;

        $(window).scroll(function () {

            var scrollTop = $(this).scrollTop();

            if (scrollTop >= offset.top) {
                $("#summaryBox").css({
                    "position": "fixed",
                    "left": offset.left + 713,
                    "top": "30px",
                    "margin-top": 0
                });
            } else {
                $("#summaryBox").css({
                    "position": "relative",
                    "left": 0
                });
            }
        });
        
    //?왜 한번 하고 나면 안되지;
        var $checkAll = $("#checkAll"),
            $checkBox = $("input:checkbox");
        $checkAll.click(function(){
            //alert("dd");
            var check = $(this).is(":checked");
            //alert(check);
            if(check){
                $checkBox.prop("checked",true);    
            }else{
                $checkBox.prop("checked",false);    
            }//else
        });//checkAll end
        /*$checkAll.click(function(){
            $checkBox.attr("checked","checked")
        });*/
        
      
       	
         //-,+클릭시 수량 바꾸기
         $('.item_list').on('click','.minus',function(e){
        	 e.preventDefault();
			 var val =$(this).parents(".quantity").children('.item_quantity').val(); 
        	 //alert(val);
        	 var $this=$(this);
        	 if(val>0){
        		 val--;
        		 calculateTotal(val,$this);
        		 //함수호출
        	 }
         });
         
         $('.item_list').on('click','.plus',function(e){
        	 e.preventDefault();
        	 var val =$(this).parents(".quantity").children('.item_quantity').val();
        	
        	 val++;
        	// alert("plus:"+val);
        	 var $this=$(this);
        	 calculateTotal(val,$this);
      
         });
         
         function calculateTotal(val,$this){
        	 var price = $this.attr("data-price");
        	 //alert(val);
        	 $this.parents(".quantity").children('.item_quantity').val(val);
        	 $this.parents(".quantity").siblings('.total_price').children('span').text(val*price);
        	 
        	 calcSumCount();
        	 calcSumPrice();
        	 
         }
         
         function calcSumCount() {
        	 var total = 0;
        	 $(".quantity .item_quantity").each(function() {
        		 //alert($(this).val());
        		 total+= parseInt($(this).val());
        	 });
        	 $('#subCount').text(total);
        	 
         }
         
         function calcSumPrice() {
        	 var total = 0;
        	 $(".calcPrice").each(function() {
        		 total+= parseInt($(this).text());
        	 });
        	 $('#subPrice').text(total);
        	 $('#totalPrice').text(total+"원");
        	 
         }
         
         //상품 지우기
/*          $('.item_list').on("click",".item_delete",function(e){
        	 e.preventDefault();
        	 var $this =$(this);
        	 $this.attr("data-no");
        	 deleteCart();
         });
 */         
       	function deleteCart($this){
       		//alert("상품삭제");
       		
       		if(confirm("이 상품을 장바구니에서 제거합니까?")){
       			
       		
       		var itemNo = $this.attr("data-no");
       		alert(itemNo);
       		
       		$.ajax("/cart/delete", {
       			type:"DELETE",
       			dataType:"json",
       			contentType : 'application/json;charset=UTF-8',
       			data:JSON.stringify(itemNo),
       			error:function(xhr,error,code) {
       				alert(error);
       			},success:function(json) {
       				alert("삭제실행결과: "+json.result);
       				
       				if(json.result) displayCartList();
       			} // error~success end
       		}) // ajax end
       		}
       	}//delete end
       	
       	
       	//리스트를 보여주는 메서드
       	function displayCartList(){
       		//템플릿 만들어서 붙이기
       		//alert("실행");
       		$.ajax("/displayCartList",{
       			type:"post",
       			dataType:"json",
       			error:function(xhr,error,code){
       				alert(error);
       				},
       			success:function(json){
       				//alert(json);
       				//alert($('#cartTmp').html());
       				var tmp = _.template($('#cartTmp').html());
       				var code = tmp({bookList:json});
       				//alert(code);
       				$itemList.empty();
       				$itemList.append(code);
       				
       			}
       		})
       	}//displayCartList();
       	
       	var $cover = $('#cover');
       	
       	var updated=[];
       	
       	var interval = -1;
       	
       	var updatedNum = 0;
       	
       	//주문 확정 함수
       	$("#finalize").submit(function(e){
       		e.preventDefault();
       		
       		$cover.show();
       		
       		$(".quantity .item_quantity").each(function(index){
       			
       			var $this = $(this);
       			//false값을 엔트리 갯수만큼 넣어줌
       			updated.push(false);
       			console.log(1);
       			fixOrderDetails($this,index);
       			console.log(2);
       			
       		});
       		
       		
       		interval = setInterval(function() {
   				
   				for(var i = 0 ; i <updated.length ; i++ ) {
   					if(updated[i]) {
   						updatedNum++;
   					}
   				}
   				
   				console.log("setInterval : " + updated);
   				
   				if(updatedNum==updated.length) {
   					clearInterval(interval);
   					$cover.hide();
   					location.href="/purchase";
   				}else {
   					updatedNum=0;
   				}
   				
   			}, 10);
       	
       		
       	//메서드를 실행할 때 마다 업데이트된 인덱스의 false를 true로 바꿈
       		
       		return false;
       		
       	});
       	
       	//test
       	setTimeout(function() {
       		clearInterval(interval);
       	},5000);
       	
       	//셋인터벌 시작
       	//배열에 추가
       	//배열에서 다 true로 리턴됬을때
       	
       	function fixOrderDetails($this,index){
          var quantity = $this.val();
          var itemNo = $this.attr('data-no');
          
          
          console.log("quantity:"+quantity);
          console.log("itemNo:"+itemNo);
          
          
          
       		$.ajax("/cart/update", {
       			type:"put",
       			dataType:"json",
       			contentType : 'application/json;charset=UTF-8',
       			data:JSON.stringify({"quantity":quantity,"no":itemNo}),
       			error:function(xhr,error,code) {
       				alert(error);
       			},success:function(json) {
       				alert("수정실행결과: "+json.result);
       				//true로 바꿈
       				if(json.result) {
       					updated[index] = true;
       				};
       			} // error~success end
       		}) // ajax end
       	}
       	
       	
       	
       	
       	////////////////////////////최근 본 도서
       	var data = sessionStorage.getItem('recents');
       	
    	//alert(data);
       	var recents = JSON.parse(data); 
       	
       	var recentArr=[];
       	
       	//alert(recents);
       	//data는 배열
       	$(recents).each(function(){
       		//alert(this.title);
       		recentArr.unshift(this);
       		if(recentArr.length>=5){
       			recentArr.pop();
       		}
       		
       	});
//       	alert(recentArr.length);
       	console.log(recentArr);
       	//alert($('#bookTmp').html());
         var tmp = _.template($("#bookTmp").html());
        
        //alert(tmp);
       	$('.list').html(tmp({
       		recents:recentArr	
       	}))
       	 
    </script>
    <!-- underscore template 작성 -->
               
</body>

</html>
