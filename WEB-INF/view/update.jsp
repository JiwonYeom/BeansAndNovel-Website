<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>개인정보 수정</title>
  <c:import url="template/link.jsp"></c:import>
    <style>
        body{
            font-family: 'Kakao', sans-serif;
        }
        
        /* 계정 수정 공통 css {{ */
        #updatePageWrap{
            width: 978px;
            /*background-color: red;*/
            margin: auto;
            padding-top: 10px
        }
        #updatePageWrap h1{
            width: 980px;
            font-size: 26px;
            /*background: blue;*/
            margin: 20px auto;
            font-weight: 600;
        }
        #updatePageWrap .account_update_box{
           /* background-color: red;*/
            width: 980px;
            margin: 10px auto;
            border: 1px solid #999;
            min-height: 200px;
            padding-bottom: 30px;
        }
        #updatePageWrap .account_update_box .update_input{
            border-radius: 5px;
            width: 250px;
            height: 35px;
            font-size: 18px;
            background:linear-gradient(#eee,#fff); 
            margin: 5px auto;
            border: 1px solid #666;
/*            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);*/
        }
        #updatePageWrap .account_update_box .update_input:focus{
            background-color: white;
        }   
        
        #updatePageWrap .account_update_box label{
            font-weight: 300;
            font-size: 20px;
            /*background-color: darkolivegreen;*/
            display: inline-block;
            margin-bottom: 5px;
            margin-left:5px;
        }     
        #updatePageWrap .current_info_box{
            /*background-color: dodgerblue;*/
            margin-bottom: 10px;
            margin-left: 15px;
        }
        /*
        .update_btn_box {
            background-color: red;
        }
        */
        #updatePageWrap .update_btn_box button{
            width: 100px;
            height: 35px;
            font-weight: 400;
            font-size: 16px;
            cursor: pointer;  
            border: none;
            letter-spacing: 5px;
            margin-left: 13px;
            border-radius: 5px;
        }

        #updatePageWrap .update_btn_box .account_update_btn{
            background: linear-gradient(#1c6b10,#08511c);
            border: 1px solid #eee;
            color: white;
        }
        #updatePageWrap .update_btn_box .account_update_btn:active{
         background:   #08511c
        }
        #updatePageWrap .update_btn_box .account_update_write_cancel_btn{
            background-color: white;
            border: 1px solid #424242;
        }
        #updatePageWrap .account_update_box h2{
            width: 300px;
            height: 45px;
            padding-top: 15px;
            margin-left: 10px;
/*            margin-bottom: 10px;*/
            font-weight: 700;
            font-size:25px;
            margin-top: 12px;
            text-indent: 10px;
            /*background-color: yellow;*/
        }

        /*}} 계정 수정 공통css end */
       
        /* 닉네임 변경  css {{*/
    
        .check_account{
           
            height: 40px;
            vertical-align: middle;
            font-size: 15px;
            cursor: pointer;
            background: linear-gradient(#4388db,#0883d6);
            border:1px solid #eee;
            color:white;
            line-height: 25px;
            border-radius: 5px;
            padding: 5px 10px; 
        }
        .check_account:active{
        background-color: #0883d6;
            
        }
        /*}} 닉네임 변경 css */
        
        /* 아이디 변경  css {{*/
     
        #updatePageWrap #newIdBox label{
            margin-right: 70px;
        }
        #updatePageWrap #currentIdBox em,
        #updatePageWrap #currentNicknameBox em
        {
            font-size: 20px;
            color:#666;
            
        }
        
        /*}} 아이디 변경 css */
        
        /*비밀번호 변경 css {{*/

        #updatePageWrap #newPwdBox label{
            margin-right: 145px;
        }
        /*}} 비밀번호 변경  css end */
        
    </style>
