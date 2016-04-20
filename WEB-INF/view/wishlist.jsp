<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title>위시리스트</title>

  <c:import url="template/link.jsp"></c:import>
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
            box-shadow: 0 0 20px 3px #e0e0e0;
        }
        
        #titleBox {
            width: 100%;
            height: 50px;
            position: relative;
        }
        
        #titleBox h1 {
            color: #1c6b10;
            padding: 0 10px;
            font-size: 25px;
            font-weight: 500;
            background-color: white;
            margin: 15px 0 10px 20px;
        }
        
        #titleBox p {
            padding: 0 0 20px 30px;
            font-weight: 200;
            color: gray;
        }
        
        #sortingBar {
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
        
        #sortingBar select {
            position: absolute;
            top: 15px;
            right: 20px;
            height: 30px;
            border: 1px solid #e0e0e0;
            color: darkblue;
            background: linear-gradient(#FFF, #efefef);
        }
        
        #pagingBar .paging_status {
            position: absolute;
            top: 10px;
        }
        
        #pagingBar em {
            font-weight: 500;
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
        .contents_list .books_info .contents_books a{
        color:black;
        }
        .contents_list .books_info .contents_books .book_grade .txt_grade {
            width: 95px;
            height: 23px;
            /*background-color: red;*/
            background-image: url(img/stars.png);
            background-position: 0 -25px;
            background-repeat: no-repeat;
            /*margin: -1px auto;*/
        }
        
        #list .item {
            border-top: 1px solid #c8c8c8;
            /*            border-bottom:1px solid #999;*/
            /*            background-color: lightcoral;*/
            width: 90%;
            margin: auto;
            padding: 20px 0px 20px 20px;
            overflow: hidden;
        }
        
        .item img {
            height: 150px;
            width: 100px;
        }
        
        .img_container {
            background-color: white;
            width: 100px;
            padding: 10px;
            box-shadow: 0 0 5px 5px #e2e2e2;
            float: left;
            margin-left: 15px;
        }
        
        #contents input {
            display: block;
            float: left;
            font-size: 25px;
            font-weight: bold;
            text-align: center;
        }
        
        .info_box {
            float: left;
            font-size: 18px;
            margin-left: 50px;
            line-height: 25px;
        }
        
        .info_box h3 {
            font-size: 16px;
            font-weight: 300;
            color: gray;
        }
        
        .info_box h3 a {
            text-decoration: none;
            color: black;
        }
        
        .info_box h3 a:hover {
            text-decoration: underline
        }
        
        .info_box h2 {
            font-weight: bold;
            font-size: 22px;
            margin-bottom: 5px;
        }
        
        .info_box h2 em {
            font-size: 15px;
            font-weight: 400;
            color: #444;
        }
        
        .item .grade_box {
            margin-top: 8px;
            width: 120px;
            height: 25px;
            background-image: url(img/stars.png);
            background-repeat: no-repeat;
            margin-bottom: 10px;
        }
        
        .item .show_box {
            width: 120px;
            height: 23px;
            background-position: 0 110%;
            background-image: url(img/stars.png);
            background-repeat: no-repeat;
        }
        
        #selectAction {
            height: 60px;
            margin-left: 20px;
            margin-top: 20px;
        }
        
        #checkAll {
            margin: 0 15px 0 43px;
        }
        
        #selectAction button {
            vertical-align: top;
            border: 1px solid #1c6b10;
            background-color: white;
            color: #1c6b10;
            cursor: pointer;
        }
        
        #selectAction button:hover {
            background-color: #d7e8dc;
        }
        
        .wish_info {
            font-size: 17px;
            font-weight: 300;
            color: #333;
        }
        
        .wish_info p {
            margin-bottom: 1px;
        }
        
        .wish_info .original {
            font-size: 14px;
            text-decoration: line-through;
        }
        
        .wish_info .price {
            color: orangered;
            font-weight: bold;
        }
        
        .wish_info .order_prev {
            font-size: 14px;
            margin-top: 5px;
        }
        
        .order_prev em {
            font-weight: bold;
        }
        
        .wish_info button {
            vertical-align: middle;
            border: 1px solid #1c6b10;
            background-color: white;
            color: #1c6b10;
            cursor: pointer;
        }
        
        .wish_info button:hover {
            background-color: #d7e8dc;
        }
        
        .sns_box a {
            font-size: 20px;
        }
        
        .sns_box a .facebook {
            color: #3b5999;
        }
        
        .sns_box a .twitter {
            color: #5ea9dd;
        }
        
        .book_link {
            text-decoration: none;
            color: black;
        }
        
        #recentViewList {
            height: 355px;
            margin-top: 20px;
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
            top: 120px;
            /* 175px or 135px */
            font-size: 30px;
            line-height: 57px;
            text-align: center;
            z-index: 1;
            cursor: pointer;
            background-color: #FFF;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        
        .contents_wrap .left {
            left: 9px;
            text-indent: -2px;
        }
        
        .contents_wrap .right {
            right: 9px;
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
            margin-left: 25px;
            color: #1c6b10;
            /*text-indent: 30px;*/
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
            margin-top: -4px;
        }
        
        .contents_all {
            width: 980px;
            height: 320px;
            margin-top: 15px;
            /*position:relative;*/
            /*background-color: aqua;*/
            /*            display: none;*/
        }
        
        .no_recent {
            /*            background-color: pink;*/
            width: 100%;
            height: 400px;
            display: none;
        }
        
        .no_recent h2 {
            text-align: center;
            font-size: 25px;
            font-weight: 400;
            line-height: 200px;
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
        
        .list {
            width: 840px;
            height: 320px;
            position: absolute;
            /*background:#FFF;*/
        }
        
        .contents_list .first {
            background: #FFF;
        }
        
        .contents_list .second {
            /*background: gray;*/
            left: 840px;
            background: #FFF;
        }
        
        .contents_list {
            width: 840px;
            /*width: 2560px;*/
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
            /**/
            display: none;
        }
        
        .contents_list .books_info {
            width: 152px;
            height: 320px;
            margin-left: 20px;
            float: left;
             white-space: nowrap;
       	overflow:hidden;
       	text-overflow:ellipsis;
            /*background-color: antiquewhite;*/
        }
        
        .contents_list .books_info:first-child {
            margin-left: 0px;
        }
        
        .contents_list .books_info .contents_books {}
        
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
            text-decoration: none;
        }
        
  
        
        hr {
            width: 90%;
        }
        
        .contents_title h2 {
            text-indent: 44px;
        }
        
    </style>
