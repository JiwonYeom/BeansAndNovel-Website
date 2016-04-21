<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            display:inline-block;
            min-width: 50px;
            font-size:18px;
            position: absolute;
            top: 70px;
            left: 5px; 
        }
        #bookList .status em{
            font-weight: 500;
        }
       /*페이징 CSS*/

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
        #pagingBarEnd{
        clear:left;}
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
       
/*      #pagingBar{
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

        .paginate{
            height:35px;
            width:222px;
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
           vertical-align: text-top;
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
        */
        
        #bookList ul{
        	/* background:red; */
        	min-height: 100px;
        
        }
        
        .align{
            min-height:655px;
            width:100%;
            border-top: 1px solid #e0e0e0;
            padding: 30px 0 0 40px;
		 	/* background-color: greenyellow; */
            margin-bottom: 0;
            overflow: hidden;
        }
        .item{            
			/* border-bottom:1px solid #999;*/
			/* background-color: lightcoral;*/
            width: 130px;
            height: 320px;
            margin: 15px 30px 0 15px;
            float: left;
            /* background-color: skyblue; */
            
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
            height:800px;
            background-color: white;
            float: left;
            border-right: 1px solid #e0e0e0;
            margin-top: 10px;
            line-height: 23px;
            padding-right: 10px;
/*            display: none;*/
            box-shadow: 0 0 20px 3px #e6e6e6;
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
        
        #notFoundBook{
        width:750px;
        margin-top: 50px;
/* 		   background:blue; */ 
        height:30px;
        line-height:30px;
        font-weight:500;
        text-align:center;
        color: crimson;
        font-size: 30px;
        }
        #itemList{
        margin:70px 0;
        }
         #pagingBar select,#pagingBarEnd select{
           height:35px;
           position: absolute;
           border: 1px solid #999;
           border-radius: 5px;
           color: darkblue;
           padding: 0 5px;
           top:13px;
       }
       #pagingBar .order,#pagingBarEnd .order{
           left:10px;
       }
       #pagingBar .show,#pagingBarEnd .show{
           left:90px;
       }
        
    </style>
</head>
<c:import url="/header"></c:import>
<c:import url="/sidebar"></c:import>

<div id="contents">
    <div id="sideBar">
    <div id="recentView">
        <p class="now">검색어</p>
        <div id="categoryBar">
            <p><a href="">${title }</a></p>
        </div>
        </div>
        <hr/>
        </div>

    <div id="bookList">
	 <div id="pagingBar">
<p class="status"><em>${total}</em>개 결과중 <em>1-20</em>개 표시중</p>  
	 	<select class="order" >
        <option class="rating"  value="rating_sum/rating_count">평점순</option>
        <option class="publication" value="publication_date">신작순</option>
        </select>

        <select class="num_page_book show">
        <option class="8"  value="8">8개씩 보이기</option>
        <option class="20"  value="20">20개씩 보이기</option>
        </select>
        <div class="number_container">
	 ${paginate}
	 </div>
	 </div><!-- //.pagingBar -->	
    <ul id="itemList">
    
    
 	<c:if test=" ${total==0}">
	  <p id="notFoundBook">검색결과가 없습니다.</p>
  	</c:if>
  	
    <c:forEach items="${bookList}" var="book">
    <li class="item">
        <div class="img_container"><a onclick="save()" href="/bookDetail/${book.no}"><img src="${book.bookCover}" alt="${book.title}"/></a></div>   
        <div class="info_box">
        <a href="/bookDetail/${book.no}" class="book_title">${book.title}</a>
        <h3>작가: <a href="/book/writer/${book.writer }/page/1"">${book.writer}</a></h3>
        <h3>출판사: <a href="/book/publisher/${book.publisher }/page/1"">${book.publisher}</a></h3> 
        <div class="grade_box">
            <div class="show_box" style="width:${book.realRating*10}px">
            <span class="screen_out">${book.realRating}</span>
            </div>
        </div><!--grade_box-->
            <p class="price">N&amp;B가: ${book.salesPrice}원</p>
            </div><!--info_box-->
        </li>
      </c:forEach>  
    
    </ul>
    
	 <div id="pagingBarEnd">
 	 	<select class="order">
        <option class="rating" value="rating_sum/rating_count">평점순</option>
        <option class="publication" value="publication_date">신작순</option>
        </select>
        <select class="num_page_book show">
       <option class="8"  value="8">8개씩 보이기</option>
       <option class="20"  value="20">20개씩 보이기</option>
       </select>
        <div class="number_container">
 	${paginate}
 	</div>
	 </div><!-- //.pagingBar -->	
    </div>
    </div><!--//contents-->
    
       <c:import url="template/footer.jsp"></c:import>
        
<script src="js/jquery.js"></script>
<script src="js/template.js"></script>
    <script>
    var $num_page_book = $(".num_page_book"),
        $order = $(".order");
    //alert("test");
    
    //파라미터 받기
	 var getParam = function(key){
    	         var _parammap = {};
    	         document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
    	             function decode(s) {
    	                 return decodeURIComponent(s.split("+").join(" "));
    	             }
    	  
    	             _parammap[decode(arguments[1])] = decode(arguments[2]);
    	         });
    	  
    	         return _parammap[key];
    	     };
    	     
    	     //넘어온 파라미터 메세지 호출
    	 /*     alert("넘어온 정렬갯수: "+getParam("numPage")+
    	    		 "/////"+"넘어온 검색단어: "+getParam("title")+
    	    		 "/////"+"넘어온 정렬순서"+getParam("orderBy")); */

    	
    	     
    //페이지 리로딩시에 선택한 설렉트가 기본선택 값으로 바뀜
    if(getParam("numPage")==8){
    	    //10개씩 보기를 클릭했으면 10개씩 보기가 기본선택값
    	 	//alert("셀렉트 10으로 설정!");
    	 	$(".num_page_book").val("8");    
    	 	
    }else{
    	//20개씩 보기를 클릭했으면 10개씩 보기가 기본선택값
    	//alert("셀렉트 20으로 설정!");
    	$(".num_page_book").val("20");
    }

    //정렬순

    	var order = getParam("orderBy");
    	
    	//orderBy 초기값 대입
    	if(order=="rating_sum/rating_count"){
			    //기본선택값 평점순으로  
			    //alert("평점순으로 설정!");
			 	$(".order").val("rating_sum/rating_count");  	
		}else{
				//기본선택값 신작순으로  
				//alert("신작순으로 설정!");
				$(".order").val("publication_date");
		}
    

	    	    
   //게시물 수 select 값 얻기 	     
    $num_page_book.change(function(){
    	//select의 각 option의 값을 얻어옴.
    	var numPage = $(this).val();
    	
    	//검색 단어 얻어옴
    	//alert("보여질 갯수 : "+numPage);

    	//페이지 이동
    	 location.href="/book/search?numPage="+numPage+"&"+"title="+getParam("title")+"&"+"orderBy="+getParam("orderBy");
    	
    })//num_page_book change end;
     
   //정렬 순 select 값 얻기
    $order.change(function(){
    	//alert("test");
    	
    	//넘어갈 orderBy 값
    	var orderBy = $(this).val();
    	//alert("orderBY : "+orderBy);
   	//페이지 이동
   	location.href="/book/search?numPage="+getParam("numPage")+"&"+"title="+getParam("title")+"&"+"orderBy="+orderBy;

    })
    

       
    
    </script>
</body>
</html>
