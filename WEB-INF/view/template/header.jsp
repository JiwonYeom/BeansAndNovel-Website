<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<body class="hide_area">
    <!-- 로그인시 띄워지는 팝업 로그인 창-->
    
    <div class="template">
    <div id="myageListBlock" class="login_page_show">
        <div id="loginFormBox">
        <div id="loginTitle"><span>로그인하거나 회원가입해주세요</span><button class="cancel_login_form"><i class="fa fa-times"></i></button></div>
            <div id="loginForm">
                <form action="/session" method="post">
                <p>
                    <label for="id">아이디</label>
                    <input type="text" id="id" name="id" placeholder="아이디 입력" />
                </p>
                <p>
                   <label for="password">비밀번호</label>
                   <input type="password" id="password" name="password" placeholder="비밀번호 입력" />
                </p>
                <c:if test="${login==null}">
                </c:if>
                <p>
                    <button class="loginBtn">로그인</button> 
                </p>
                </form>          
                <p>
                	<input type="checkbox" id="saveId">아이디저장<br/>
                </p>    
<hr/>
                <p>
                <a id="joinBtn" href="/join"><i class="fa fa-users"></i>회원가입</a>
                <a id="findPwd" href="/help"><span>비밀번호를<br/> 잊어버리셨나요?</span></a>
                </p>
            </div><!--//loginForm -->
        </div><!--//loginFormBox -->
    </div><!--//myageListBlock -->
    </div><!--template-->
    <div id="pageWrap">
        <div class="template">
        
        <div id="headerWrap">
            <div id="searchFormBox" class="hide_area">
                <div>
                    <ul>
                        <li><a href="/index" class="title_link"><h1 id="siteTitle">Beans &amp; Novel</h1></a></li>
                        <li>
                        <form id="searchWay" action="/book/search" method="GET">
                        	<!-- form으로 파라미터를 여러개 넘길때 는 input type="hidden"을 이용 -->
                        	<input type="hidden" name="orderBy" value="rating_sum/rating_count"/>
                        	<input type="hidden" name="numPage" value="20"/>
                            <input id="searchForm" type="text" name="title" placeholder="도서명 입력" />
                            <button id="searchBtn" title="검색"><i class="fa fa-search"></i></button>
                        </form>   
                        
                            <div id="searchResultBox">
                                <ul>

                                </ul>
                                
