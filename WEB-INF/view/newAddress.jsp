<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title>배송지 ${function }</title>
   <c:import url="template/link.jsp"></c:import>
    <style>
        #contents {
            margin: auto;
            padding: 30px 0;
            width: 980px;
        }
        
        #contents h1 {
            color: #1c6b10;
            font-size: 25px;
            font-weight: 600;
            padding: 25px 0;
        }
        
        #contents label {
            display: block;
            font-size: 16px;
            font-weight: bold;
        }
        
        #addressName,
        #name,
        #address01,
        #address02,
        #phone,#postcode {
            margin-top: 3px;
            margin-bottom: 15px;
            border-radius: 5px;
            height: 30px;
            background: linear-gradient(#f0f0f0, white);
            border: 1px solid #999;
            font-size: 16px;
        }
        
        #address01 {
            width: 350px;
        }
        
        #address02 {
            width: 350px;
        }
        
        #phone {
            width: 200px;
        }
        
       #contents  #defaultLabel {
            display: inline;
            color: darkblue;
            font-weight: 300;
        }
        
        #contents button,
        #contents a {
            display: inline-block;
            text-decoration: none;
            text-align: center;
            line-height: 36px;
            margin-left: 10px;
            width: 100px;
            height: 40px;
            border: 1px solid #666;
            border-radius: 5px;
            cursor: pointer;
        }
        
        #contents .btn {
            width: 100%;
            text-align: right;
            /*background-color: red;*/
        }
        
        #contents .btn button {
            background: linear-gradient(#1c6b10, #08511c);
            color: white;
        }
        
        #contents .btn button:active {
            background: #08511c;
        }
        /*
        #contents .btn .cancel_join {
            width: 100px;
            height: 40px;
        }
        */
        #contents .btn a {
            background: linear-gradient(#e6e6e6, #FFF);
            color: black;
            width: 98px; 
            height: 38px;
            font-size: 11px;
            position:absolute;
            right: 330px;
            line-height: 40px;
        }
        #contents .btn .cancel_join{
        	right:400px;
        }
        #contents .btn a:active {
            background: #e6e6e6;
        }

        
        #contents .postcode {
            display: inline;
            text-decoration: none;
            text-align: center;
            line-height: 30px;
            
            width: 100px;
            height: 33px;
            border: 1px solid #666;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>

<c:import url="/header"></c:import>
    <div id="contents">
        <h1>배송지 ${function }</h1>
        <c:choose>
        <c:when test="${function=='추가' }">
        <form action="/newAddress" method="post">
        </c:when>
        <c:when test="${function=='수정'}">
        <form action="/updateAddress" method="post">
        <input type="hidden" name="_method" value="PUT"/>
        <input type="hidden" name="no" value="${original.no }"/>
        </c:when>
        </c:choose>
            <fieldset>	
                
                <label for="addressName">배송지명</label>
                <input id="addressName" type="text" name="name" placeholder="ex)집, 회사..." value="${original.name }"/>
                
                <label for="name">성명</label>
                <input type="text" id="name" name="recipient" value="${original.recipient }"/>
               
                <div class="popup">
                    <div id="addressWrap">
                    </div>
                </div>
                <div class="row input-field">
                     <label for="postcode">배송지 주소</label>
                    <div>
                        <input type="text" id="postcode" name="zipcode" value="${original.zipcode }" />
                        <button type="button" onclick="sample3_execDaumPostcode()" class="btn postcode">우편번호 찾기</button>
                    </div>
                    <div>
                        <label for="address01">주소</label>
                        <input type="text" id="address01" name="address" value="${original.address }">
                    </div>
                    <div>
                        <label for="address02">상세주소</label>
                        <input type="text" id="address02" name="detailedAddress" value="${original.detailedAddress }">
                    </div>
                </div>
                <p>
                    <label for="phone">연락처(-없이 입력해주세요)</label>
                    <input type="text" id="phone" name="phone" value="${original.phone }"/>
                </p>
                <input type="checkbox" id="default" name="shippingAddress" value="d"/>
                <label for="default" id="defaultLabel">기본 배송지로 설정</label>

                <p class="btn">
                    <a class="cancel_join" href="/mypage">취소</a><button type="submit">저장</button>
                </p>
            </fieldset>
        </form>
    </div>
<!--contents-->
   <c:import url="template/footer.jsp"></c:import>
    <script src="js/jquery.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="js/template.js"></script>
    <script>
        var element_wrap = document.getElementById('addressWrap');

        function sample3_execDaumPostcode() {
            

            // 현재 scroll 위치를 저장해놓는다.

            var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
            new daum.Postcode({
                oncomplete: function (data) {
                    // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = data.address; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 기본 주소가 도로명 타입일때 조합한다.
                    if (data.addressType === 'R') {
                        //법정동명이 있을 경우 추가한다.
                        if (data.bname !== '') {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if (data.buildingName !== '') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('address01').value = fullAddr;
                    $(".popup").fadeOut(500);
                    $("#address02").focus();

                    // iframe을 넣은 element를 안보이게 한다.
                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                    element_wrap.style.display = 'none';

                    // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                    document.body.scrollTop = currentScroll;
                },
                // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            }).open();

            // iframe을 넣은 element를 보이게 한다.
            
        }



        function foldDaumPostcode() {
            $(".popup").fadeOut(500);
            // iframe을 넣은 element를 안보이게 한다.
            element_wrap.style.display = 'none';
        }
        
        
    </script>
</body>

</html>