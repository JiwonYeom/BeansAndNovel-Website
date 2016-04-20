<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>

<head>
<meta charset="UTF-8">
<title>${book.title }</title>
<c:import url="template/link.jsp"></c:import>
<style>
html {
	overflow-y: 0;
}

body {
	font-family: 'Kakao', sans-serif;
}

:-moz-any-link:focus {
	outline: none;
}

#contents {
	width: 980px;
	min-height: 1500px;
	margin: auto;
}

#productDetail {
	width: 980px;
	height: 470px;
	padding-top: 15px;
	box-shadow: 0 8px 5px -5px #BDBDBD;
	position: relative;
}

#bookMenuBar {
	width: 976px;
	height: 30px;
	padding-top: 15px;
	border-bottom: 1px solid #E0E0E0;
}



#produceBook p {
	line-height: 24px;
	color: #555;
}

#produceBook {
            width: 980px;
            height: 150px;
            font-size: 18px;
            overflow: hidden;
            font-size: 16px;
            transition: .3s ease;
        }
        
        #produceBook.showProduce {
            height: 600px;
        }
        
        #tableOfContents {
            width: 980px;
            height: 60px;
            margin-top: 10px;
            overflow: hidden;
            transition: .3s ease;
        }
        
        #tableOfContents.show {
            height: 505px;
        }

#replysContainer {
	width: 980px;
	min-height: 200px;
	border-top: 2px solid #BDBDBD;
	box-shadow: 0 8px 5px -5px #BDBDBD;
}

#bookImg {
	width: 192px;
	height: 276px;
	float: left;
	margin-top: 15px;
}

#magnify {
	position: absolute;
	left: 46px;
	top: 320px;
	border: none;
	background: none;
	cursor: pointer;
	font-size: 18px;
}

#productSummary {
	width: 740px;
	height: 470px;
	float: left;
	margin-top: 15px;
	margin-left: 20px;
	position: relative;
}

#productSummary #outOfStockBox {
	background-color: rgba(255, 255, 255, .7);
	width: 600px;
	height: 161px;
	position: absolute;
	bottom: 26px;
	left: 0;
}

#detailPoint {
	width: 740px;
	height: 165px;
	border-bottom: 1px solid #BDBDBD;
}

#detailPointTitle {
	/*background-color: green;*/
	position: relative;
}

#detailPoint h1 {
	font-weight: 500;
	font-size: 35px;
	margin-bottom: 15px;
	margin-top: 4px;
	display: inline-block;
}

#detailPoint #outOfStockMsg {
	display: inline-block;
	background-color: orangered;
	/*border: 2px solid coral;*/
	width: 50px;
	height: 30px;
	line-height: 30px;
	font-weight: 500;
	font-size: 20px;
	letter-spacing: 2px;
	text-align: center;
	color: #FFF;
	position: absolute;
	top: 6px;
	right: 245px;
}

#detailPoint p {
	font-size: 16px;
	font-weight: 400;
}

#author {
	list-style: none;
	margin-bottom: 10px;
	color: #616161;
	font-size: 15px;
}

#author li {
	display: inline;
	/* 글자 옆에 바 */
	border-left: 1px solid #000;
	padding-left: 8px;
	margin-right: 6px;
}

#author li:first-child {
	border: none;
	padding-left: 0;
}

.main_grade_box {
	width: 760px;
	height: 23px;
	margin-bottom: 10px;
}

.main_grade_box a {
	text-decoration: none;
	color: #424242;
	line-height: 23px;
	margin-left: 7px;
	font-weight: 400;
}

.grade_box_wrap a:hover {
	color: #1565C0;
	text-decoration: underline;
}

.grade_box {
	width: 120px;
	height: 23px;
	background-image: url(/img/stars.png);
	background-position: 1px 0;
	float: left;
}

.grade_on {
	width: 0px;
	height: 23px;
	background-image: url(/img/stars.png);
	background-position: 1px -24px;
	text-indent: -9999px;
	overflow: hidden;
}

#detailPrice {
	width: 740px;
	height: 70px;
	border-bottom: 1px solid #BDBDBD;
	padding: 15px 0;
	font-size: 16px;
	padding-bottom: 20px;
}

#detailPrice p {
	margin-bottom: 10px;
}

#bookPrice {
	font-size: 25px;
	color: orangered;
	font-weight: 700;
}

#free {
	font-size: 20px;
	color: #0D47A1;
	font-weight: 700;
}

#amountBox {
	width: 740px;
	height: 20px;
	padding: 30px 0;
	font-size: 15px;
}

#amountCount {
	width: 45px;
	height: 30px;
	font-size: 20px;
	text-align: right;
	border: 1px solid #BDBDBD;
	margin-right: 3px;
	padding: 0 5px;
	background: #F5F5F5;
}

#amountCount:focus {
	border-color: #333;
	background: #F5F5F5;
	outline: 2px solid #0288D1;
}

#plusAmount, #minusAmount {
	border: 1px solid #BDBDBD;
	background-color: #fff;
	width: 25px;
	height: 25px;
	font-size: 15px;
	font-weight: 500;
	color: #424242;
	cursor: pointer;
}

#btnBox {
	width: 350px;
	height: 60px;
	padding-top: 15px;
}

#btnBox button {
	width: 170px;
	height: 55px;
	font-size: 18px;
	cursor: pointer;
	border-radius: 3px;
	font-weight: 500;
}

#goBookcart, #goBuy {
	border: none;
	color: #fff;
}

#goBookcart {
	background: linear-gradient(#8BC34A, #7CB342);
	border: 1px solid #9cbc74;
	position: absolute;
	left:0;
	bottom:50px;
}