</head>

<c:import url="/header"></c:import>
<c:import url="/sidebar"></c:import>
            <div id="contents">
                <div id="titleBox">
                    <h1>내 위시리스트</h1>
                </div>
                <div id="sortingBar">
                    <div id="selectAction">
                        <input type="checkbox" id="checkAll" />
                        <button class="add_bookcart">장바구니로</button>
                        <button class="delete_all">삭제</button>
                    </div>
                   

                </div>
                <!--//pagingBar-->

                <ul id="list">

				
                </ul>
                <!--위시리스트 도서목록-->
                <hr/>
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
                <!-- //contentsMiddle -->
            </div>
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
            var $checkAll = $("#checkAll");
                
            $checkAll.click(function () {
            	var $checkBox = $("input:checkbox");
                //alert("dd");
                var check = $(this).is(":checked");
                //alert(check);
                if (check) {
                    $checkBox.prop("checked", true);
                    //$('#list').on('prop','input:checkbox',("checked",true));
                } else {
                    $checkBox.prop("checked", false);
                } //else
            }); //checkAll end
            /*$checkAll.click(function(){
                $checkBox.attr("checked","checked")
            });*/



            ///////////////////////////////////////////
            var $wishlistForm = $(".wishlist_form");
            var $addBookcart = $(".add_bookCart");
            
            
            $(".add_bookcart").click(function () {
                var result = confirm("선택 상품들을 장바구니에 담으시겠습니까?");
                
                //$wishlistForm.submit();
                
                if(result) {
                //선택상품 옮기기
              $("#list input:checked").siblings('.info_box').children('.wish_info').children('.wishlist_form')
              .each(function() {
                	//alert("Dd");
                	
                    	var $this = $(this);
                    	addToCart($this); 
                    	  
                    });
                	alert("상품들이 장바구니에 담겼습니다");
                }
            }); //addBookCart
            
            
            
            
            //한개 상품 장바구니로 옮기기
            
            $('#list').on('submit','.wishlist_form',function(e){
            
            	alert("장바구니로 옮겨졌습니다");
            	
            	var $this = $(this);
				addToCart($this);
            	
            	return false;
            });
            
            
            function addToCart($this){
            	var params = $this.serialize();
            	
            	//alert(params);
            	$.ajax("/wishlist/cart", {
           			type:"post",
           			dataType:"json",
           			data: params,
           			error:function(xhr,error,code) {
           				alert(code);
           			},success:function(json) {
           				//true로 바꿈
           				
           			} // error~success end
           		}) // ajax end
            }


            //한개 상품 지우기
            var $deleteForm = $('.delete_form');
            
			$('#list').on('submit','.delete_form',function(e){
				e.preventDefault();
            	alert("삭제");
            	
            	var $this = $(this);
            	deleteWishlist($this);
            	
            	return false;
			});

            
            function deleteWishlist($this){
            	var no= $this.children('.delete_input').val();
            	alert(no);
            	
            	
            	$.ajax("/wishlist/delete", {
           			type:"DELETE",
           			dataType:"json",
           			contentType : 'application/json;charset=UTF-8',
           			data:JSON.stringify(no),
           			error:function(xhr,error,code) {
           				alert(error);
           			},success:function(json) {
           				//true로 바꿈
           				if(json.result) {
           					location.reload();
           					orderByRecent();
           				};
           			} // error~success end
           		}) // ajax end
            }

            
            
            
            //선택된 상품들 지우기


            $(".delete_all").click(function () {
                if(confirm("선택된 상품들을 위시리스트에서 삭제하시겠습니까?")){
                	$("#list input:checked").siblings('.info_box').children('.wish_info').children('.delete_form')
                    .each(function() {
                      	//alert("Dd");
                      	
                          	var $this = $(this);
                          	deleteWishlist($this); 
                          	  
                          });
                      	
                }
                
            }); //deleteAll

            
