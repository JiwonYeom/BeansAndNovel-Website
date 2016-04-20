<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title>고객센터</title>
<c:import url="template/link.jsp"></c:import>
    <style>
        #contents {
            width: 980px;
            height: 870px;
            margin: auto;
            padding: 20px 0;
            position: relative;
        }
        
        #search {
            width: 640px;
            height: 250px;
        }
        #question{
            width: 640px;
            height: 500px;
        }
        #contactUs {
           width : 220px;
           height: 208px;
           margin-top: 35px;
           position: absolute;
           top:0;
           right: 0;
           border-radius: 7px;
           border: 1px solid #BDBDBD;
           background-color: #FAFAFA;
       }
       
       #contactUs h2{
           font-size: 20px;
           margin : 15px auto 20px 15px;
       }
        
        #contactUs .how_to_contact {
            margin: 10px auto 10px 30px;
            position: relative;
            /*background-color: red;*/
        }
        
        .how_to_contact .circle {
            width: 43px; 
            height: 43px;
            border-radius: 23px;
            border: 2px solid #E0E0E0;
            background: #FFF;
            text-align: center;
        
        }
        
        .how_to_contact .circle a {
            color:#424242;            
        }
        
        .how_to_contact .underline:hover {
            text-decoration: underline;
        }
        
        .how_to_contact .envelope {
            font-size: 20px;
            line-height: 45px;   
        }
        
        .how_to_contact .phone {
            font-size: 25px;
            line-height: 50px;  
        }
         
        .how_to_contact span {
            position: absolute;
            /*background: red;*/
            font-size: 18px;
            margin-left: 30px;   
        }
        
        .how_to_contact p {
            font-size: 12px;
            margin-left: 63px;
            line-height: 19px;
        }
    </style>
</head>
    
   <c:import url="/header"></c:import>
    <div id="contents">
        <img id="search" src="img/%ED%97%AC%ED%94%84%EA%B2%80%EC%83%89%EC%B0%BD%EC%88%98%EC%A0%95.png" alt="고객센터검색창" />
        <img id="question"src="img/%ED%97%AC%ED%94%84%EC%A7%88%EB%AC%B8.PNG" alt="고객센터질문"/>
        <div id="contactUs">
            <h2>고객센터</h2>
            <div class="how_to_contact"> 
                <div class="circle envelope">
                    <a href=""><i class="fa fa-envelope"></i></a>
                    <a href="" class="underline"><span>이메일</span></a>
                </div>
            </div>
            <div class="how_to_contact">    
                <div class="circle phone">
                    <a href=""><i class="fa fa-phone"></i></a>
                    <a href="" class="underline"><span>전화</span></a>
                </div> 
                <p> 찾고계신것이 없으면,</p> <p>전화주세요.</p>
            </div> 
        </div> <!-- // contactUs -->
    </div>
<c:import url="template/footer.jsp"></c:import>

</body>
<script src="js/jquery.js"></script>
<script src="js/template.js"></script>
    <script>
        
    </script>
</html>