<script type="text/template" id="booksSearchTmp">
<@_.each(books,function(book){@>
	 <li><a href="/bookDetail">해리포터</a></li>
<@})@>
</script>                               
                                
                                
                            </div><!-- //searchResultBox -->

                            
                        </li>

                        <!-------------------------- 장바구니 css ------------------------------------>
            <li class="shopping">
            <form id="bookCartForm" action="/bookCart" method="GET">
            <button>
            <i title="장바구니" class="fa fa-shopping-basket"></i>
            </button>
            </form>
            <div id="shoppingList">
            <h2 class="screen_out">
            장바구니 목록
            </h2>
            <c:if test="${login == null}">
            <h3 id="cartMsg">
                <i class="fa fa-shopping-cart"></i> 
                로그인후 이용해 주세요<br/>
            </h3>    
            </c:if>
            <ul id="shoppingListBooks">
           <c:forEach items="${bookCartList}" var="book">
            <li>
			<a href="/bookDetail/${book.no}"><img src="${book.bookCover}" alt="${book.title}" />
            </a>
            <div class="book_info">
            <span class="book_name" title="${book.title}">${book.title}</span>
            <a class="book_author" title="${book.writer}" href="">${book.writer}</a>
            </span>
            <form class="shopping_update_btn" action="/updateQuantity/${book.no}" method="POST">
            <input type="hidden" name="_method" value="put"/>	
            <input type="text" class="quantity" maxlength="4" name="quantity" value="${book.quantity}" />개
           	<button type="submit" class="quantity_update"><i class="fa fa-pencil-square-o"></i>수정</button>
            </form>
            <form class="purchase_form" action="/purchase" method="GET">
            <button class="book_purchase"><i class="fa fa-credit-card"></i>구매</button>
            </form>

            </div>
            <!--//book_info -->
            </li>
            </c:forEach> 
            </ul>
            </div><!--//shoppingList -->
            </li>
                        <li>
                            <a href="/help"><i title="고객센터" class="fa fa-question-circle"></i></a>
                        </li>
                    </ul>
                    <!-------------------------- 마이페이지 css ------------------------------------>
                    
                    <div id="mypage">
                        마이페이지 <i class="fa fa-list"></i>
                    </div>
                    <div id="mypageList">
                        <ul>
                            <!--로그인시 로그인 회원가입 사라짐 -->
                            <c:choose>
                            <c:when test="${login==null}">
                            <li>
                            	
                                <a href="">
                                    <span id="mypageLogin">로그인</span>
                                </a>
                                
                            </li>
                           
                            <li>
                                <a href="/join">
                                    <span id="mypageJoin">회원가입</span>
                                </a>
                            </li>
                            </c:when>
                            <c:otherwise>
                            <li><a href="/update">계정설정</a></li>
                            <li><a href="/mypage">주문현황</a></li>
                            <li><a href="/wishlist">위시리스트</a></li>
                            <li>
                            <form action="/session" method="POST">
                                <input type="hidden" name="_method" value="delete" />
                                <button class="delete">
                                    <span>로그아웃</span>
                                </button>
                            </form>    
                            </li>
                            </c:otherwise>
                            </c:choose>
                        </ul>

                    </div>
                   <c:if test="${login!=null}">
                   	 <span id="welcome">${login.nickname}님 환영합니다</span>
                   </c:if> 
                   

                </div>
            </div>
            <!--//searchForm -->
            <!-------------------------- 카테고리 css ------------------------------------>
            <div id="categoryForm">
                <ul id="categoryBar">
                    <li>
                        <a href="" id="popularBookCategory">인기도서</a>
                        <ul id="popularBook" class="category_list_box">
                            <span class="triangle test_2"></span>
                            <li><a class="category_style"
                                   href="/book/bestsellers/page/1">베스트 셀러</a>
                            </li>
                            <li><a class="category_style" 
                                   href="/book/new/page/1">신작도서</a>
                            </li>
                            
                        </ul>
                    </li><!--  
                  --><li>
                        <a id="" href="">주제별</a>
                        <ul id="allSubjects" class="category_list_box">
                            <span class="triangle test_2"></span>
                            <li>
                                <a class="category_style" href="/book/category/문학/page/1">문학</a>                                </li>
                            <li>
                                <a class="category_style" href="/book/category/인문/page/1">인문</a>                                </li>
                            <li>
                                <a class="category_style" href="/book/category/가정_생활_건강/page/1">가정/생활/건강</a>                                </li>
                            <li>
                                <a class="category_style" href="/book/category/요리/page/1">요리</a>                              </li>
                            <li>
                                <a class="category_style" href="/book/category/취미_스포츠/page/1">취미/스포츠</a>                            </li>
                            <li>
                                <a class="category_style" href="/book/category/경제_경영/page/1">경제/경영</a>                                </li>
                            <li>
                                <a class="category_style" href="/book/category/정치_사회/page/1">정치/사회</a>                                </li>
                            <li>
                                <a class="category_style" 
                                   href="/book/category/역사_문화/page/1">역사/문화</a>
                           </li>
                            <li>
                                <a class="category_style" 
                                   href="/book/category/자기계발/page/1">자기계발</a>
                           </li>
                            <li>
                                <a class="category_style" href="/book/category/종교/page/1">종교</a>                                </li>
                            <li>
                                <a class="category_style" href="/book/category/예술_대중문화/page/1">예술/대중문화</a>                            </li>
                            <li>
                                <a class="category_style" href="/book/category/기술_공학/page/1">기술/공학</a>                               </li>