#goBuy {
	background: linear-gradient(#2f9327, #487F4C);
	border: 1px solid #497046;
	position: absolute;
	left:180px;
	bottom:50px;
}

#goBuy a {
	text-decoration: none;
	color: #fff;
}

#goWishlist {
	background: #fff;
	border: 1px solid #2962FF;
	color: #2962FF;
	position: absolute;
	left:360px;
	bottom:50px;
	
}

#bookMenuBar li {
	display: inline;
	/* 글자 옆에 바 */
	border-left: 1px solid #BDBDBD;
	padding-left: 30px;
	margin-right: 28px;
	color: #212121;
	font-size: 15px;
}

#bookMenuBar li:first-child {
	border: none;
}

#bookMenuBar li a {
	color: #0D47A1;
	text-decoration: none;
}

#bookMenuBar li a:hover {
	color: #0D47A1;
	text-decoration: underline;
}

#produceBook h2 {
	font-size: 25px;
	font-weight: 600;
	margin: 25px 0;
}

#produceBook h3 {
	font-size: 18px;
	font-weight: 500;
	margin: 20px 0;
	color: #424242;
}

#moreProduce, #moreTableOfContents {
	width: 980px;
	height: 20px;
	cursor: pointer;
	position: relative;
	padding: 10px 0;
	border-bottom: 1px solid #E0E0E0;
	margin-bottom: 3px;
	font-size: 16px;
	line-height: 20px;
	box-shadow: 0 -10px 5px -5px #EEEEEE;
	color: #0288D1;
}

#moreTableOfContents {
	border-bottom: 2px solid #BDBDBD;
	margin-top: 30px;
}

#moreProduce:hover, #moreTableOfContents:hover {
	text-decoration: underline;
}

#moreProduce i, #moreTableOfContents i {
	position: absolute;
	left: 90px;
	top: 10px;
	font-size: 20px;
	display: none;
}

.read_more, .show_less {
	display: none;
}

#moreProduce .fa-angle-down, #moreProduce .read_more,
	#moreTableOfContents .fa-angle-down, #moreTableOfContents .read_more {
	display: block;
}

#moreProduce.click {
	margin-top: 20px;
}

#moreProduce.click .fa-angle-down, #moreProduce.click .read_more,
	#moreTableOfContents.click .fa-angle-down, #moreTableOfContents.click .read_more
	{
	display: none;
}

#moreProduce.click .fa-angle-up, #moreProduce.click .show_less,
	#moreTableOfContents.click .fa-angle-up, #moreTableOfContents.click .show_less
	{
	display: block;
}

#tableOfContents {
	line-height: 22px;
	color: #555;
}

#tableOfContents h2 {
	font-size: 25px;
	font-weight: 600;
	margin: 30px 0;
	line-height: 20px;
}

#tableOfContents h3 {
	font-size: 18px;
	font-weight: 500;
	margin: 10px 0;
	color: #424242;
}

#replysContainer h2 {
	font-size: 25px;
	font-weight: 600;
	margin-top: 30px;
}

#writeReplyBox {
	width: 980px;
	height: 140px;
	padding: 20px 0;
	position: relative;
}
#noWrite{
width: 980px;
	height: 160px;
	position:absolute;
	left:0;
	top:10px;
	text-align:center;
	line-height:140px;
	font-size:37px;
	color:#fff;
	background:rgba(0,0,0,.5);
	z-index:3;
}

#giveGradeBox {
	position: relative;
	vertical-align: middle;
	width: 120px;
	height: 23px;
	margin-right: 10px;
}

#giveGradeBtnBox {
	width: 120px;
	height: 30px;
	position: absolute;
	left: 0;
	top: 0;
}

#giveGradeBtnBox button {
	width: 12px;
	height: 20px;
	border: none;
	padding: 0;
	margin: 0;
	float: left;
	cursor: pointer;
	background: transparent;
}

#reply {
	width: 840px;
	height: 80px;
	padding: 10px;
	resize: none;
	border: 1px solid #999;
	vertical-align: middle;
	margin-top: 10px;
	font-size: 18px;
	background: linear-gradient(#FAFAFA, #F5F5F5);
}

#reply:focus {
	border-color: #333;
	background: linear-gradient(#FAFAFA, #F5F5F5);
}

#writeBtn {
	width: 100px;
	height: 100px;
	background: linear-gradient(#0288D1, #0277BD);
	border: 1px solid #59a0c1;
	font-weight: 700;
	vertical-align: middle;
	font-size: 20px;
	color: #fff;
	cursor: pointer;
	border: none;
	margin-top: 10px;
	position: absolute;
	right: 0;
	border-radius: 2px;
}

#countReply {
	width: 980px;
	height: 25px;
	border-top: 1.5px solid #9E9E9E;
	border-bottom: 1.5px solid #9E9E9E;
	line-height: 25px;
	font-size: 15px;
	font-weight: 700;
}

#replyList {
	width: 980px;
	min-height: 100px;
}

.reply_One_Box {
	width: 980px;
	min-height: 10px;
	border-bottom: 0.5px solid #E0E0E0;
	position: relative;
	padding: 15px 0;
}

.block {
	width: 980px;
	height: 170px;
	background: #fff;
	font-size: 25px;
	line-height: 170px;
	position: absolute;
	left: 0;
	top: 0;
	text-align: center;
	z-index: 2;
	display: none;
}

.no_reply_One_Box {
	width: 980px;
	height: 100px;
	text-align: center;
	line-height: 100px;
	font-size: 30px;
	font-weight: 600;
	border-bottom: 2px solid #E0E0E0;
}

#recommendReply {
	width: 700px;
	height: 30px;
	font-size: 23px;
	font-weight: 500;
	margin: 10px 0;
}

