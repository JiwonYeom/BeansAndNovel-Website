<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Beans &amp; Novel</title>
    
 <c:import url="template/link.jsp"></c:import>

    <style>
        html{width: 100%;}
        body{
            width: 100%;
            font-family: "bon", sans-serif;
            font-weight: 200;
        }
        #contents{
            width:980px;
            overflow: hidden;
            margin: auto;
/*            background-color: pink;*/
        }
        #bookList{
            position:relative;
        }
        #bookList .status{
            position: absolute;
            top:10px;
            padding: 30px 0;
            height:30px;
            
        }
        #bookList .status em{
            font-weight: 500;
        }
       
        #pagingBar{
            margin-top:20px;
        }
        #pagingBar, #pagingBarEnd{
            
            width:100%;
            height:60px;
            border-top: 1px solid #e2e2e2;
            border-bottom: 1px solid #e2e2e2;
            background: linear-gradient(#F9F8F6, #FFF);
            position: relative;
            line-height: 40px;
            box-shadow: 10px 10px 50px #efefef;
        }
        #pagingBar a, #pagingBarEnd a{
         color:#08511c;
        font-weight: 300;
        }
                #pagingBar span, #pagingBarEnd span{
         color:#08511c;
        font-weight: 800;
                    
        }
        #pagingBar select{
            height:35px;
            position: absolute;
            border: 1px solid #999;
            border-radius: 5px;
            color: darkblue;
            padding: 0 5px;
            top:13px;
        }
        #pagingBar .order{
            
            left:10px;
        }
        #pagingBar .show{
            
            left:90px;
        }
   
        .number_container{
            height:35px;
            
            background-color: aqua;
            background: linear-gradient(#FFF,#efefef);
            border: 1px solid #999;
            position: absolute;
            top:11.5px;
            right:0;
            border-radius: 5px;
            margin-right: 15px;
            
        }
        .number_container span, .number_container a{
            
            float: left;
            border-right:  1px solid #999;
            padding:0 3px;
/*            vertical-align: text-top;*/
            line-height: 35px;
            width:30px;
            text-align: center;
            
            margin: 0;
            font-size: 16px;
            text-decoration: none;
        }
        .number_container a:hover{
            background: linear-gradient(#FFF,#e2e2e2);
        }
        .number_container a:last-child{
            border-right: none;
        }
        #itemList{
            height:1000px;
            width:100%;
            
            padding: 30px 0 0 30px;
/*            background-color: greenyellow;*/
            margin-bottom: 0;
        }
        .item{
            
/*            border-bottom:1px solid #999;*/
/*            background-color: lightcoral;*/
            width: 130px;
            height: 320px;
            margin: 15px 30px 0 15px;
            float: left;
            
            /*background-color: skyblue;*/
            
        }

        
        .item img{
            height:150px;
            width:100px;
        }
        .img_container{
            background-color: white;
            width:100px;
            padding:6px;
           box-shadow: 0 0 5px 5px #e2e2e2;
            margin: auto;
            
            
        }
        .info_box{
            padding-top: 3px;
            font-size: 14px;
            /*background-color: pink;*/
            text-align: center;
            line-height: 16px;
            height: 140px;
            margin-top:10px;
            white-space: nowrap;
       	overflow:hidden;
       	text-overflow:ellipsis;
        }
        .info_box .price{
            color:orangered;
            font-weight: 600;
            margin-top: 5px;
        }
                .info_box h3{
            font-size: 14px;
            font-weight: 300;
            color:gray;
             margin-top: 3px;
        }
        .info_box h3 a{
            text-decoration: none;
            color: black;
        }
        .info_box h3 a:hover{
            text-decoration: underline
        }
        .info_box .book_title{
            font-weight: 500;
            text-align: center;
            padding-bottom: 5px;
            text-decoration: none;
            color:black;
            line-height: 17px;
            /*margin-bottom: 15px;*/
            
            
        }

        .item .grade_box{
            width:100px;
            height: 20px;
            margin: 3px auto;
            background-image: url(/img/stars2.png);
            background-repeat: no-repeat;
            
        }
        .item .show_box{

            width:100px;
            height: 20px;
            background-image: url(/img/stars2.png);
            background-position: 0 110%;
            background-repeat: no-repeat;
/*            background-color: pink;*/

        }
        #sideBar{
            width:180px;
            height:1100px;
            background-color: white;
            float: left;
            border-right: 1px solid #e0e0e0;
            margin-top: 10px;
            line-height: 23px;
            padding-right: 10px;
/*            display: none;*/
            box-shadow: 0 20px 20px 3px #e6e6e6;
        }
        #sideBar .now{
            border-top: 1px solid #d6d6d6;
            background-color: #f4f4f4;
            padding: 5px 0;
            margin: 10px 0;
        }
        #bookList{
            width:755px;
