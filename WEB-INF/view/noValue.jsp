<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
 body{
 height:400px;}
 .error{
 text-align: center;
 font-size: 25px;
 padding-top:100px
 }
 h2{
text-align: center;
font-size: 18px;
height:200px;
 padding-top:100px;
 }
 h2 a{

 color:gray;
 }
 </style>
<meta charset=UTF-8">
<title>오류페이지</title>
 <c:import url="template/link.jsp"></c:import>
 
</head>
<body>
<c:import url="/header"></c:import>
<h1 class="error">nullPointException 발생</h1>
<h2><a href="/index">인덱스로 돌아가기</a></h2>
<c:import url="template/footer.jsp"></c:import>
</body>
</html>