.user_info {
	width: 220px;
	height: 150px;
	position: relative;
}

.user_info img {
	width: 50px;
	height: 50px;
	float: left;
	margin-right: 10px;
}

.nickname {
	min-width: 50px;
	height: 30px;
	font-size: 16px;
	float: left;
	color: #1976D2;
	margin-top: 10px;
}

.reportingDate {
	color: #616161;
	position: absolute;
	left: 61px;
	top: 33px;
	top: 33px;
	font-size: 13px;
}

.reply_contents {
	width: 750px;
	height: 145px;
	position: absolute;
	right: 0;
	bottom: 10px;
}

.user_grade {
	width: 120px;
	height: 23px;
	position: absolute;
	top: 0px;
	left: 0px;
}

.reply_content {
	width: 750px;
	height: 80px;
	position: absolute;
	right: 0;
	top: 35px;
	font-size: 17px;
	color: #757575;
	font-weight: 400;
	white-space: pre-wrap;
	/* 단어를 브레이크 */
	word-wrap: break-word;
}

.reply_menu {
	width: 750px;
	height: 30px;
	position: absolute;
	right: 0;
	bottom: 0;
}

.like, .flag, . {
	height: 30px;
	border: none;
	font-size: 20px;
	cursor: pointer;
	background: none;
}

.like {
	color: gray;
	position: absolute;
	left: 0;
}

.like:hover {
	color: #E3F2FD;
}

.flag {
	position: absolute;
	left: 70px;
	color: #757575;
}

.delete {
	position: absolute;
	left: 135px;
	top:-10px;
	width:0;
	height:0;
	color: #757575;
}

.flag:hover, .delete:hover {
	color: #212121;
}
/*무한 스크롤용 css (잘 모름)*/
#loading {
	width: 100%;
	height: 100%;
	position: fixed;
	left: 0;
	top: 0;
	background: url(img/ajax-loader.gif) no-repeat center;
	display: none;
	background-color: rgba(0, 0, 0, .6);
}

#topBtn {
	width: 30px;
	height: 30px;
	position: fixed;
	bottom: 80px;
	display: none;
}

#topBtn>a {
	background: url(img/img_btn_top.png);
	width: 30px;
	height: 30px;
	display: block;
	text-indent: -1000px;
	overflow: hidden;
	border-radius: 15px;
	box-shadow: 0 1px 2px #aaa;
	opacity: .8;
	transition: .1s ease;
}

#topBtn>a:hover {
	opacity: 1;
	box-shadow: 0 0px 2px #000;
}

.btn {
	border: 0;
	margin: 0;
	padding: 8px 14px;
	background: #666;
	color: #fff;
	text-decoration: none;
	font-weight: 300;
}

button.btn {
	cursor: pointer;
	font: 300 17px 'NanumBarunGothic', sans-serif;
}

.btn:hover {
	background: #333;
	box-shadow: 0 0 2px #333;
}
/* firefox가 가진 버튼의 크기를 없애줌 */
button::-moz-focus-inner {
	padding: 0;
	border: 0
}
/*북카트에 담았을 때 팝업창*/
#cover {
	width: 100%;
	height: 100%;
	background: black;
	position: fixed;
	left: 0;
	top: 0;
	z-index: 2;
	opacity: .5;
	display: none;
}

#popupAddBookcart, #popupAddWishlist {
	width: 550px;
	height: 300px;
	background-color: #fff;
	position: fixed;
	left: 50%;
	top: 10%;
	margin-left: -275px;
	border: 2px solid #fff;
	border-radius: 3px;
	z-index: 3;
	display: none;
}

.msg_delivery {
	width: 520px;
	height: 35px;
	font-size: 15px;
	padding: 5px 15px;
	line-height: 35px;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	color: #fff;
	text-shadow: 2px;
	font-weight: 700;
	background: linear-gradient(#2E7D32, #1B5E20);
}

.msg_success {
	width: 520px;
	height: 40px;
	font-size: 20px;
	padding: 5px 15px;
	line-height: 40px;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	text-shadow: 2px;
	font-weight: 700;
	background: #F5F5F5;
	border-bottom: 1px solid #E0E0E0;
}

.msg_close {
	display: block;
	width: 25px;
	height: 25px;
	color: #3069A8;
	border: 1px solid #E0E0E0;
	position: absolute;
	right: 10px;
	top: 8px;
	text-align: center;
	line-height: 24px;
	border-radius: 25px;
	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#f4f4f4+50,e0e0e0+93 */
	background: rgb(244, 244, 244);
	/* Old browsers */
	background: -moz-linear-gradient(top, rgba(244, 244, 244, 1) 50%,
		rgba(224, 224, 224, 1) 93%);
	/* FF3.6-15 */
	background: -webkit-linear-gradient(top, rgba(244, 244, 244, 1) 50%,
		rgba(224, 224, 224, 1) 93%);
	/* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(to bottom, rgba(244, 244, 244, 1) 50%,
		rgba(224, 224, 224, 1) 93%);
	/* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#f4f4f4',
		endColorstr='#e0e0e0', GradientType=0);
	/* IE6-9 */
}

#popupAddBookcart img, #popupAddWishlist img {
	width: 90px;
	height: 130px;
	border: 2px solid #fff;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	border-radius: 4px;
	margin: 15px;
}

.msg_contents_box {
	width: 400px;
	height: 200px;
	position: absolute;
	left: 130px;
	top: 50px;
}

.msg_bookcart {
	font-size: 16px;
	margin-top: 20px;
	color: #E65100;
	font-weight: 600;
}

