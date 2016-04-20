<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

   <c:import url="template/link.jsp"></c:import>
<head>
    <meta charset="UTF-8">
    <title>베스트셀러</title>

   <!-- 링크 -->
    <style>
        html {
            width: 100%;
        }
        
        body {
            width: 100%;
            font-family: 'Kakao', sans-serif;
            font-weight: 200;
        }
        
        #contents {
            width: 980px;
            overflow: hidden;
            margin: auto;
        }
        
        #contents #titleBox {
            width: 100%;
            height: 50px;
            text-align: center;
            position: relative;
        }
        
        #contents #titleLine {
            width: 100%;
            display: block;
            background-color: palegoldenrod;
            border-top: 1px solid #999;
            position: absolute;
            z-index: 1;
            top: 50%;
        }
        
        #contents .bracket {
            color: darkgray;
            width: 20px;
            height: 40px;
        }
        
        #contents h1 {
            display: inline-block;
            padding: 0 10px;
            font-size: 30px;
            font-weight: 500;
            background-color: white;
            position: absolute;
            left: 50%;
            margin-left: -150px;
            top: 20%;
            z-index: 2;
        }
        
        #contents #pagingBar,
        #pagingBarEnd {
            margin-top: 15px;
            width: 100%;
            height: 60px;
            border-top: 1px solid #e2e2e2;
            border-bottom: 1px solid #e2e2e2;
            background: linear-gradient(#F9F8F6, #FFF);
            position: relative;
            line-height: 40px;
            box-shadow: 10px 10px 50px #efefef;
        }
        
        #contents #pagingBar .paging_status {
            position: absolute;
            top: 10px;
        }
        
        #contents #pagingBar em {
            font-weight: 500;
        }
        
        #contents .number_container {
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
        
        #contents .number_container span,
        .number_container a {
           float: left;
            border-right:  1px solid #999;
            padding:0 3px;
/*            vertical-align: text-top;*/
            line-height: 35px;
            width:30px;
            text-align: center;
            color:#08511c;
            margin: 0;
            font-size: 16px;
            text-decoration: none;
        }
        
        #contents .number_container a:hover {
            background: linear-gradient(#FFF, #e2e2e2);
        }
        
        #contents .number_container a:last-child {
            border-right: none;
        }
        
        #contents .item {
            border-top: 1px solid #999;
            /*            border-bottom:1px solid #999;*/
            /*            background-color: lightcoral;*/
            width: 980px;
            min-height: 170px;
            padding: 20px 20px 30px 20px;
        }
        
        #contents .item img {
            height: 150px;
            width: 100px;
        }
        
        #contents .img_container {
            background-color: white;
            width: 100px;
            padding: 10px;
            box-shadow: 0 0 5px 5px #e2e2e2;
            float: left;
            margin-left: 15px;
        }
        
        #contents .book_no {
            width: 30px;
            /*            background-color: yellow;*/
            float: left;
            font-size: 25px;
            font-weight: bold;
            text-align: center;
        }
        
        #contents .info_box {
            float: left;
            font-size: 18px;
            margin-left: 50px;
            line-height: 25px;
        }
        
        #contents .info_box h3 {
            font-size: 16px;
            font-weight: 300;
            color: gray;
        }
        
        #contents .info_box h3 a {
            text-decoration: none;
            color: black;
        }
        
        #contents .info_box h3 a:hover {
            text-decoration: underline
        }
        
        #contents .info_box h2 {
            font-weight: bold;
            font-size: 22px;
            margin-bottom: 5px;
        }
        
        #contents .info_box h2 em {
            font-size: 15px;
            font-weight: 400;
            color: #444;
        }
        
        #contents .item .grade_box {
            width: 120px;
            height: 25px;
            background-image: url(/img/stars.png);
            background-repeat: no-repeat;
            float: left;
            position: relative;
            margin: 7px 5px 3px auto;
        }
        
        .rating_count {
            padding-top: 5px;
        }
        
        #contents .item .show_box {
            /*12.125*/
            width: 120px;
            height: 25px;
            background-image: url(/img/stars.png);
            background-position: 0 120%;
            background-repeat: no-repeat;
            position: absolute;
            top: 0;
            left: 0;
            /*            background-color: pink;*/
        }
        
        #contents .item table {
            margin-top: 5px;
            width: 265px;
            height: 35px;
            text-align: left;
            line-height: 35px;
            border: none;
            /*background-color: red;*/
        }
        
        #contents tr {
            width: 100px;
            /*            background-color: yellow;*/
        }
        
        #contents tr th:last-child,
        tr td:last-child {
            text-align: left;
            width: 500px;
        }
        
        #contents tr td:first-child {
            width: 230px;
            /*            background-color: blue;*/
        }
        
        #contents table .price {
            font-weight: bold;
            color: orangered;
        }
        
        #contents table .non-dc {
            margin-left: 5px;
            text-decoration: line-through;
            font-size: 15px;
            color: #333;
        }
        
        #contents table .category {
            color: #4c6842;
            font-weight: 300;
        }
        
        #contents table td {
            border-top: 1px solid #999;
        }
        
        #contents .book_link {
            text-decoration: none;
            color: black;
            font-weight: 700;
        }
    </style>
