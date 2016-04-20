<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>email</title>
 <c:import url="template/link.jsp"></c:import>
 
    <style>
        body {
            font-family: "Kakao", sans-serif;
        }
        
        #contents {
            width: 980px;
            height: 540px;
            margin: auto;
            /*background-color: antiquewhite;*/
            position: relative;
            
        }
        
        #qnaForm {
            width: 400px;
            height: 500px; 
            /*background-color: azure;*/
            margin-top:20px;
            position: absolute;
            top:0;
            left:50px;
        }
        
        #qnaForm #chooseBox {
            /*
            width: 250px;
            height: auto;
            background: green;
            position:absolute; 
            */
            /*
            position: absolute;
            top:22px;
            left:0;
            */
        }
        
        #qnaForm #chooseClick {
            width: 250px;
            height: 30px;
            line-height: 30px;
            cursor: pointer;
            background: rgba(255, 0, 0, 0.4);
            vertical-align: middle;
        }
        
        #qnaForm .title {
            display: block;
            margin: 15px 0 5px 0;
        }
        
        select {
       -webkit-appearance: menulist-button !important;
       line-height:24px !important;
   }
        
        #qnaForm .category_box {
            display: block;
            width: 355px;
            height: 30px;
        }
        
        #qnaForm .question_box {
            margin-top:30px;
        }
        
        #qnaForm textarea {
            width: 350px;
            height: 200px;
        }
        
        #qnaForm .ordernum_write {
            display: block;
            width: 350px;
            height: 25px;
        }
        
        #qnaForm #submitForm {
            display: block;
            width: 80px;
            margin: 15px 0;
            height: 40px;
            background: linear-gradient(#1c6b10,#08511c);
            border-radius: 5px;
            border:1px solid #e0e0e0;
            color: white;
        } 
        #qnaForm #submitForm:active {
        background:#08511c;
        }
        #contactUs {
            width : 220px;
            height: 208px;
            margin-top: 20px;
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
        <div id="qnaForm">
            <form>
                <fieldset>
                    <legend class="screen_out">이메일 폼</legend>
                    <div id="chooseBox">
                        <!--<div id="chooseClick">선택하세요</div>-->
                    </div>
                    <label for="category" class="title">분류 *</label>
                    <select id="category" class="category_box">
                        <option>결제</option>
                        <option>교환</option>
                        <option>반품</option>
                    </select>
                    <label for="question" class="question_box title">문의사항 *</label>
                    <textarea id="question"></textarea>
                    <label for="ordernum" class="order_num title">주문 번호</label>
                    <input type="text" id="ordernum" class="ordernum_write" />
                </fieldset>
                <p>
                    <input type="submit" id="submitForm" value="전송하기" />
                </p>
            </form> 
        </div> <!-- // qnaForm -->   
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
    </div> <!-- contents -->
    <c:import url="template/footer.jsp"></c:import>
    <script src="js/jquery.js"></script>
    <script src="js/template.js"></script>
    <script>
      

</script>
</body>
</html>