.msg_title {
	font-size: 22px;
	margin-top: 15px;
	font-weight: 600;
}

.msg_author {
	font-size: 13px;
	margin-top: 15px;
	color: #1976D2;
}

.msg_btn_box {
	width: 520px;
	height: 40px;
	position: absolute;
	left: 15px;
	bottom: 30px;
	border-top: 1px solid #BDBDBD;
}

.msg_go_bookcart {
	display:block;
	text-decoration:none;
	text-align:center;
	line-height:40px;
	width: 170px;
	height: 40px;
	color: #2196F3;
	border: 1px solid #BDBDBD;
	border-radius: 3px;
	cursor: pointer;
	font-size: 20px;
	font-weight: 600;
	position: absolute;
	left: 175px;
	margin-top: 15px;
	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#f4f4f4+50,e0e0e0+93 */
	background: rgb(244, 244, 244);
	/* Old browsers */
	background: -moz-linear-gradient(top, rgba(244, 244, 244, 1) 50%,
		rgba(224, 224, 224, 1) 93%);
	/* FF3.6-15 */
	background: -webkit-linear-gradient(top, rgba(244, 244, 244, 1) 50%,
		rgba(224, 224, 224, 1) 93%);
	/* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(to bottom, rgba(244, 244, 244, 1) 50%,
		rgba(224, 224, 224, 1) 93%);
	/* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#f4f4f4',
		endColorstr='#e0e0e0', GradientType=0);
	/* IE6-9 */
}
/*책표지 확대 팝업*/
.msg_go_bookcart a {
	text-decoration: none;
	color: #0288D1;
}

#popupMagnify {
	width: 600px;
	height: 800px;
	border: 2px solid #fff;
	position: fixed;
	left: 50%;
	top: 50%;
	margin: -400px -300px;
	z-index: 3;
	border-radius: 3px;
	display: none;
}

#popupImg {
	width: 600px;
	height: 800px;
}
/* 최근 본 도서 */
#recentViewList {
	height: 355px;
	margin-top: 20px;
	/*background-color: burlywood;*/
}

.contents_wrap {
	position: relative;
	/*background: violet;*/
}

.contents_wrap .left, .contents_wrap .right {
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
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
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
	margin-left: 25px;
	color: #1c6b10;
	text-indent: 45px;
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
	/*background-color: antiquewhite;*/
}

.contents_list .books_info:first-child {
	margin-left: 0px;
}

.contents_list .books_info .contents_books {
	
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

.contents_list .books_info .contents_books .book_grade .txt_grade {
	width: 95px;
	height: 23px;
	/*background-color: red;*/
	background-image: url(img/stars.png);
	background-position: 0 -25px;
	background-repeat: no-repeat;
	/*margin: -1px auto;*/
}

hr {
	width: 90%;
}

.detail_contents {
	margin-bottom: 10px;
}

.reply_menu .like.show{
    color:#1c6b10;
}
#insertWishlist{
	background:yellow;
	display:inline-block;
}
#pleaseLoginBox{
width:500px;
height:50px;
backgroud:skyblue;}
#commentTop{
}
</style>
</head>
<c:import url="/header"></c:import>
<c:import url="/sidebar"></c:import>

