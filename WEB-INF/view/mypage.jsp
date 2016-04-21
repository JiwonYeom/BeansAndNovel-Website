<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang='ko'>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>

<c:import url="template/link.jsp"></c:import>
    
    <style>
        body{
            font-family: "bon", sans-serif;
        }
        /* 내정보 전체 페이지 div*/
        #myPageWrap{
            padding-top: 30px;
            width: 1000px;
            min-height: 100px;
            overflow: hidden;
            /*background: green;*/
            margin: auto;
        }
        #myPageWrap h1{
            width: 930px;
            font-size: 28px;
            font-weight: 600;
            display: inline-block;
            /*background: blue;*/
/*            margin: 10px auto;*/
        }
        #settingAccount a{
            text-decoration: none;
            color:#424242;
            font-weight: 500;
        }
        #settingAccount a:hover{
            text-decoration: underline;
        }
        .myinfoBoxes{
            width: 980px;
            min-height: 200px;
            margin: 15px auto ;
            border: 1px solid #666;
            border-radius: 5px;
        }
        .myinfoBoxes h2{
            width: 180px;
            height: 40px;
            font-size:  25px;
            font-weight: 400;
            /*background-color: firebrick;*/
            line-height: 40px;        
            color: black;
            display: inline-block;
            vertical-align: middle;
        }

        /* 주문기록 개인정보설정 위시리스트 각 박스의 css */
       #myPageWrap #myInfoSettingBox,#myPageWrap #wishListBox{
            width: 920px;
            min-height: 370px;
            margin: 30px;
            /*background: yellow;*/
        }
         #myPageWrap #orderRecordBox{
       		width: 920px;
            min-height: 370px;
            margin: 30px;
            position: relative;
         }
        #myPageWrap #wishListWrap{
            height: 470px;
            /*overflow: hidden;*/
            /*background-color: red;   */
        }
        
        .address_container{
            border-bottom: 1px solid #999;
            padding: 20px 30px;
            text-align: right;
        }
        .address_container a{
            
        }
        .address{
            line-height: 23px;
            width:100%;
            text-align: left;
        }
        .address_btn_form{
        	display:inline-block;     
        }
        
        .default,.address_update,.address_delete{
            margin-right: 10px;
            height:40px;
            border: 1px solid #999;
            border-radius: 5px;
            color: darkblue;
            background: linear-gradient(white,#e0e0e0);
            cursor: pointer;
            display:inline-block;
            vertical-align: middle;
        }
        .default:hover,.address_update:hover,.address_delete:hover{
            background:#e0e0e0;
        }
        .btn{
            margin-top: 20px;
            width:100%;
            text-align: right;
            
        }
        .btn button{
            background: linear-gradient(#447CBB,#3168A6);
            padding:10px 30px;
            color:white;
            font-weight: 700;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn button:active{
            background: #3168A6;
        }
        /* 주문 검색폼 css {{*/
        #myPageWrap #orderRecordBox #orderSearchForm{
           /*  background-color: aqua; */
            height: 100px;
            margin: 10px 0;
            position: relative;
        } 
        #myPageWrap #orderRecordBox #orderSearchForm select,
        #myPageWrap #orderRecordBox #orderSearchForm #orderSearch,
        #myPageWrap #orderRecordBox #orderSearchForm #orderSearchBtn,
        #myPageWrap #orderRecordBox #orderSearchForm label{
            border-radius: 5px;
            font-weight: 800; 
            font-size: 15px;
            position: absolute;
        }
        #myPageWrap #orderRecordBox #orderSearchForm select{
            width: 150px;
            height: 40px;
            top: 30px;
            left: 20px;
        }
        #myPageWrap #orderRecordBox #orderSearchForm #orderSearch{
            width: 180px;
            height: 30px;
            top: 30px;
            right: 150px;
            border: 1px solid #ccc;
        }
        #myPageWrap #orderRecordBox #orderSearchForm #orderSearchBtn{
            width: 80px;
            height: 33px;
            background: linear-gradient(#1c6b10,#08511c);
            text-align: center;
            font-weight:  800;
            font-size: 20px;
            line-height: 35px;
            top: 30px;
            right: 60px;
            cursor: pointer;
            color: white;
            border: 1px solid #e0e0e0;
        }
        #myPageWrap #orderRecordBox #orderSearchForm label{
            top: 40px;
            left: 450px;
            box-shadow: none;
            font-weight: 700; 
            font-size : 20px;
        }
        #myPageWrap #orderRecordBox #orderState{
            min-height: 100px;
           /*  background-color: bisque; */
        }
        #myPageWrap #orderRecordBox #orderState #orderStateTable{
            border-top: 1px solid #424242;
            border-bottom: 1px solid #424242;
            width: 920px;
            min-height: 100px;
        }
        #myPageWrap #orderRecordBox #orderState #orderStateTable a{
            text-decoration: none;
            color:#1c6b10;
            font-weight: 600;
        }
        #myPageWrap #orderRecordBox #orderState #orderStateTable a:hover{
        text-decoration: underline;
        }
        #myPageWrap #orderRecordBox #orderState #orderStateTable thead th{
            /* background-color: #A5D6A7; */
            width: 230px;
            height: 30px;
            font-size: 20px;
            font-weight: 700;
            letter-spacing: 3px;
            text-align: center;
            line-height: 30px;
        }        
        #myPageWrap #orderRecordBox #orderState #orderStateTable tbody td{
           /*  background-color: blue; */
            text-align: center;
            min-height:50px;
            height: 35px;
            line-height: 35px;
            font-size: 18x;

        }
        
        #myPageWrap #orderRecordBox #orderState #orderStateTable tfoot tr{
            height: 100px;
            font-size: 20px;
            line-height:100px;
            color: red;
            text-align: center;
        }
        /*}} 주문 검색폼 css end */
        
        /* 개인정보 설정 css {{*/
        #myInfoSettingWrap{
            min-height: 100px;
			width:
            /* background:red; */

        }
        #myInfoSettingBox{
            min-height: 130px;

        }
        
        #infoSetting{
              
	            position:relative;
	            min-height: 100px;
	            
        }
        
        #infoSetting h2{
        padding:5px 10px;
        position:relative;
        width:100%;
        }
        #infoSetting h3 {
            margin-top:5px;
            margin-bottom:5px;
            font-size: 18px;
        }
        
        #myPageWrap #myInfoSettingBox #infoSetting ul{
            margin: auto;
            width: 920px;
            background: red;
        }
        #myPageWrap #myInfoSettingBox #infoSetting ul li{
            float: left;
            width: 305px;
            height: 130px;
            border-left: 1px solid #424242;
            /*background-color: darkslateblue;*/
        }
        #myPageWrap #myInfoSettingBox #infoSetting ul li:first-child{
            border-left: none;
        }
        #myPageWrap #myInfoSettingBox ul #accountSetting a,
         #myPageWrap #myInfoSettingBox ul #addressSetting a{
            display: block;
            width: 130px;
            height: 30px;
            /*background-color: darkorchid;*/
            font-size: 16px;
            font-weight: 700;
            text-decoration: none;
            line-height: 30px;
            margin-top: 10px; 
            color: black;
            margin-left: 10px; 
        }
        #myPageWrap #myInfoSettingBox ul #accountSetting a:hover,
        #myPageWrap #myInfoSettingBox ul #addressSetting a:hover
        {
            text-decoration: underline;
            color: #1c6b10;
        }
        #myPageWrap #myInfoSettingBox ul #addressInfo span{
            margin-bottom:2px;
            margin-left: 10px;
            display:inline-block;
        }
        #myPageWrap #myInfoSettingBox ul h3{
            width: 250px;
            margin: 10px;
            font-weight: 700;
            font-size: 20px;
