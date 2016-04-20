<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
        <div class="template">
        <div id="sidebarWrap" >
        <div id="sidebarAllBox">
            <div id="sidebarRecommendationBook" class="sidebar_box sidebar_img">
                <h4>추천 도서</h4>
                <a href="/bookDetail/${recommendationBook.no}"><img src="${recommendationBook.bookCover}" alt="${recommendationBook.title}" title="${recommendationBook.title}"/></a>
            </div><!--//sidebarRecommendationBook -->
            <div id="sidebarPopularBook" class="sidebar_box sidebar_img">
                <h4>인기 도서</h4>
                <a href="/bookDetail/${popularBook.no}"><img src="${popularBook.bookCover}" alt="${popularBook.title}" title="${popularBook.title}" /></a>
            </div><!--//sidebarPopularBook -->
            <div id="sidebarRecentBook" class="sidebar_box sidebar_img">
                <h4>최근 본 도서</h4>
                    <div id="recentBookImgBoxWrap">
                    <i id="recentBookLeftBtn" class="fa fa-caret-left recentBookBtn"></i>
                    <i id="recentBookRightBtn" class="fa fa-caret-right recentBookBtn"></i>    
                    <ul id="recentBookImgBox">
                        <!--최근본 도서가 없을경우  -->
                        <li class="recent_book msg">최근 본 </br> 도서가<br/> 없습니다</li> 
                        
                        <!--최근본 도서가 있을경우  -->
                        <li class="recents_cell"><a id="bookNo1" href="bookDetail.html"><img class="click_book" id="recents1" src="" title="" /></a></li>
                        <li class="recents_cell"><a id="bookNo2" href="bookDetail.html"><img class="click_book" id="recents2" src="" title="" /></a></li> 
                    </ul>
                    </div><!--//sidebarRecentBook -->    
            </div><!--//sidebarRecentBook-->
            <div id="moveToTop" class="sidebar_submenu">
                
            </div><!-- //moveToTop -->
            <div id="moveToCart" class="sidebar_submenu">
                <a href="">
                    <i class="fa fa-arrow-circle-up" title="맨 위로"></i>
                </a>
            </div><!--//moveToCart -->
        </div><!-- //sidebarAllBox -->    
    </div><!-- //sidebarWrap -->
        </div><!--template-->
        <div id="content" class="hide_area">

        </div>
        <!-- //content -->
        
  
  
<script src="/js/jquery.js"></script>        
<script>

//테스트 set스토리지
/*   sessionStorage.setItem('test',JSON.stringify([
                                                 {"title":"1","bookCover":"https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788952775634%3Fmoddttm=20160330110403"},
                                                 {"title":"2","bookCover":"https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788952775634%3Fmoddttm=20160330110403"},
                                                 {"title":"3","bookCover":"https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788952775634%3Fmoddttm=20160330110403"},
                                                 {"title":"4","bookCover":"https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788952775634%3Fmoddttm=20160330110403"},
                                                 {"title":"5","bookCover":"https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788952775634%3Fmoddttm=20160330110403"},
                                                 {"title":"6","bookCover":"https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788952782076%3Fmoddttm=20160330110403"},
                                                 {"title":"7","bookCover":"https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788952772398%3Fmoddttm=20160328073528"},
                                                 {"title":"8","bookCover":"https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788952772398%3Fmoddttm=20160330110403"},
                                                 {"title":"9","bookCover":"https://t1.search.daumcdn.net/thumb/R110x160/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fbook%2FKOR9788952782076%3Fmoddttm=20160330110403"}
                                                 ]));   */ 
//스토리지에 넣어진 배열의 값을 얻어옴
var data2 = sessionStorage.getItem('recents');

//넘어온 배열 제이슨으로  data2에 담음
 recents = JSON.parse(data2); 

console.log(recents);



/* alert("최근본 도서 수"+recents);

alert("데이터"+recents); */

//alert("받아온 이름"+test[0].title);
 
//최근본 도서가 없을경우  
if(recents == null){
 $(".msg").css("display","block");
 $(".recents_cell").css("display","none");
}




 //배열에서 두개만 받아옴
 //마지막 배열에 담긴애가 위에 나타남
 for(var i = 0 ; i <= recents.length ; i++  ){
	
	 

	//넘어온 도서들의 제목을 뽑아냄
	//alert(recents[i].title);
	 var title;
	 var bookCover;
	 var no;
	 if(i == recents.length-1){ 
		no = recents[i].no;
		$("#bookNo1").attr("href","bookDetail/"+no);	 
		
		title = recents[i].title;
		$("#recents1").attr("title",title);	
		
		bookCover = recents[i].bookCover;
		$("#recents1").attr("src",bookCover);
		
	
	
	 }else{   
		no = recents[i].no;
		$("#bookNo2").attr("href","bookDetail/"+no); 
		 
		title = recents[i].title;
		$("#recents2").attr("title",title);		
			
		bookCover = recents[i].bookCover;
		$("#recents2").attr("src",bookCover);	
	}	 
	
}
</script>

<!-- 로그아웃하면 최그본도서 초기화 -->
<c:if test="${login == null}">
<script>
	//alert("test");
	sessionStorage.clear();
</script>

</c:if>