<div id="contents" data-no="${login.no }">

	<!---------------------- 팝업존 ---------------------->

	<div id="cover"></div>
	<!--//cover-->
	<div id="popupAddBookcart">
		<div class="msg_delivery">
			이 상품은 무료배송입니다↖(^0^)↗<a href="" class="msg_close"><i
				class="fa fa-times"></i></a>
		</div>
		<!--//msgDelivery-->
		<img src="${book.bookCover }" alt="${book.title } 책표지"
			title="${book.title } 책표지" class="book_img" />
		<div class="msg_contents_box">
			<p class="msg_bookcart">장바구니에 성공적으로 담겼습니다!</p>
			<p class="msg_title">${book.title }</p>
			<p class="msg_author">${book.writer }</p>
		</div>
		<!--//msg_contents_box-->
		<div class="msg_btn_box">
				<a class ="msg_go_bookcart" href="/bookCart">장바구니로</a>
		</div>
		<!--//msg_btn_box-->
	</div>
	<!--//popupAddBookcart-->


	<div id="popupAddWishlist">
		<div class="msg_success">
			이 상품은 무료배송입니다↖(^0^)↗<a href="" class="msg_close"><i
				class="fa fa-times"></i></a>
		</div>
		<!--//msgDelivery-->
		<img src="${book.bookCover }" alt="${book.title } 책표지"
			title="${book.title } 책표지" class="book_img" />
		<div class="msg_contents_box">
			<p class="msg_bookcart">위시리스트에 성공적으로 담겼습니다!</p>
			<p class="msg_title">${book.title }</p>
			<p class="msg_author">${book.writer }</p>
		</div>
		<!--//msg_contents_box-->
		<div class="msg_btn_box">
			<button class="msg_go_bookcart" title="위시리스트로">
				<a href="/wishlist">위시리스트로</a>
			</button>
		</div>
		<!--//msg_btn_box-->
	</div>
	<!--//popupAddWishlist-->



	<div id="popupMagnify">
		<img src="${book.bookCover }" alt="${book.title } 책표지"
			title="${book.title } 책표지" id="popupImg" />
		<!--  <a href="" id="msgClose"><i
			class="fa fa-times"></i></a>-->
	</div>
	<!--//popupMagnify-->

	<!---------------------- 팝업존 end ---------------------->
	<div id="productDetail">
	<form action="/insertBookCart" method="post" id="insertBookCart">
		<img src="${book.bookCover }" alt="${book.title } 책표지"
			title="${book.title } 책표지" id="bookImg" />
			<input type="hidden" name="bookNo" value="${book.no }"/>
			<input type="hidden" name="bookCover" value="${book.bookCover }"/>
			<input type="hidden" name="title" value="${book.title }"/>
		<button id="magnify" title="크게보기">
			<i class="fa fa-search-plus"></i> 크게보기
		</button>
		<div id="productSummary">
			<div id="detailPoint">
				<div id="detailPointTitle">
					<h1>${book.title }</h1>
					<c:if test="${book.stock==0  }">
						<div id="outOfStockMsg">품절</div>
					</c:if>
				</div>
				<ul id="author">
					<li>${book.writer }</li>
					<li>${book.publisher }</li>
					<input type="hidden" name="writer" value="${book.writer }"/>
					<input type="hidden" name="publisher" value="${book.publisher }"/>
					<li><fmt:formatDate value="${book.regdate }"
							pattern="YYYY-M-d" /></li>
				</ul>
				<!--//author-->
				<div class="main_grade_box">
					<div class='grade_box'>
						<div class='grade_on' style="width:${book.rating*12}px"
							title='${book.rating}'></div>
						<!--//grade_on-->
					</div>
					<!--//grade_box-->
					<span><a href="#replysContainer">댓글 ${commentNum }개</a></span>
				</div>
				<!--//detailPoint-->
				<p class="detail_contents">${book.name}</p>
				<p class="detail_contents">ISBN : 9791170280576</p>
			</div>
			<!--//detailPoint-->
			<div id="detailPrice">
				<p>정가 : ${book.originalPrice}원</p>
				<p>
					판매가 : <span id="bookPrice">${book.salesPrice}원</span>
					<input type="hidden" name="salesPrice" value="${book.salesPrice }"/>
				</p>
				<p>
					배송비 : 한권을 사도 무조건 <span id="free">무료!</span>
				</p>
			</div>
			<!--//detailPrice-->
			<div id="amountBox">
				<label>주문수량 </label> <input type="text" value=1 maxlength=3
					id="amountCount" name="quantity" />
				<button id="plusAmount">
					<i class="fa fa-plus"></i>
				</button>
				<button id="minusAmount">
					<i class="fa fa-minus"></i>
				</button>
			</div>
			<!--//amountBox-->
			<div id="btnBox">
				<button id="goBookcart" title="장바구니에 담기" type="submit">장바구니에 담기</button>
				</form>
				
				<form action="/instantPurchase" method="post">
				<input type="hidden" name="bookNo" value="${book.no }"/>
				<input type="hidden" name="bookCover" value="${book.bookCover }"/>
				<input type="hidden" name="title" value="${book.title }"/>
				<input type="hidden" name="writer" value="${book.writer }"/>
				<input type="hidden" name="publisher" value="${book.publisher }"/>
				<input type="hidden" value=1 maxlength=3 id="amountCount" name="quantity" />
				<input type="hidden" name="salesPrice" value="${book.salesPrice }"/>
				<button id="goBuy" title="바로 구매" type="submit">바로 구매</button>
				</form>
				
				<form action="/insertWishlist" method="post" id="insertWishlist">
				<input type="hidden" name="bookNo" value="${book.no }"/>
				
				<button id="goWishlist" title="위시리스트" type="submit">위시리스트 담기</button>
				</form>
				
			</div>
			<!--//btnBox-->
			
		
			<c:if test="${book.stock==0 || login == null}">
				<div id="outOfStockBox"></div>
			</c:if>
			
			<c:if test="${book.stock==0 }">
				<div id="outOfStockBox"></div>
			</c:if>
			
	</div>
		<!--//productSummary-->
		
	</div>
	<!--//productDetail-->
	<div id="bookMenuBar">
		<ul>
			<li><a href="#produceBook">책소개</a></li>
			<li><a href="#tableOfContents">목차</a></li>
			<li><a href="#replysContainer">댓글</a></li>
		</ul>
	</div>
	<!--//menuBar-->
	<div id="produceBook" class="">
		<h2>책소개</h2>
		${book.introduction }
	</div>
	<div id="moreProduce" class="">
		<span class="read_more">내용더보기</span> <span class="show_less">다시
			접기</span> <i class="fa fa-angle-down"></i> <i class="fa fa-angle-up"></i>
	</div>
	<!--//moreProduce-->
	<!--//produceBook-->


	<div id="tableOfContents" class="">
		<h2>목차</h2>

		<h3>프롤로그</h3>

		<h3>1부 시간 앞에, 흐드러지다</h3>
		독일 <br /> 천성적 게으름에 관하여 <br /> 마음의 자리 <br /> 흐드러지다 <br /> 움직이는 것 <br />


		<h3>2부 당신과 흐드러지다</h3>
		터키 <br /> 이스탄불 <br /> 기억하는 순간 <br /> 술탄아흐메트, 골목들 <br /> 아련하고 잔잔한 <br />
		여름을 거슬러 봄으로 <br /> 가지 못한 길 <br /> 준비 <br />

		<h3>에필로그 - 아령의 반대편에서</h3>


	</div>
	<!--//tableOfContents-->
	<div id="moreTableOfContents" class="">

		<span class="read_more">더보기</span> <span class="show_less">다시
			접기</span> <i class="fa fa-angle-down"></i> <i class="fa fa-angle-up"></i>
	</div>
	<!--//moreTableOfContents-->
	<div id="replysContainer">
		<h2>댓글</h2>
		
		<div id="writeReplyBox">
		<c:if test="${login.no==null } ">
		<div id="noWrite">로그인 해주세요</div>
		</c:if>
			<form action="/writeComment/${book.no }" method="POST">
				<fieldset>
					<legend class="screen_out">평점후기폼</legend>
					<div id="giveGradeBox">
						<div class="grade_box">
							<div class="grade_on" style="width: 0"></div>
							<!--//grade_on-->
							<div id="giveGradeBtnBox">
								<button type="button" title="1" style="width: 12px"></button>
								<!-- 
									 -->
								<button type="button" title="2"></button>
								<!--
									 -->
								<button type="button" title="3"></button>
								<!--
									 -->
								<button type="button" title="4"></button>
								<!--
									 -->
								<button type="button" title="5"></button>
								<!--
									 -->
								<button type="button" title="6"></button>
								<!--
									 -->
								<button type="button" title="7"></button>
								<!--
									 -->
								<button type="button" title="8"></button>
								<!--
									 -->
								<button type="button" title="9"></button>
								<!--
									 -->
								<button type="button" title="10"></button>
							</div>
						</div>
						<!--//grade_box-->
					</div>

					<input type="hidden" id="grade" name="rating" value="0" /> <input
						type="hidden" name="bookNo" value="${book.no }" />
					<textarea cols="50" rows="5" placeholder="300자 내외로 후기를 써주세요."
						name="contents" id="reply"></textarea>
					<button id="writeBtn" class="btn" title="댓글입력버튼" type="submit">쓰
						기</button>
				</fieldset>
			</form>
		</div>
		<!--// writeReplyBox -->
		<div id="countReply">총 댓글 ${commentNum }개</div>
		<!--// countReply -->
		<div id="replyList">
			<c:if test="${commentTop.no == null }">
				<div class="no_reply_One_Box">이 책의 첫 우수댓글이 되어주세요♡</div>
			</c:if>

			<ul>
				<c:if test="${commentTop.no != null }">
				<li>
					<div class="reply_One_Box" id="commentTop">
						<div id="recommendReply">가장 추천이 많은 댓글</div>
						<!--// recommendReply -->
						<div class="user_info">
							<img src="/img/profile.png" />
							<div class="nickname">${commentTop.nickname }</div>
							<div class="reportingDate">
								<fmt:formatDate value="${commentTop.regdate }"
									pattern="YYYY-M-d" />
							</div>
						</div>
						<!--// user_info -->
						<div class="reply_contents" id="reply_contents">
							<div class="user_grade">
								<div class="grade_box_wrap">
									<div class='grade_box'>
										<div class='grade_on'
											style="width: ${commentTop.rating * 12 }px"
											title='${commentTop.rating }'></div>
										<!--//grade_on-->
									</div>
									<!--//grade_box-->
								</div>
								<!--//gradeBox-->
							</div>
							<!--// user_grade -->
							<div class="reply_content">${commentTop.contents}</div>
							<!--// reply_content -->

						</div>
						<!--// reply_contents -->
					</div>
					<!--// reply_One_Box -->
					</li>
				</c:if>
				
			</ul>

		</div>
		<!--// replyList -->
	</div>
	<!--//replysContainer-->

	