/*            background-color: yellow;*/
        }
        /*}} 개인정보 설정 css end */
        
        /* 위시리스트 css {{*/

        #myPageWrap #wishListBox .wishListUpdate{
            /*background: red;*/
            display: inline-block;
            text-decoration: none;
            color: #1c6b10;
            font-weight: 600;
            font-size: 40px;
            border-radius: 5px;
            padding: 5px;
            text-align: center;
        }
        #wishListBox h2{
        padding-top:10px;
        padding-left:20px;
        }
        #wishListBox a{
            color: #424242;
            text-decoration: none;
            
        }
        
        #wishListBox a:hover {
            text-decoration: underline;
            color:#1c6b10;
        }
        
        .contents_wrap {
            position: relative;
            width: 980px;
/*            background: violet;*/
            margin-left:0px;
            margin-top: 0;
        }
        
        .contents_wrap .left,
        .contents_wrap .right {
            width: 50px;
            height: 50px;
            border-radius: 25px;
            position: absolute;
            top:85px; /* 175px or 135px */
            font-size: 30px;
            line-height: 57px;
            text-align: center;
            z-index: 1;
            cursor: pointer;
            background-color: #FFF;
            /*box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);*/
        }
        
        .contents_wrap .left {
            left: 5px;
            text-indent: -2px;
        }

        .contents_wrap .right {
            right: 5px;
            text-indent: 2px;
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
            width: 980px;
            height: 340px;
            margin-top:15px;
            /*position:relative;*/
            /*background-color: aqua;*/
        } 
        
        .book_list_wrap {
            width: 840px;
            height: 320px;
            position: relative;
            margin: auto;
            background-color: white;
        }
        
        .contents_list {
            width: 1680px;
            height: 320px;
            position: absolute;
            /*overflow: visible;*/
            overflow: hidden;
        }
        
        .list{
            width: 840px;
            height: 350px;
            position: absolute;
            /*background:#FFF;*/
        }
        
        .contents_list .first{
            background:#FFF;
        }
        
        .contents_list .second{
            /*background: gray;*/
            left:840px;
            background:#FFF;
        }
        
        .contents_list {
            width: 840px; /*width: 2560px;*/
            height: 350px;
            top: 0;
            left: 0;
            transition: .5s ease;
            /*background-color: cadetblue;*/
        }
        
        .contents_list2 {
            width: 840px;
            height: 320px;
            background-color: blueviolet;
            left: 840px;
           	display: none;
        }
        
        .contents_list .books_info{
            width: 152px;
            height: 320px;
            margin-left: 20px; 
            float: left;  
            /* background-color: antiquewhite; */
        } 
        
        .contents_list .books_info:first-child {
            margin-left:0px;
        }
        
        .contents_list .books_info .contents_books .book_name,
       .contents_list .books_info .contents_books .book_author {
        white-space: nowrap;
        overflow:hidden;
        text-overflow:ellipsis;
       }
        
        .contents_list .books_info .contents_books img {
            width: 152px;
            height: 223px; 
            margin-bottom: 12px;
        }
        
        .contents_list .books_info .contents_books .book_name {
            line-height: 21px;
        }
        
        .contents_list .books_info .contents_books p {
            text-align: center;
            margin-bottom: 7px;
/*            background-color: pink;*/
        }
        
         .contents_books a {
            text-decoration: none;
            display: inline;
            
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
        
        #contentsBottom {
            height:355px;
            margin-top: 20px;
        }
        
               /*페이징 CSS*/

		.paginateWrap{
			width:100%;
            height:60px;        
            border-top: 1px solid #e2e2e2;
			/* background:blue;  */
            line-height: 60px;
			bottom: 0;
    		
		}
		.paginate {
			font-size:20px;
			text-align:center;
			width:100%;
			height:60px;
			line-height:60px;
			font-weight:500;

		}
		.paginate a, 
		.paginate span,
		.paginate strong{
			color:#08511c;
			text-decoration:none;
			padding:6px 12px;
			border:1px solid #424242;
			transition:.1s ease;
		}
		
		.paginate span {
			border-color:#E1E1E1;
			cursor: not-allowed;
			color:#ededed;
		}
		
		.paginate a:hover {
			background:#463a84;
			border-color:#E1E1E1;
			font-weight:900;
			color:#fff;
			box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		}
		
		.paginate strong {
			background:#251F39;
			border-color:#251F39;
			color:#fff;
			cursor: not-allowed;
			font-weight:900;
		}
		
		/*
		비활성화
		*/
		.paginate span.next,
		.paginate span.prev {
			border-color:#E1E1E1;
			color:#E1E1E1;
			cursor:default;
			cursor:not-allowed;
		}

      	#favoriteAddress{
      		
      		border-top: 1px solid forestgreen;
      		border-bottom: 1px solid #424242;
      		background-color:#eaf9ed;
      		
      	}
      	#favoriteAddress h3{
      	text-align: left;
      	font-weight: bold;
      	
      	}
      	#infoSetting #addNewAddress{
      	background: forestgreen;
      	color: white;
      	font-size:18px;
      	height: 25px;
      	line-height:25px;
      	cursor: pointer;
      	display: inline-block;
      	text-decoration: none;
      	padding:5px;
      	border: 1px solid #424242;
      	position: absolute;
      	top:7px;
      	right:40px;
      	}
      	#addNewAddress:hover{
      	background: #3168A6;
      	}
      
       	.address_update{

      		height:18px;
      		text-decoration: none;
      		display:inline-block;
      		font-size: 15px;
      		color: darkblue;    	
      		line-height:18px;
      		padding: 10px;    		
      	}
      	.address_delete{
      		width:50px;
      		font-size: 15px;
      	}
      	
    </style>
