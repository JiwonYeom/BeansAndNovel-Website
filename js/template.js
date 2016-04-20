

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
$window.scroll(function(){
    //alert("test");
    //현재스크롤 위치 
    //alert($(window).scrollTop());
    
    //현재스크롤 위치를 location에 대입
var location =  $window.scrollTop();

  if(location>=150){
        $sidebarWrap.css("position","fixed")
                    .css("top","50px")
                    .fadeIn(200);
    }else{
        //alert("test");
        $sidebarWrap.css("position","absolute")
                    .css("top","190px");     
    }//if~ else end
});

/*맨위로 버튼 클릭시 스크롤 맨 상단으로 이동 */
$("#moveToCart a").click( function(e) {
    e.preventDefault();
  $( 'html, body' ).animate( { scrollTop : 0 }, 300 );
  return false;
} );

/* 로그인 버튼 클릭시 팝업창 띄워짐 */
$("#mypageLogin").click(function(e){
    e.preventDefault();
    //alert("test");
    $("#mypageList").hide(200);
    
    
    $("#myageListBlock").fadeIn(200);
})


/*로그인 팝업창에서 취소 버튼 누르면 팝업창 사라짐*/
$(".cancel_login_form").click(function(){
    
    //alert("test");
    $myageListBlock.fadeOut(300);
})//cancel_login_form end


//alert("test");	
	var $searchForm = $("#searchForm"),
	    $searchWay = $("#searchWay");
	
 $searchForm.keyup(function(e){
	//alert("test");
	var word = $searchForm.val();
	//alert(word);

	//실시간 검색어 얻어옴
	var title = '%'+word+'%';
		
	//alert("검색어 받아옴"+title);
	bookSearch(title);
})


        