<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title>본사 연락처</title>
        <c:import url="template/link.jsp"></c:import>
    <style>
        #contents {
            width: 980px;
            height: 800px;
            margin: auto;
        }
        #companyTitle{
            width: 980px;
            height: 85px;
        }
        #companyInfo{
            width: 480px;
            height: 540px;
            margin-left: 30px;
            float: left;
        }
        #insideImg1,#insideImg2{
            width: 380px;
            height: 250px;
            border: 3px solid #827717; 
            border-radius: 2px;
            margin-left: 45px;
        }
        #insideImg2{
            margin-top: 10px;
        }
    </style>

</head>

<c:import url="/header"></c:import>
    <div id="contents">
        <img id="companyTitle" src="img/%ED%9A%8C%EC%82%AC%EC%86%8C%EA%B0%9C.PNG"/>
        <img id="companyInfo" src="img/%ED%9A%8C%EC%82%AC%EC%86%8C%EA%B0%9C2.PNG" />
        <img id="insideImg1" src="img/%EC%84%9C%EC%A0%90%EC%82%AC%EC%A7%841.jpg" />
        <img id="insideImg2" src="img/%EC%84%9C%EC%A0%90%EC%82%AC%EC%A7%842.jpg" />

    </div>
    <!--//contents-->
<c:import url="template/footer.jsp"></c:import>

    <script src="js/jquery.js"></script>
    <script src="js/template.js"></script>
    <script>


</script>
</body>

</html>