</head>
<c:import url="/header"></c:import>
    <div id="contents">
    <div id="updatePageWrap">
        <h1>내 정보 수정</h1>
        <div id="changeNickname" class="account_update_box">
            <h2>닉네임 변경</h2>
            <!-- 넘길 데이터가 있으면 no 이런거 대신 /으로 써서 넘기고, 컨트롤러에선 {}으로 받는다-->
            <form action="/updateNickname/${login.no}" method="post">
            	<input type="hidden" name="_method" value="put" />
                <div id="currentNicknameBox" class="current_info_box">
                    <label>현재 닉네임 : </label> 
                    <em>${login.nickname}</em>
                </div><!--//currentEmailBox-->
                <div id="newEmailBox" 
                     class="current_info_box">
                    <label for="newNickname">새로운 닉네임</label><br/>
                    <input type="text" 
                           id="newNickname" 
                           name="nickname" 
                           class="update_input"
                           placeholder=" 1자~6자리의 영문,숫자,한글 입력"
                           maxlength="6">
                    <button class="check_account">중복확인</button>
                </div><!--//newEmailBox-->
                <div class="update_btn_box">
                    <button class="account_update_btn" id="nicknameBtn">수정</button>
                    <button class="account_update_write_cancel_btn">취소</button>
                </div><!--//update_btn_box -->
            </form>    
        </div><!--//changeNickname-->
        <div id="changeId" class="account_update_box">
            <h2>아이디 변경</h2>
            <form action="/updateId/${login.no}" method="post">
            <input type="hidden" name="_method" value="put" />
                <div id="currentIdBox" class="current_info_box">
                    <label>현재 아이디 : </label> 
                    <em>${login.id}</em>
                </div><!--//currentEmailBox-->
                <div id="newIdBox" 
                     class="current_info_box">
                    <label for="newId">신규 아이디</label><br />
                    <input type="text" 
                           id="newId" 
                           name="id" 
                           class="update_input"
                           placeholder= "4자~10자리의 영문,숫자 입력"
                           maxlength="10">  
                    <button class="check_account">중복확인</button>
                </div><!--//newEmailBox-->
                <div class="current_info_box">
                    <label for="password">비밀번호 입력</label><br/>
                    <input type="password" 
                           id="password"
                           name="password"
                           class="update_input"
                           maxlength="10">
                </div><!--//current_info_box-->  
                <div class="update_btn_box">
                    <button class="account_update_btn" id="idBtn">수정</button>
                    <button class="account_update_write_cancel_btn" type="reset">취소</button>
                </div><!--//update_btn_box -->
            </form>    
        </div><!--//changeEmail-->
        <div id="changePassword" class="account_update_box">
            <h2>비밀번호 변경</h2>
            <form action="/updatePassword/${login.no}" method="post">
            <input type="hidden" name="_method" value="put" />
                <div id="currentPwdBox" class="current_info_box">
                    <label for="currentPwd">현재 비밀번호</label><br/>
                    <input type="password" 
                           id="currentPwd" 
                           class="update_input" 
                           value="${login.password}">
                </div><!--//currentPwdBox-->
                <div id="newPwdBox" class="current_info_box">
                    <label for="newPwd">새 비밀번호</label> <label for="newPwd">비밀번호 확인</label><br/>
                    <input type="password" 
                           id="newPwd" 
                           name="password" 
                           class="update_input"
                           placeholder=" 4자~10자리의 영문, 숫자를 입력"
                           maxlength="10">         
                    <input type="password" 
                           id="confirmPwd" 
                           class="update_input"
                           placeholder=" 비밀번호와 동일하게 입력"
                           maxlength="10">
                </div><!--//newPwdBox-->
                <div class="update_btn_box">
                    <button class="account_update_btn" id="passwordBtn">수정</button>
                    <button class="account_update_write_cancel_btn">취소</button>
                </div><!--//update_btn_box -->
            </form>  
        </div><!--//changePassword-->
    </div><!--//updatePageWrap -->
    </div><!-- //contents -->
    <c:import url="template/footer.jsp"></c:import>
    <script src="js/jquery.js"></script>
    <script src="js/template.js"></script>
	<script>
		var $nicknameBtn = $("#nicknameBtn"),
			$idBtn = $("#idBtn"),
			$passwordBtn = $("#passwordBtn");
		
			
	$nicknameBtn.click(function(){
		
		//alert("test");
		var nickname = $("#newNickname").val(); 
		
		//입력한 새 닉네임 받아옴
		//alert(nickname);

		if(nickname==''){
			alert("닉네임을 적어주세요 ! ");
			
			return false;
		}
		
	});	
	
	$idBtn.click(function(){
		
		//alert("test");
		var newId = $("#newId").val(); 
		
		//입력한 새 닉네임 받아옴
		//alert(nickname);

		if(newId==''){
			alert("아이디를 적어주세요 ! ");
			
			return false;
		}
		
	});
	
	$passwordBtn.click(function(){
		
		//alert("test");
		var newPwd = $("#newPwd").val(); 

		if(newPwd==''){
			alert("비밀번호를 적어주세요 ! ");
			
			return false;
		}
		
	});
	
	</script>    
    <c:if test="${updateMsg != null}">
        <script>
    		alert('${updateMsg}');
    	</script>
    
    </c:if>

</body>
</html>