</head>

<c:import url="/header"></c:import>
<c:import url="/sidebar"></c:import>

                <div id="contents">
                    <div id="titleBox">
                        <span id="titleLine"></span>
                        <h1><span class="bracket left">&#123; </span>빈즈앤노블 베스트셀러<span class="bracket right"> &#125;</span></h1>
                    </div>
                    <div id="pagingBar">
                        

                        <div class="number_container">
                            <!--페이지번호를 담는 div-->
                            <!--페이징유틸-->
                           ${paginate }
                        </div>
                    </div>
                    <!--//pagingBar-->


                    <ul>
                    
						<c:forEach items="${list }" var="book">
						
                        <li class="item">
                            <p class="book_no">${book.r }</p>
                            
                                <div class="img_container"><a href=""><img src="${book.bookCover }" alt="책 제목" /></a></div>
                            
                            <div class="info_box">  
                                <h2><a href="/bookDetail/${book.no }" class="book_link">${book.title }<em>&#40;<fmt:formatDate value="${book.regdate}" pattern="YYYY-M-d"/> &#41;</em></a></h2>
                                <h3>작가 : <a href="/book/publisher/${book.writer}/page/1">${book.writer }</a></h3>
                                <h3>출판사 : <a href="/book/publisher/${book.publisher }/page/1">${book.publisher }</a></h3>
                                <div class="grade_box">
                                    <div class="show_box" style="width:${book.rating*12 }px">
                                        <span class="screen_out">${book.rating}점</span>
                                    </div>
                                </div>
                                <!--grade_box-->
                                <p class="rating_count"> (${book.ratingCount })</p>

                                <table>
                                    <thead>
                                        <tr>
                                            <th>분류</th>
                                            <th>${book.categoryName }</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><em class="category">B&amp;N가</em></td>
                                            <td><em class="price">${book.salesPrice }원</em></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </li>
                        
                        </c:forEach>
                       

                    </ul>
                    <div id="pagingBarEnd">

                        <div class="number_container">
                            <!--페이지번호를 담는 div-->
                            <!--페이징유틸-->
                            ${paginate }
                        </div>

                    </div>
                    <!--//pagingBarEnd-->

                </div>
                <!--//contents-->

<c:import url="template/footer.jsp"></c:import>

        <script src="js/jquery.js"></script>
        <script src="js/template.js"></script>
        <script>
            var $ref_book = $(".ref_book"),
                $classics_book = $(".classics_book"),
                $window = $(window),
                $sidebarWrap = $("#sidebarWrap"),
                $myageListBlock = $("#myageListBlock");

            //주제별 리스트 박스 맨 하단 보더 지우는 함수 호출    
            subjectBorderStyle();

            //마이페이지 클릭시 메뉴바 사라졌다 나타났다     
            $("#mypage").click(function () {
                    //alert("test");
                    $("#mypageList").fadeToggle(200);
                }) //#mypage click end    


            /* 주제별 제목 맨 아래 보더 지우는 함수 */
            function subjectBorderStyle() {
                var number;
                number = $("#allSubjects li").size() - 1;
                //alert(number);
                $("#categoryForm #categoryBar #allSubjects li")
                    .eq(number).css("border-bottom", "none");
                $("#categoryForm #categoryBar #allSubjects li")
                    .eq(number - 1).css("border-bottom", "none");
                $("#categoryForm #categoryBar #allSubjects li")
                    .eq(number - 2).css("border-bottom", "none");
            }

            /* 헤더 아래로 내려가면 사이드바가 생김 */
            $window.scroll(function () {
                //alert("test");
                //현재스크롤 위치 
                //alert($(window).scrollTop());

                //현재스크롤 위치를 location에 대입
                var location = $window.scrollTop();

                if (location >= 150) {
                    $sidebarWrap.css("position", "fixed")
                        .css("top", "50px")
                        .fadeIn(200);
                } else {
                    //alert("test");
                    $sidebarWrap.css("position", "absolute")
                        .css("top", "190px");
                } //if~ else end
            });

            /*맨위로 버튼 클릭시 스크롤 맨 상단으로 이동 */
            $("#moveToCart a").click(function (e) {
                e.preventDefault();
                $('html, body').animate({
                    scrollTop: 0
                }, 300);
                return false;
            });

            /* 로그인 버튼 클릭시 팝업창 띄워짐 */
            $("#mypageLogin").click(function (e) {
                    e.preventDefault();
                    //alert("test");
                    $("#myageListBlock").fadeIn(200);
                })
                /*로그인 팝업창에서 취소 버튼 누르면 팝업창 사라짐*/
            $(".cancel_login_form").click(function () {

                    //alert("test");
                    $myageListBlock.fadeOut(300);
                }) //cancel_login_form end
        </script>

</html>