</div>
<!--//contents-->
<c:import url="template/footer.jsp"></c:import>

<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/template.js"></script>
<script type="text/template" id="commentTmp">
<@_.each(comments,function(comment){@>
<li>
                        <div class="reply_One_Box">
                            <div class="user_info">
                                <img src="/img/profile.png" />
                                <div class="nickname"><@=comment.nickname@></div>
                                <div class="reportingDate"><@=comment.realDate@></div>
                            </div>
                            <!--// user_info -->
                            <div class="reply_contents">
                                <div class="user_grade">
                                    <div class="grade_box_wrap">
                                        <div class='grade_box'>
                                            <div class='grade_on' style="width:<@=comment.rating *12 @>px" title='<@=comment.rating@>'></div>
                                            <!--//grade_on-->
                                        </div>
                                        <!--//grade_box-->
                                    </div>
                                    <!--//gradeBox-->
                                </div>
                                <!--// user_grade -->
                                <div class="reply_content"><@=comment.contents @></div>
                                <!--// reply_content -->

                                <div class="reply_menu">

                                    <div class="like <@if(comment.likes!=0){@>show<@}@>" data-no="<@=comment.no@>" data-userNo="<@=comment.userNo@>" title="추천"><i class="fa fa-thumbs-up"></i> <span><@=comment.likeCount@></span></div>
                                    <!--//like-->

									<form action="/registerReport" method="POST">	
                                    <div class="flag " data-no="<@=comment.no@>" title="신고하기"><i class="fa fa-flag"></i></div>
                                    <!--//flag-->
									</form>
	<@if(${login.no}==comment.userNo){	@>						
<form action="/deleteComment" method="POST">
<input type="hidden" name="_method" value="DELETE">
                                    <div class="delete" data-no="<@=comment.no@>" title="삭제"><i class="fa fa-trash"></i></div>
                                    <!--//delete-->
</form>
<@}@>

                                </div>
                                <!--// reply_menu -->

                            </div>
                            <!--// reply_contents -->

                        </div>
                        <!--// reply_One_Box -->
                    </li>
        
<@});@>
    </script>