/* 
            //리스트에서 제거 버튼
            $("#list").on("click",".remove",function(){
            	alert("dd");
            });
            
            //장바구니로 버튼(각각)
            $("#list").on("click",".to_cart",function(){
            	alert("dd");
            });
            
 */            
 
///////////////최신순/오래된순
 $("#order").change(function(){
	 var order = $("#order option:selected").attr('id');
	 
	 if(order=="new"){
		 orderByRecent();
	 }else if(order=="old"){
		 orderByOld();
	 }
	 
 });
 
 
            
            /* 무한 스크롤 */
            
            var $window = $(window), $document = $(document);

//alert(docHeight);

var index = 0;

$window.scroll(function() {

var docHeight = $document.height(), winHeight = $window.height();

var sTop = $window.scrollTop();
/*
console.log("doc:"+docHeight+
           "/win:"+winHeight+
           "/sTop:"+sTop);
*/

if (docHeight == (sTop + winHeight)) {

pageNo++;
orderByRecent();

/*
var tmp = _.template($("#replyTmp").html());

$("#replyList ul").append(tmp({
idx : ++index
}));*/


}

});
var userNo = ${userNo};
var pageNo = 1;

orderByRecent();

function orderByRecent(){
	$.ajax("/wishlist/new/"+userNo+"/page/"+pageNo,{
			type:"post",
			dataType:"json",
			error:function(xhr,error,code){
				alert(error);
				},
			success:function(json){
				//alert(json);
				//alert($('#cartTmp').html());
				var tmp = _.template($('#wishTmp').html());
				var code = tmp({items:json});
				//alert(code);
				
				$("#list").append(code);
				
			}
		})
}//orderByRecent() end

	
/* 
function orderByOld(){
	$.ajax("/wishlist/old/"+userNo+"/page/"+pageNo,{
			type:"post",
			dataType:"json",
			error:function(xhr,error,code){
				alert(error);
				},
			success:function(json){
				//alert(json);
				//alert($('#cartTmp').html());
				var tmp = _.template($('#wishTmp').html());
				var code = tmp({items:json});
				//alert(code);
				$("#list").empty();
				$("#list").append(code);
				
			}
		})
}//orderByRecent() end

 */
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
		if(recentArr.length>=6){
			recentArr.pop();
		}
		
	});