/*            background-color: yellow;*/
            float: left;   
        }

        #categoryBar a{
            text-decoration: none;
            color:darkblue;
            font-weight: 400;
        }
        #categoryBar a:hover{
            color:blue;
        }
        #priceBar h2{
             border-top: 1px solid #d6d6d6;
            background-color: #f4f4f4;
            padding: 5px 0;
            margin: 10px 0 10px 0;
            font-weight: 400;
        }
        .price_list a{
            text-decoration: none;
            color:darkblue;
            font-weight: 200;
        }
        .price_list a:hover{
            color:blue;
        }
    </style>
</head>
<c:import url="/header"></c:import>
<c:import url="/sidebar"></c:import>

<div id="contents">
    <div id="sideBar">
    <div id="recentView">
        <p class="now">현재 카테고리</p>
        <div id="categoryBar">
            <p><a href="">${name }</a></p>
        </div>
        <hr/>
        </div>
        <!-- 
        <div id="priceBar">
            <h2>가격별 분류</h2>
        <ol class="price_list">
            <li><a href="">- 만원 이하</a></li>
            <li><a href="">- 10,000원~30,000원</a></li>
            <li><a href="">- 30,000원 이상</a></li>
            </ol>
            
        </div>
         -->
    </div>
    <div id="bookList">
    <p class="status"><em>${total }</em>개 결과중 <em>1-20</em>개 표시중</p>
    <div id="pagingBar">
        
        <!-- <select class="order">
        <option class="by_recent">신작순</option>
        <option class="by_popularity">인기순</option>
        </select> -->
        <div class="number_container"><!--페이지번호를 담는 div-->
        <!--페이징유틸-->
        ${paginate}
        
        </div>
    </div><!--//pagingBar-->
    
    <ul id="itemList">
    
    <c:forEach items="${bookList }" var="book">
    <li class="item">
        
        <div class="img_container"><a href="/bookDetail/${book.no }"><img src="${book.bookCover }" alt="${book.title }"/></a></div>
        
        <div class="info_box">
        <a href="/bookDetail/${book.no }" class="book_title">${book.title } </a>
        <h3>작가: <a href="/book/writer/${book.writer }/page/1">${book.writer }</a></h3>
        <h3>출판사: <a href="/book/publisher/${book.publisher }/page/1"">${book.publisher }</a></h3>
        
        <div class="grade_box">
            <div class="show_box" style="width:${book.rating*10}px">
            <span class="screen_out">${book.rating }점</span>
            </div>
        </div><!--grade_box-->
            <p class="price">N&amp;B가: ${book.salesPrice }원</p>
       
            </div><!--info_box-->
        </li>
    </c:forEach>
    
        
       
      
    </ul>
    <div id="pagingBarEnd">
        
          <div class="number_container"><!--페이지번호를 담는 div-->
        <!--페이징유틸-->
        ${paginate }
        </div>
        
    </div><!--//pagingBarEnd-->
    </div>
    
    </div><!--//contents-->
    
       <c:import url="template/footer.jsp"></c:import>
        
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/template.js"></script>
    <script>
    
    
    
    
    $('.order').change(function(){
    	alert($('.order option:selected').text());
    	if($('.order option:selected').text()=="신작순"){
    		location.href="?order=recent";
    	}else if($('.order option:selected').text()=="인기순"){
    		location.href="?order=popularity";
    	}
    });
    
/*     <select class="order">
    <option class="by_recent">신작순</option>
    <option class="by_popularity">인기순</option>
 */        
    </script>
</body>
</html>