<script>
	_.templateSettings = {
		interpolate : /\<\@\=(.+?)\@\>/gim,
		evaluate : /\<\@(.+?)\@\>/gim,
		escape : /\<\@\-(.+?)\@\>/gim
	};

	
	//displayLike();
	
	/* 마우스 버튼막는 박스 안에 들어오면 모양 바뀜 */
	$("#outOfStockBox").mouseenter(function() {
		//alert("test");
		$(this).css("cursor", "no-drop");
	});

	var $amountCount = $("#amountCount"), $moreTable = $("#moreTableOfContents"), $table = $("#tableOfContents"), $moreProduce = $("#moreProduce"), $produceBook = $("#produceBook");

	///////주문 수량 변경///////
	$("#plusAmount").click(function(e) {
		//alert("plus"); 
		e.preventDefault();

		var num = $amountCount.val();
		num = $amountCount.val(num * 1 + 1);

	}); //#plusAmount click() end

	$("#minusAmount").click(function(e) {
		//alert("minus");
		
		e.preventDefault();

		var num = $amountCount.val();
		//주문수량이 '1'이하면 숫자가 줄어들지 않음
		if (num > 1) {
			num = $amountCount.val(num * 1 - 1);
		}
	}); //#minusAmount click() end
	

	//////////더보기 div 클릭시//////////
	$moreProduce.click(function() {
		//alert("내용더보기클릭");
		//alert($produceBook);
		$moreProduce.toggleClass('click');
		$produceBook.toggleClass('showProduce');
	}); //$moreProduce click() end

	$moreTable.click(function() {
		//alert('more');

		//클래스
		$moreTable.toggleClass('click');
		$table.toggleClass('show');
	}); //$moreTable click() end
	

	////////////별점 처리 부분//////////////////
	var $btns = $("#giveGradeBtnBox button");

	var $grade = $("#grade");

	var $gradeOn = $("#giveGradeBox .grade_on");

	var $btnBox = $("#giveGradeBtnBox");

	var nowGrade = 0;

	//평점을 주는 박스에서 마우스가 밖으로 나올 때
	$btnBox.mouseleave(function() {
		//인풋요소의 밸류값을 5로 하고
		$grade.val(nowGrade);
		//'보여지는' 이미지 요소의 길이를 바꿔줌
		$gradeOn.width(nowGrade * 12);
	});

	//10개의 버튼 중 하나를 눌렀을 때 
	$btns.click(function() {
		var grade = $(this).attr("title");
		nowGrade = grade;
		$grade.val(grade);
		$gradeOn.width(grade * 12);
		//마우스가 진입했을 때에는 giveGrade메서드를 발동시킴
	}).mouseenter(giveGrade);

	function giveGrade() {
		//grade라는 변수를 선언하여 마우스가 진입한 바로 그 요소(버튼)의 타이틀값을 대입 
		var grade = $(this).attr("title");
		//인풋요소의 밸류값에 grade를 대입
		$grade.val(grade);
		//나타나는 평점 요소의 가로값을 정해주는 변수 width 선언 
		var width = grade * 12;
		$gradeOn.width(width);
	}

	////////////신고버튼 눌렀을 시///////////
	$("#replyList ul").on("click",".flag",function(e) {
		//alert("신고버튼");
		e.preventDefault();
	
		
		
		var flag = confirm("정당한 사유가 아닌 신고는 법적인 책임을 질 수도 있습니다. 정말로 신고하시겠습니까? ");
		
		if (flag == true) {
			
			var $this = $(this);
			var commentNo = $this.attr("data-no");
			
			//alert("코멘트번호홓:"+commentNo);
			
			$.ajax("/registerReport", {
				type : "post",
				dataType : "json",
				data : {commentNo:commentNo},
				error : function(xhr, error, code) {
					alert("1"+code);
				},
				success : function(json) {
					//alert(json.result);
					if (json.result) {
						alert("신고되었습니다.");
					} else {
						alert("오류로인해 실행되지 않았습니다");
					}

				}//success end
			});//ajax end
			
			
		} else {
			alert("신고되지 않았습니다.");
		}//if~else end
		

	}); //.flag click() end
	
	var bookNo = ${book.no};

	

	/////////댓글 무한스크롤/////////
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
			displayCommentList();

			/*
			var tmp = _.template($("#replyTmp").html());

			$("#replyList ul").append(tmp({
				idx : ++index
			}));*/

		}

	});
	var bookNo = ${book.no};
	var pageNo = 1;
	var userNo = ${login.no};

	displayCommentList();

	function displayCommentList() {

		$.ajax("/commentList/" + bookNo + "/page/" + pageNo + "/userNo/"+ userNo, {
			type : "post",
			dataType : "json",
			error : function(xhr, error, code) {
				alert("2"+error);
			},
			success : function(json) {
				//alert(json);
				var markup = $("#commentTmp").html();
				//alert(markup);
				var tmp = _.template(markup);
				//alert(tmp);
				var code = tmp({
					comments : json
				});
				//alert(code);

				$("#replyList ul").append(code);
				//$("#menuPaging").html(json.paginate);

			}//success end
		});//ajax end

	}//displayCommentList() end
	
	

	////////////댓글 삭제 눌렀을 때///////
	
	$("#replyList ul").on("click",".delete",function(e) {
		//alert("삭제");
		e.preventDefault();
		
		
		var $this = $(this);
		var commentNo = $this.attr("data-no");
		var userNo = $this.attr("data-userNo");
		
		alert("댓글번호 : "+commentNo)
		//alert(commentNo);
		var flag = confirm("정말로 삭제하시겠습니까?");
		
		

		if (flag == true) {
			
			var data = JSON.stringify({"no":commentNo,"userNo":userNo});
			
			//alert(data);
			
			$.ajax("/deleteComment/", {
				type : "DELETE",
				dataType : "json",
				contentType : 'application/json;charset=UTF-8',
       			data:data,
				error : function(xhr, error, code) {
					alert("3"+error);
				},
				success : function(json) {
					//alert(json.result);
					if (json.result) {
						alert("삭제가 성공적으로 되었습니다.");
						$this.parents("li").remove();
					} else {
						alert("오류로인해 실행되지 않았습니다");
					}

				}//success end
			});//ajax end
			
			
		} else {
			alert("삭제 되지 않았습니다");
		}
	}); //.delete click() end
	

	////////////장바구니 눌렀을 때 뜨는 팝업창/////////////
	var $popupAddBookcart = $("#popupAddBookcart"), $cover = $("#cover"), $html = $("html"), $msgClose = $("#msgClose");

	
	$("#goBookcart").click(function(e) {
		//alert("장바구니 버튼 클릭");
		e.preventDefault();
		
		
			
		
		var params = $("#insertBookCart").serialize();
		//alert(params);
		$.ajax("/insertBookCart", {
			type : "post",
			dataType : "json",
			data : params,
			error : function(xhr, error, code) {
				alert("$"+error);
			},
			success : function(json) {
				//alert(json.result);
				if (json.result) {
					$cover.show();
					$popupAddBookcart.show();
					$html.css("overflow-y", "hidden"); 
				} else {
					alert("오류로인해 실행되지 않았습니다");
				}

			}//success end
		});//ajax end
		
		
		
	}); //#goBookcart click() end

	$msgClose.click(function() {
		//alert("닫기클릭");
		$this = $(this);
		$this.parents("#popupAddBookcart").hide();
		$cover.hide();
		$html.css("overflow", "scroll");
	}); //#msgClose click() end

	$cover.click(function() {
		//alert("커버클릭");
		$popupAddBookcart.hide();
		$cover.hide();
		$html.css("overflow", "scroll");
	}); //$cover click() end

	//////////위시리스트 눌렀을 때 뜨는 팝업창/////////////
	var $popupAddWishlist = $("#popupAddWishlist");

	$("#goWishlist").click(function(e) {
		//alert("위시리스트 버튼 클릭");
		e.preventDefault();
		
		
		var params = $("#insertWishlist").serialize();
		//alert(params);
		
		$.ajax("/insertWishlist", {
			type : "post",
			dataType : "json",
			data : params,
			error : function(xhr, error, code) {
				alert("5"+error);
			},
			success : function(json) {
				//alert(json.result);
				if (json.result) {
					$cover.show();
					$popupAddWishlist.show();
					$html.css("overflow-y", "hidden");
				} else {
					alert("오류로인해 실행되지 않았습니다");
				}

			}//success end
		});//ajax end
		
		
	}); //#goBookcart click() end

	$msgClose.click(function() {
		//alert("닫기클릭");
		$this = $(this);
		$this.parents("#popupAddWishlist").hide();
		$cover.hide();
		$html.css("overflow", "scroll");
	}); //#msgClose click() end

	$cover.click(function() {
		//alert("커버클릭");
		$popupAddWishlist.hide();
		$cover.hide();
		$html.css("overflow", "scroll");
	}); //$cover click() end

	/////////책표지 확대팝업/////////
	var $magnify = $("#magnify"), $popupMagnify = $("#popupMagnify");

	$magnify.click(function(e) {
		//alert("확대 버튼 클릭");
		e.preventDefault();
		$cover.show();
		$popupMagnify.show();
		$html.css("overflow-y", "hidden");
	});

	$msgClose.click(function() {
		//alert("닫기클릭");
		$this = $(this);
		$this.parents("#popupMagnify").hide();
		$cover.hide();
		$html.css("overflow", "scroll");
	});

	$cover.click(function() {
		//alert("커버클릭");
		$popupMagnify.hide();
		$cover.hide();
		$html.css("overflow", "scroll");
	});

	////////////댓글 좋아요/////////////
	
	
	$("#replyList ul").on("click",".like",function() {
		
		var commentNo = $(this).attr("data-no");
		var $this = $(this);
		checkFavorite(commentNo,$this);
		location.reload();
		
	});

	function checkFavorite(commentNo,$this) {
		$.ajax("/likeComment/"+commentNo, {
			type : "post",
			dataType : "json",
			error : function(xhr, error, code) {
				alert("6"+error);
			},
			success : function(json) {
				//alert(json.result);
				if (json.result) {
					$this.toggleClass("show");
				} else {
					alert("오류로인해 실행되지 않았습니다");
				}

			}//success end
		});//ajax end
	}//checkFavorite() end
	
	
	/////세션
	
	 var data = sessionStorage.getItem('recents');
     
    // alert(data);
     
     if(data) {
     
      data = JSON.parse(data);
     
      data.push({"no":${book.no},
      "title":"${book.title}",
      "bookCover":"${book.bookCover}",
      "writer":"${book.writer}",
      "publisher":"${book.publisher}",
      "publicationDate":"${book.publicationDate}",
      "originalPrice":${book.originalPrice},
      "salesPrice":${book.salesPrice},
      "salesVolume":${book.salesVolume},
      "type1":"${book.type1}",
      "type2":"${book.type2}",
      "rating":${book.rating},
      "regdate":"${book.regdate}",
      "categoryNo":${book.categoryNo}});
     
      data= _.uniq(data,function(item) {
      return item.no;
      });
     //alert(data);
     } else {
      //alert("false");
      data = [{"no":${book.no},
      "title":"${book.title}",
      "bookCover":"${book.bookCover}",
      "writer":"${book.writer}",
      "publisher":"${book.publisher}",
      "publicationDate":"${book.publicationDate}",
      "originalPrice":${book.originalPrice},
      "salesPrice":${book.salesPrice},
      "salesVolume":${book.salesVolume},
      "type1":"${book.type1}",
      "type2":"${book.type2}",
      "rating":${book.rating},
      "regdate":"${book.regdate}",
      "categoryNo":${book.categoryNo}}];
     
      
     }
   
     sessionStorage.setItem('recents',JSON.stringify(data));
 
     
</script>

</body>

</html>