<li>
                                <a class="category_style" href="/book/category/외국어_사전/page/1">외국어/사전</a>                                </li>
                            <li>
                                <a class="category_style" href="/book/category/과학/page/1">과학</a>                                </li>
                            <li>
                                <a class="category_style" href="/book/category/취업_수험서/page/1">취업/수험서</a>                                </li>
                            <li>
                                <a class="category_style" href="/book/category/여행_기행/page/1">여행/기행</a>                              </li>
                            <li>
                                <a class="category_style" href="/book/category/컴퓨터_IT/page/1">컴퓨터/IT</a>                            </li>
                            <li>
                                <a class="category_style" href="/book/category/잡지/page/1">잡지</a>                                </li>
                            <li>
                                <a class="category_style" href="/book/category/참고서/page/1">참고서</a>                                </li>
                            <li>
                                <a class="category_style" 
                                   href="/book/category/청소년/page/1">청소년</a>
                           </li>
                            <li>
                                <a class="category_style" 
                                   href="/book/category/유아_아동/page/1">유아/아동</a>
                           </li>
                            <li>
                                <a class="/book/category/만화/page/1" href="comic.html">만화</a>                                </li>

                        </ul>
                    </li><!--   
                  --><li>
                        <a href="/book/specialPrice/page/1">특가도서</a>
                    </li><!--
                  --><li>
                        <a id="scCategory" href="">특별전</a>
                        <ul id="scBook" class="category_list_box">
                            <span class="triangle test_2"></span>
                            <li><a class="category_style" href="/book/awards">수상작</a></li>
                            <li><a class="category_style" href="/book/collection/page/1">B &amp; N 컬렉션</a></li>
                        </ul>
                    </li><!--  
                  --><li>
                        <a id="priceCategory" href="">가격별</a>
                        <ul id="price" class="category_list_box">
                            <span class="triangle test_2"></span>
                            <li><a class="category_style" href="/book/price/0-10000/page/1">10,000원 이하</a></li>
                            <li><a class="category_style" href="/book/price/10000-30000/page/1">10,000원~30,000원</a></li>
                            
                            <li><a class="category_style" href="/book/price/30000-300000/page/1">30,000 이상</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

  
</div><!--headerWrap-->
        </div><!--template-->
        
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script>
_.templateSettings = {
		 interpolate: /\<\@\=(.+?)\@\>/gim,
		 evaluate: /\<\@(.+?)\@\>/gim,
		 escape: /\<\@\-(.+?)\@\>/gim
		};
		

		

 $(function(){
	// 쿠키값을 가져온다.
	var cookie_user_id = getLogin();


	/**
	* 쿠키값이 존재하면 id에 쿠키에서 가져온 id를 할당한 뒤
	* 체크박스를 체크상태로 변경
	*/
	if(cookie_user_id != "") {
	$("#id").val(cookie_user_id);
	$("#saveId").attr("checked", true);
	}

	// 아이디 저장 체크시
	$("#saveId").on("click", function(){
	var _this = this;
	var isRemember;
		
	if($(_this).is(":checked")) {
	isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");
					
	if(!isRemember)    
	$(_this).attr("checked", false);
	}
	});

	// 로그인 버튼 클릭시
	$(".loginBtn").on("click", function(){
	if($("#saveId").is(":checked")){ // 저장 체크시
	saveLogin($("#id").val());
	}else{ // 체크 해제시는 공백
	saveLogin("");
	}
	});
	});

	/**
	* saveLogin
	* 로그인 정보 저장
	*/
	function saveLogin(id) {
	if(id != "") {
	// userid 쿠키에 id 값을 7일간 저장
	setSave("id", id, 7);
	}else{
	// userid 쿠키 삭제
	setSave("id", id, -1);
	}
	}

	/**
	* setSave
	* Cookie에 id를 저장
	*/
	function setSave(name, value, expiredays) {
		var today = new Date();
		today.setDate( today.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
	}

	/**
	* getLogin
	* 쿠키값을 가져온다.
	*/
	function getLogin() {
	// userid 쿠키에서 id 값을 가져온다.
	var cook = document.cookie + ";";
	var idx = cook.indexOf("id", 0);
	var val = "";

	if(idx != -1) {
	cook = cook.substring(idx, cook.length);
	begin = cook.indexOf("=", 0) + 1;
	end = cook.indexOf(";", begin);
	val = unescape(cook.substring(begin, end));
	}
	return val; 
 
	}

	

</script>	

<!-- 아이디나 비밀번호 틀렸을 시 나타나는 메세지 -->
<c:if test="${loginMsg != null}">
<script>
	alert('${loginMsg}');
</script>



</c:if>	