</head>
<c:import url="/header"></c:import>
<div id="contents">
    <div id="myPageWrap">
    <h1>내 정보</h1>

        <!--주문기록 -->
        <div id="orderRecordWrap" class="myinfoBoxes">
            <div id="orderRecordBox">
                <h2>주문기록</h2>
                    <div id="orderSearchForm">                     
                        <select>
                            <option>한 달 전</option>
                            <option>3개월 전</option>
                            <option>6개월 전</option>
                        </select>
                        <form action="/searchOrder" method="GET">
                        <label for="orderSearch" >주문번호 검색</label>
                        <input type="text" id="orderSearch" id="orderNo"  name="orderNo"/>
                        <button id="orderSearchBtn"><i class="fa fa-search"></i></button>
                        </form>
                    </div><!--//searchForm -->
                    <div id="orderState">
                        <table id="orderStateTable">
                            <thead>
                                <tr>
                                    <th>주문날짜</th>
                                    <th>주문번호</th>
                                    <th>합계</th>
                                    <th>상태</th>
                                </tr>    
                            </thead>
                            <tbody>
                            
                            <c:if test="${orderNumber != null}">                        
                                <tr>
                                    <td>${orderNumber.realRegdate}</td>
                                    <td><a href="/orderDetail?no=${orderNumber.no}">${orderNumber.no}</a></td>
                                    <td>${orderNumber.totalPrice} 원</td>
                                    <td>${orderNumber.realStatus}</td>
                                </tr>  
                            </c:if>
                            <c:forEach items="${orders}" var="order">                          
                                <tr>
                                    <td>${order.realRegdate}</td>
                                    <td><a href="/orderDetail/${order.no}">${order.no}</a></td>
                                    <td>${order.totalPrice} 원</td>
                                    <td>${order.realStatus}</td>
                                </tr>
                                
							</c:forEach>  
                                
                            </tbody>
                            <!-- 검색된 주문 결과가 없을경우 -->
                            <tfoot>
                            <c:if test="${empty orderNumber && empty orders}">
                                <tr >
                                    <td colspan="4">검색된 주문번호가 없습니다.</td>
                                </tr>
                            </c:if>    
                            </tfoot>
                        </table>
                        
                    <c:if test="${total==5}"> 
                    <div class="paginateWrap">
						${paginate}
                    </div>
                    </c:if>   
                </div><!--//pagingBar-->  
                    </div>
            </div><!--//orderRecordBox -->
        </div><!--//orderRecordWrap -->
        
        <!--개인정보 설정 -->
        <div id="myInfoSettingWrap" class="myinfoBoxes">
            <div id="myInfoSettingBox">
                <div id="infoSetting">
                    <h2>배송지 관리
					
                    <a href="/newAddress" id="addNewAddress">배송지 추가</a>
                    </h2> 
 				<c:if test="${empty addressList}">
                    <p id="emptyMsg">
                    	등록되있는 배송지가 없습니다.
                    </p>
                </c:if>
                       <c:forEach items="${addressList}" var="address">
                       <c:choose>
                        <c:when test="${address.shippingAddress == 'd'}">
                        
                        <div id="favoriteAddress" class="address_container">
                        <h3>기본 배송지</h3>
                            <div class="address">
                        <p>이름 : ${address.name}</p>
                        <p>받으시는 분: ${address.recipient}</p>
                        <p>우편번호 : ${address.zipcode} </p>
                        <p>${address.address}</p>
                        <p>${address.detailedAddress}</p>
                        <p>연락처: ${address.phone}</p>
                            </div><!--address-->
                            <form class="address_btn_form" action="/updateShippingAddressCancel/${address.no}" method="POST">
                             <input type="hidden" name="_method" value="put" />
                             <button class="default">기본 배송지 해제</button> 
                            </form>                         
                             	<a href="/updateAddress/${address.no}" class="address_update">수정</a>
                            <form class="address_btn_form" action="/mypage/${address.no}" method="POST">
                            <input type="hidden" name="_method" value="DELETE"/>    
                                <button class="address_delete">삭제</button>
                            </form>
                         </div><!-- //address_container -->
                         
                         </c:when>
                                                 
                         <c:otherwise>
						
                         <div class="address_container">
                            <div class="address">
                        <p>이름 : ${address.name}</p>
                        <p>받으시는 분: ${address.recipient}</p>
                        <p>우편번호 : ${address.zipcode} </p>
                        <p>${address.address}</p>
                        <p>${address.detailedAddress}</p>
                        <p>연락처: ${address.phone}</p>
                            </div><!--address-->
                            <form class="address_btn_form" action="/updateShippingAddress/${address.no}" method="POST">
                             <input type="hidden" name="_method" value="put" />
                             <button class="default">기본 배송지 설정</button> 
                            </form>                  
                              <a href="/updateAddress/${address.no}" class="address_update">수정</a>
                            <form class="address_btn_form" action="/mypage/${address.no}" method="POST">
                            <input type="hidden" name="_method" value="DELETE"/>    
                                <button class="address_delete">삭제</button>
                            </form>
                         </div><!-- //address_container -->
                         	</c:otherwise>   
                         </c:choose>
						</c:forEach> 
					<%-- </c:if>   --%> 	
                </div><!--//infoSetting-->        
                </div><!--//myInfoSettingBox -->
            </div>
        </div><!--//myInfoSettingWrap-->
        
        <!--위시리스트 목록 -->
        <div id="wishListWrap" class="myinfoBoxes">
            <div id="wishListBox">
                <h2><a href="/wishlist">위시리스트</a></h2>
        <div id="contentsBottom">
            <div class="contents_wrap"> <!-- position:relative 상태 -->  
               
                     
                    <div class="book_list_wrap new">
                        <div class="contents_list">
                            <div class="first list">
                               <c:forEach items="${wishList}" var="book" step="1" begin="0" end="4">
                               <div class="books_info">
                                   <div class="contents_books">
                                       <a href="bookDetail/${book.no}">
                                           <img src="${book.bookCover}" alt="${book.title} 이미지" />
                                       </a>
                                       <p class="book_name" title="${book.title}"><a href="bookDetail/${book.no}">${book.title}</a></p>
                                       <p class="book_author" title="${book.writer}"><a href="book/writer/${book.writer}">${book.writer}</a></p>
                                       <div class="book_grade">
                                           <div class="txt_grade" style="width:${book.realRating*12}px" >
                                           </div>    
                                       </div> <!-- // book_grade-->
                                   </div> <!-- // contents_books -->
                               </div> <!-- // books_info-->
</c:forEach>  
                            </div><!-- first -->
                            <div class="second list hide"></div>
                        </div><!-- contentsList -->
                            
                    </div> <!-- // book_list_wrap -->
                    </div> <!-- // contents_all -->
                   </div><!--// content_wrap -->
                </div>
            </div>
        </div><!--wishListWrap -->
   </div><!--//myPageWrap--> 
   </div><!-- contents -->
    <c:import url="template/footer.jsp"></c:import>
            
    <script src="js/jquery.js"></script>
    <script src="js/underscore-min.js"></script>
    <script src="js/template.js"></script>
    <script>
       
        
     /* 업데이트  */ 
    </script>   
    
    
    <c:if test="${updateMsg != null}">
    <script>
	 	alert('${updateMsg}'); 
	</script>
	</c:if>
	

     
</body>
</html>