//	alert(recentArr.length);
	console.log(recentArr);
	//alert($('#bookTmp').html());
  var tmp = _.template($("#bookTmp").html());
 
 //alert(tmp);
	$('.list').html(tmp({
		recents:recentArr	
	}))
	 
</script>
            
        <script type="text/template" id="wishTmp">
<@_.each(items,function(item){@>
                    <li class="item">
                        <input type="checkbox" />
                        <a href="">
                            <div class="img_container"><img src="<@=item.bookCover @>" alt="책 제목" /></div>
                        </a>

                        <div class="info_box">
                            <a href="/bookDetail/<@=item.no@>" class="book_link"><h2><@=item.title @> <em><@=item.publicationDate @></em></h2></a>
                            <h3>작가 : <a href="/book/writer/<@=item.writer @>/page/1"><@=item.writer @></a></h3>
                            <h3>출판사 : <a href="/book/publisher/<@=item.publisher @>/page/1"><@=item.publisher @></a></h3>
                            <div class="grade_box">
                                <div class="show_box" style="width:<@=item.rating*12 @>px">
                                    <span class="screen_out"><=item.rating @>점</span>
                                </div>
                            </div>
                            <!--grade_box-->
                            <div class="wish_info">
                                <p><@=item.showDate @>에 위시리스트에 추가되었습니다.</p>
                                <p>가격 : <em class="price"><@=item.salesPrice @>원</em> <em class="original"><@=item.originalPrice @>원</em></p>
                                <form action="/wishlist/cart" method="POST" class="wishlist_form">
                                <input type="hidden" name="bookNo" value="<@=item.no@>">
                                <input type="hidden" name="title" value="<@=item.title@>">
                                <input type="hidden" name="bookCover" value="<@=item.bookCover@>">
                                <input type="hidden" name="salesPrice" value="<@=item.salesPrice@>">
                                <input type="hidden" name="publisher" value="<@=item.publisher@>">
                                <input type="hidden" name="writer" value="<@=item.writer@>">
                                
                                <!-- loginUser.no로 바꾸기 -->
                                
                            
                                <button type="submit" class="to_cart">장바구니로</button>
                                </form>
                                <form action="wishlist/<@=item.wishlistNo >" method="POST" class="delete_form">
                                <input type="hidden" name="_method" value="DELETE">
								<input type="hidden" class="delete_input" name="no" value="<@=item.wishlistNo@>">
                                <button class="remove">리스트에서 제거</button>
                                </form>
                                <!--<p class="order_prev">오늘 주문하시면 <em>3월 18일</em>에 받으실 수 있습니다</p>-->
                                <div class="sns_box">
                                    <a href="" title="페이스북으로 공유"><i class="fa fa-facebook-square facebook"></i></a>
                                    <a href="" title="트위터로 공유"><i class="fa fa-twitter-square twitter"></i></a>
                                </div>
                                <!--sns_box-->
                            </div>
                            <!--wish_info-->
                        </div>
                    </li>
                    <@});@>
</script>
</body>
</html>