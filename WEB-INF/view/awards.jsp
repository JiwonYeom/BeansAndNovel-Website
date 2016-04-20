<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수상작 모음</title>
    <c:import url="template/link.jsp"></c:import>
    <style>
        body {
            font-family: "Kakao", sans-serif;
        }
        
        #contents {
            width: 980px;
            height: auto;
            margin: auto;
            /*background-color: red;*/
        }
                    
        #title {
        	margin-top: 25px;
            position:relative;
            /*background:green;*/
        }
        /*
        #title #border {
            width:980px;
            border: 1px solid #424242;
            position: absolute;
            top:16.5px;
            left:0;
        }
        
        #title h1 {
            margin: 20px auto;
            font-size: 40px;
            text-align: center;
            background-color: red;
        }
        */
        
        #titleBox{
            width: 100%;
            height: 50px;
            text-align: center;
            position: relative; 
        }
        
        #titleLine{
            width:100%;
            display: block;
            background-color: palegoldenrod;
            border-top: 1px solid #999;
            position: absolute;           
            z-index: 1;
            top:50%;
        }
        
        .bracket{
            color: darkgray;
            width:20px;
            height: 40px;
        }
        
        #titleBox h1{
            display: inline-block;
            padding:0 10px;
            font-size: 30px;
            font-weight: 500;
            background-color: white;
            position: absolute;
            left:50%;
            margin-left:-110px;
            top:20%;
            z-index: 3;
        }
        
        #listTop {
            height: 360px; /* 355 */
            margin: 25px auto 10px auto;
            /*background-color:green;*/
        }
        
        #listMiddle {
            height: 360px;
            margin: 25px auto 10px auto;
            /*background-color: burlywood;*/
        }
        
        .contents_wrap {
            position: relative;
            /*background: violet;*/
        }
        
        .contents_wrap .left,
        .contents_wrap .right {
            width: 50px;
            height: 50px;
            border-radius: 25px;
            position: absolute;
            top:125px; /* 175px or 135px */
            font-size: 30px;
            line-height: 57px;
            text-align: center;
            z-index: 1;
            cursor: pointer;
            background-color: #FFF;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
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
            font-size: 22px;
            display: inline-block;
            margin-bottom:5px;
            /*background-color: green;*/
        }
        
        .contents_title .more_btn {
            font-size: 15px;
            display: inline-block;
            position: absolute;
            padding: 2px 10px; 
            top: 0;
            right: 0;
            color: #1c6b10;
            text-decoration: none;
            border-radius: 3px;
            border: 1px solid #1c6b10;
            background-color: linear-gradient(#ddd,#fff);
            margin-top:-6px;
            height: 25px;
            line-height: 27px;
        }
        
        .contents_all {
            width: 980px;
            height: 320px;
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
            height: 320px;
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
            height: 320px;
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
            /**/ display: none;
        }
        
        .contents_list .books_info{
            width: 152px;
            height: 320px;
            margin-left: 20px; 
            float: left;  
            /*background-color: antiquewhite;*/
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
        
        .contents_list .books_info .contents_books p {
            text-align: center;
            margin-bottom: 7px;
        }
        
        .contents_list .books_info .contents_books a {
            color:#424242;
            text-decoration: none;
        }
        
        .contents_list .books_info .contents_books a:hover {
        	text-decoration: underline;
        } 
        
        .contents_list .books_info .contents_books .book_grade {
            width: 120px;
            height: 23px;
            /*background-color: aquamarine;*/
            background-image: url(/img/stars.png);
            background-position: 0px 0px; 
            background-repeat: no-repeat;
            margin: -1px auto;
            
        }
        
        .contents_list .books_info .contents_books .book_grade .txt_grade{
            width: 95px;
            height: 23px;
            /*background-color: red;*/
            background-image: url(/img/stars.png);
            background-position: 0 -25px;
            background-repeat: no-repeat;
            /*margin: -1px auto;*/
        }
        
        #listBottom {
            height:360px;
            margin: 25px auto 10px auto;
            /*background-color:yellow;*/
        }
    </style>
</head>
	<c:import url="/header"></c:import>
	<c:import url="/sidebar"></c:import>
    <div id="contents">
        <div id="title">   
            <!--<div id="border"></div>-->
            <!--<h1></h1>-->
            <div id="titleBox"> 
                <span id="titleLine"></span>
                <h1>
                    <span class="bracket left">&#123;</span>
                    수상작 모음
                    <span class="bracket right"> &#125;</span>
                </h1>
            </div> <!-- // titleBox -->
        </div> <!-- // title -->   
        <!--<hr />-->
        <div id="listTop">
            <div class="contents_wrap">
                <div class="contents_title">
                    <h2>퓨울리춰상 수상작</h2>
                    <a href="/book/award/2/page/1" class="more_btn">더보기</a>
                </div> <!-- // contents_title -->   
               
                <div class="contents_all">
                    
                    <div class="left">
                        <i class="fa fa-chevron-left"></i>
                    </div>
                    <div class="right">
                        <i class="fa fa-chevron-right"></i>
                    </div>
                     
                    <div class="book_list_wrap first_list">
                        <div class="contents_list">
                            <div class="first list">
                            <c:forEach items="${list1}" var="book" step="1" begin="0" end="4">
                                <div class="books_info">
                                    <div class="contents_books">
                                        <a href="/bookDetail/${book.no}">
                                            <img src="${book.bookCover}" alt="${book.title} 이미지" />
                                        </a>
                                        <p class="book_name" title="${book.title}"><a href="/bookDetail/${book.no}">${book.title}</a></p>
                                        <p class="book_author" title="${book.writer}"><a href="/book/writer/${book.writer}/page/1">${book.writer}</a></p>
                                        <div class="book_grade">
                                            <div class="txt_grade" title="${book.rating}"
                                            style="width:${book.rating*12}px">
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
                
                <!-- underscore template 작성 -->
                <script type="text/template" id="bookTmp1">
                    <@_.each(books, function(book){@>
                        <div class="books_info">
                            <div class="contents_books">
                                <a href="/bookDetail/<@=book.no@>">
                                    <img src="<@=book.bookCover@>" />
                                </a>
                                <p class="book_name" title="<@=book.title@>"><a href="/bookDetail/<@=book.no@>"><@=book.title@></a></p>
                                <p class="book_author" title="<@=book.writer@>"><a href="/book/writer/${book.writer}/page/1"><@=book.writer@></a></p>
                                   <div class="book_grade">
                                            <div class="txt_grade" title="<@=book.rating@>" style="width:<@=book.rating*12@>px">
                                            </div>    
                                        </div> <!-- // book_grade-->
                            </div> <!-- // contents_books -->
                        </div> <!-- // books_info -->
                    <@ }); @>
                </script>
            </div> <!-- // contents_wrap -->
        </div> <!-- // listTop -->
        <hr />
        <div id="listMiddle">
            <div class="contents_wrap">
                <div class="contents_title">
                    <h2>도우늬문학상 수상작</h2>
                    <a href="/book/award/3/page/1" class="more_btn">더보기</a>
                </div> <!-- // contents_title -->   
               
                <div class="contents_all">
                    
                    <div class="left">
                        <i class="fa fa-chevron-left"></i>
                    </div>
                    <div class="right">
                        <i class="fa fa-chevron-right"></i>
                    </div>
                     
                    <div class="book_list_wrap second_list">
                        <div class="contents_list">
                            <div class="first list">
                            <c:forEach items="${list2}" var="book" step="1" begin="0" end="4">
                                <div class="books_info">
                                    <div class="contents_books">
                                        <a href="/bookDetail/${book.no}">
                                            <img src="${book.bookCover}" alt="${book.title} 이미지" />
                                        </a>
                                        <p class="book_name" title="${book.title}"><a href="/bookDetail/${book.no}">${book.title}</a></p>
                                        <p class="book_author" title="${book.writer}"><a href="/book/writer/${book.writer}/page/1">${book.writer}</a></p>
                                        <div class="book_grade">
                                            <div class="txt_grade" title="${book.rating}"
                                            style="width:${book.rating*12}px">
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
                
                <!-- underscore template 작성 -->
                <script type="text/template" id="bookTmp2">
                    <@_.each(books, function(book){@>
                        <div class="books_info">
                            <div class="contents_books">
                                <a href="/bookDetail/<@=book.no@>">
                                    <img src="<@=book.bookCover@>" />
                                </a>
                                <p class="book_name" title="<@=book.title@>"><a href="/bookDetail/<@=book.no@>"><@=book.title@></a></p>
                                <p class="book_author" title="<@=book.writer@>"><a href="/book/writer/${book.writer}/page/1"><@=book.writer@></a></p>
                                   <div class="book_grade">
                                            <div class="txt_grade" title="<@=book.rating@>" style="width:<@=book.rating*12@>px">
                                            </div>    
                                        </div> <!-- // book_grade-->
                            </div> <!-- // contents_books -->
                        </div> <!-- // books_info -->
                    <@ }); @>
                </script>
            </div> <!-- // contents_wrap -->
        </div> <!-- // listMiddle -->
        <hr />
        <div id="listBottom">
            <div class="contents_wrap">
                <div class="contents_title">
                    <h2>로붸르문학상 수상작</h2>
                    <a href="/book/award/1/page/1" class="more_btn">더보기</a>
                </div> <!-- // contents_title -->   
               
                <div class="contents_all">
                    
                    <div class="left">
                        <i class="fa fa-chevron-left"></i>
                    </div>
                    <div class="right">
                        <i class="fa fa-chevron-right"></i>
                    </div>
                     
                    <div class="book_list_wrap third_list">
                        <div class="contents_list">
                            <div class="first list">
                            <c:forEach items="${list3}" var="book" step="1" begin="0" end="4">
                                <div class="books_info">
                                    <div class="contents_books">
                                        <a href="/bookDetail/${book.no}">
                                            <img src="${book.bookCover}" alt="${book.title} 이미지" />
                                        </a>
                                        <p class="book_name" title="${book.title}"><a href="/bookDetail/${book.no}">${book.title}</a></p>
                                        <p class="book_author" title="${book.writer}"><a href="/book/writer/${book.writer}/page/1">${book.writer}</a></p>
                                        <div class="book_grade">
                                            <div class="txt_grade" title="${book.rating}"
                                            style="width:${book.rating*12}px">
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
                
                <!-- underscore template 작성 -->
                <script type="text/template" id="bookTmp3">
                    <@_.each(books, function(book){@>
                        <div class="books_info">
                            <div class="contents_books">
                                <a href="/bookDetail/<@=book.no@>">
                                    <img src="<@=book.bookCover@>" />
                                </a>
                                <p class="book_name" title="<@=book.title@>"><a href="/bookDetail/<@=book.no@>"><@=book.title@></a></p>
                                <p class="book_author" title="<@=book.writer@>"><a href="/book/writer/${book.writer}/page/1"><@=book.writer@></a></p>
                                   <div class="book_grade">
                                            <div class="txt_grade" title="<@=book.rating@>" style="width:<@=book.rating*12@>px">
                                            </div>    
                                        </div> <!-- // book_grade-->
                            </div> <!-- // contents_books -->
                        </div> <!-- // books_info -->
                    <@ }); @>
                </script>
            </div> <!-- // contents_wrap -->
        </div> <!-- // listBottom -->
    </div> <!-- // contents -->
   <c:import url="template/footer.jsp"></c:import>
   
    <script src="js/jquery.js"></script>
    <script src="js/underscore-min.js"></script>
    <script src="js/template.js"></script>
    <script>
    _.templateSettings = {
    		interpolate : /\<\@\=(.+?)\@\>/gim,
    		evaluate : /\<\@(.+?)\@\>/gim,
    		escape : /\<\@\-(.+?)\@\>/gim
    	};
        // 변수 arr를 선언하고, 자바스크립트 배열로 초기화 
        var arr1 = [
						<c:forEach items="${list1}" var="book" varStatus="status">
						{"title":"${book.title}",
						 "no":${book.no},
						 "writer":"${book.writer}",
						 "bookCover":"${book.bookCover}",
						 "rating":"${book.rating}"	 
						}
						<c:if test="${!status.last}">,</c:if>
						</c:forEach>       
        ];

        var arr2 = [
						<c:forEach items="${list2}" var="book" varStatus="status">
						{"title":"${book.title}",
						 "no":${book.no},
						 "writer":"${book.writer}",
						 "bookCover":"${book.bookCover}",
						 "rating":"${book.rating}"	 
						}
						<c:if test="${!status.last}">,</c:if>
						</c:forEach>
        ];
        
        var arr3 = [
						<c:forEach items="${list3}" var="book" varStatus="status">
						{"title":"${book.title}",
						 "no":${book.no},
						 "writer":"${book.writer}",
						 "bookCover":"${book.bookCover}",
						 "rating":"${book.rating}"	 
						}
						<c:if test="${!status.last}">,</c:if>
						</c:forEach>   
        ];
        
        var idx = 0; // arr 배열 속 객체의 index(번지)를 넣을 idx 변수를 선언하고, 0으로 초기화
        
        // tmp 변수를 선언하고, underscore템플릿(함수)에 bookTmp의 마크업(.html())을 인자로 넣어줌
        var tmp1 = _.template($("#bookTmp1").html()); 
        var tmp2 = _.template($("#bookTmp2").html()); 
        var tmp3 = _.template($("#bookTmp3").html()); 
        var flag = true; // flag 변수를 선언하고, true로 초기화
        
        // #listTop의 right를 눌렀을 때
        $("#listTop .right").click(function() {
            
            //alert("test");
            
            if(flag) {
                flag = false;
                //alert(idx);
                
                if(idx==10) { // idx(객체의 번지)가 10일 때, 세 번째 페이지임
                    idx=-5; 
                } 
               
                idx += 5; // 객체의 번지수에 5를 더함(페이지가 넘어감)
                    // ex) 0번지일 때(첫 번째 페이지), 5를 더하면 두 번째 페이지로 이동함
                    //     5번지일 때(두 번째 페이지), 5를 더하면 세 번째 페이지로 이동함    
                //alert(idx);
                
                var tmpArr = []; // 배열을 넣을 수 있는 tmpArr 선언
                
                // idx가 5일 때, 조건이 i<10이면 i++ => 결과(5, 6, 7, 8, 9) 
                for(var i = idx ; i<idx+5 ; i++) {
                    tmpArr.push(arr1[i]); // tmpArr(배열)의 마지막 번지에 arr[i]추가
                    // arr[5], arr[6], arr[7], arr[8], arr[9] 
                } // for end
                
                //alert(tmp);
                //alert(tmp({books:arr[idx]})); // idx++이 아닌 idx 실행시키면 alert 뜸
            
                //alert($(".hide").attr("class"));
         $(".book_list_wrap.first_list .hide").appendTo(".book_list_wrap.first_list .contents_list")
                          .html(tmp1({books:tmpArr})) // underscore 템플릿 books는 tmpArr의 값으로
                          .css("left",840)
                          .animate({left:0},500)
                          .removeClass("hide")
                          .prev()
                          .addClass("hide")
                          .animate({left:-840},500,function() {
                            //alert($(".first").attr("class"));   
                            flag=true;
                
                          });
                
            } // if flag end
        }); // right click() end
        
        // #listTop의 right를 눌렀을 때
        $("#listTop .left").click(function() {
            
            //alert("test");
            if(flag) {
                flag = false;

                // left 눌렀을 때, 11~15 객체가 나와야 하므로(15일 때, 3번째 페이지 나옴)
                if(idx==0) {
                    idx=15; // idx가 0이면, idx에 15 대입해줌
                }
                //alert(idx);
                
                // 15를 대입받고, 5씩(한 페이지가 포함하는 객체 수) 빼면서 이전 페이지로 이동함
                idx = idx-5;
                //alert(idx); 
                
                var tmpArr = []; // 배열을 넣을 수 있는 tmpArr 선언
            
                // 초기식 : 시작점 정해줌 / 조건식 : for문이 실행되는 조건(언제까지?) / 증감식 : 증가 혹은 감소
                // 533번 라인 idx를 대입받으면, i는 10
                // i < 15보다 작으면, i++ for문 돌아감 => 따라서, 10, 11, 12, 13, 14가 됨! 
                for(var i = idx; i<idx+5; i++) {
                    //alert(i);
                    //alert(arr[i].name);
                    tmpArr.push(arr1[i]);
                    // tmpArr에 (위에 선언한) arr의 배열 번지를 넣어줌
                    // arr[10], arr[11], arr[12], arr[13], arr[14] 
                } // for end
                
                // alert(idx);
  
                $(".book_list_wrap.first_list .hide").appendTo(".book_list_wrap.first_list .contents_list")
                          .html(tmp1({books:tmpArr})) // underscore 템플릿 books는 tmpArr의 값으로
                          .css("left",-840)
                          .animate({left:0},500)
                          .removeClass("hide")
                          .prev()
                          .addClass("hide")
                          .animate({left:840},500,function() {

                            flag=true;
               
                          });
                
            } // if flag end
        }); // left click() end
        
        //----------------------------------------------
        
        // #listMiddle의 right를 눌렀을 때
        $("#listMiddle .right").click(function() {
            
            //alert("test");
            
            if(flag) {
                flag = false;
                //alert(idx);
                
                if(idx==10) { // idx(객체의 번지)가 10일 때, 세 번째 페이지임
                    idx=-5; 
                } 
               
                idx += 5; // 객체의 번지수에 5를 더함(페이지가 넘어감)
                    // ex) 0번지일 때(첫 번째 페이지), 5를 더하면 두 번째 페이지로 이동함
                    //     5번지일 때(두 번째 페이지), 5를 더하면 세 번째 페이지로 이동함    
                //alert(idx);
                
                var tmpArr = []; // 배열을 넣을 수 있는 tmpArr 선언
                
                // idx가 5일 때, 조건이 i<10이면 i++ => 결과(5, 6, 7, 8, 9) 
                for(var i = idx ; i<idx+5 ; i++) {
                    tmpArr.push(arr2[i]); // tmpArr(배열)의 마지막 번지에 arr[i]추가
                    // arr[5], arr[6], arr[7], arr[8], arr[9] 
                } // for end
                
                //alert(tmp);
                //alert(tmp({books:arr[idx]})); // idx++이 아닌 idx 실행시키면 alert 뜸
            
                //alert($(".hide").attr("class"));
         $(".book_list_wrap.second_list .hide").appendTo(".book_list_wrap.second_list .contents_list")
                          .html(tmp2({books:tmpArr})) // underscore 템플릿 books는 tmpArr의 값으로
                          .css("left",840)
                          .animate({left:0},500)
                          .removeClass("hide")
                          .prev()
                          .addClass("hide")
                          .animate({left:-840},500,function() {
                            //alert($(".first").attr("class"));   
                            flag=true;
                
                          });
                
            } // if flag end
        }); // right click() end
        
        // #listMiddle의 right를 눌렀을 때
        $("#listMiddle .left").click(function() {
            
            //alert("test");
            if(flag) {
                flag = false;

                // left 눌렀을 때, 11~15 객체가 나와야 하므로(15일 때, 3번째 페이지 나옴)
                if(idx==0) {
                    idx=15; // idx가 0이면, idx에 15 대입해줌
                }
                //alert(idx);
                
                // 15를 대입받고, 5씩(한 페이지가 포함하는 객체 수) 빼면서 이전 페이지로 이동함
                idx = idx-5;
                //alert(idx); 
                
                var tmpArr = []; // 배열을 넣을 수 있는 tmpArr 선언
            
                // 초기식 : 시작점 정해줌 / 조건식 : for문이 실행되는 조건(언제까지?) / 증감식 : 증가 혹은 감소
                // 533번 라인 idx를 대입받으면, i는 10
                // i < 15보다 작으면, i++ for문 돌아감 => 따라서, 10, 11, 12, 13, 14가 됨! 
                for(var i = idx; i<idx+5; i++) {
                    //alert(i);
                    //alert(arr[i].name);
                    tmpArr.push(arr2[i]);
                    // tmpArr에 (위에 선언한) arr의 배열 번지를 넣어줌
                    // arr[10], arr[11], arr[12], arr[13], arr[14] 
                } // for end
                
                // alert(idx);
  
                $(".book_list_wrap.second_list .hide").appendTo(".book_list_wrap.second_list .contents_list")
                          .html(tmp2({books:tmpArr})) // underscore 템플릿 books는 tmpArr의 값으로
                          .css("left",-840)
                          .animate({left:0},500)
                          .removeClass("hide")
                          .prev()
                          .addClass("hide")
                          .animate({left:840},500,function() {

                            flag=true;
               
                          });
                
            } // if flag end
        }); // left click() end
        
        //----------------------------------------------
        
        // #listBottom의 right를 눌렀을 때
        $("#listBottom .right").click(function() {
            
            //alert("test"); // 작동됨
            
            if(flag) {
                flag = false;
                //alert(idx);
                
                if(idx==10) { // idx(객체의 번지)가 10일 때, 세 번째 페이지임
                    idx=-5; 
                } 
               
                idx += 5; // 객체의 번지수에 5를 더함(페이지가 넘어감)
                    // ex) 0번지일 때(첫 번째 페이지), 5를 더하면 두 번째 페이지로 이동함
                    //     5번지일 때(두 번째 페이지), 5를 더하면 세 번째 페이지로 이동함    
                //alert(idx);
                
                var tmpArr = []; // 배열을 넣을 수 있는 tmpArr 선언
                
                // idx가 5일 때, 조건이 i<10이면 i++ => 결과(5, 6, 7, 8, 9) 
                for(var i = idx ; i<idx+5 ; i++) {
                    tmpArr.push(arr3[i]); // tmpArr(배열)의 마지막 번지에 arr[i]추가
                    // arr[5], arr[6], arr[7], arr[8], arr[9] 
                } // for end
                
                //alert(tmp);
                //alert(tmp({books:arr[idx]})); // idx++이 아닌 idx 실행시키면 alert 뜸
            
                //alert($(".hide").attr("class"));
         $(".book_list_wrap.third_list .hide").appendTo(".book_list_wrap.third_list .contents_list")
                          .html(tmp3({books:tmpArr})) // underscore 템플릿 books는 tmpArr의 값으로
                          .css("left",840)
                          .animate({left:0},500)
                          .removeClass("hide")
                          .prev()
                          .addClass("hide")
                          .animate({left:-840},500,function() {
                            //alert($(".first").attr("class"));   
                            flag=true;
                
                          });
                
            } // if flag end
        }); // right click() end
        
        // #listBottom의 right를 눌렀을 때
        $("#listBottom .left").click(function() {
            
            //alert("test"); // 작동됨
            
            if(flag) {
                flag = false;

                // left 눌렀을 때, 11~15 객체가 나와야 하므로(15일 때, 3번째 페이지 나옴)
                if(idx==0) {
                    idx=15; // idx가 0이면, idx에 15 대입해줌
                }
                //alert(idx);
                
                // 15를 대입받고, 5씩(한 페이지가 포함하는 객체 수) 빼면서 이전 페이지로 이동함
                idx = idx-5;
                //alert(idx); 
                
                var tmpArr = []; // 배열을 넣을 수 있는 tmpArr 선언
            
                // 초기식 : 시작점 정해줌 / 조건식 : for문이 실행되는 조건(언제까지?) / 증감식 : 증가 혹은 감소
                // 533번 라인 idx를 대입받으면, i는 10
                // i < 15보다 작으면, i++ for문 돌아감 => 따라서, 10, 11, 12, 13, 14가 됨! 
                for(var i = idx; i<idx+5; i++) {
                    //alert(i);
                    //alert(arr[i].name);
                    tmpArr.push(arr3[i]);
                    // tmpArr에 (위에 선언한) arr의 배열 번지를 넣어줌
                    // arr[10], arr[11], arr[12], arr[13], arr[14] 
                } // for end
                
                // alert(idx);
  
                $(".book_list_wrap.third_list .hide").appendTo(".book_list_wrap.third_list .contents_list")
                          .html(tmp3({books:tmpArr})) // underscore 템플릿 books는 tmpArr의 값으로
                          .css("left",-840)
                          .animate({left:0},500)
                          .removeClass("hide")
                          .prev()
                          .addClass("hide")
                          .animate({left:840},500,function() {

                            flag=true;
               
                          });
                
            } // if flag end
        }); // left click() end 
    </script>
</body>
</html>