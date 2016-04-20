<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Beans&amp;Novel Bookstore</title>
	<c:import url="template/link.jsp"></c:import>
    <style>
        body {
            width: 100%;
            font-weight: 200;
        }
        
        #contents {
            width: 980px;
            margin: auto;
            position: relative;
            /*background: #FAFAFA;*/
            margin-top: 20px;
            padding-bottom: 40px;
        }
        
        #contents h2 {
            font-size: 30px;
            font-weight: 600;
            padding: 10px;
        }
        
        #contents h3 {
            font-size: 20px;
            font-weight: 300;
            padding: 10px;
            padding-bottom: 20px;
            margin-left: 5px;
        }
        
        #contents h3 a {
            text-decoration: none;
            color: forestgreen;
            font-weight: 900;
        }
        
        fieldset {
            position:relative;
        }
        
        .btnbox {
            text-align: right;
            margin-top: 20px;
            /*background-color: red;*/
            position: absolute;
            right: 85px;
        }
        
        .btn {
            color: #fff;
            background: #48874C;
            border: none;
            width: 80px;
            height: 30px;
            font-weight: 500;
            font-size: 15px;
            cursor: pointer;
            /*line-height: 25px;*/
        }
        
        .btn:hover {
            transition: .2s ease;
            background: #417144;
        }
         
        #joinBox {
            width: 500px;
            height: 435px; /* 370px -> 435px*/
            margin: auto;
            margin-top: 20px;
            padding: 15px;
            border-radius: 5px;
            border: 1px solid #E0E0E0;
            font-size: 15px;
            font-weight: 500;
            /*background: #EEEEEE;*/
            /*box-shadow: 0 16px 28px 0 rgba(0, 0, 0, 0.22), 0 25px 55px 0 rgba(0, 0, 0, 0.21);*/
        }
        
        .input_box {
            width: 310px;
            margin: auto;
            margin-top: 10px;
        }
        
        .input_box input {
            border-radius: 5px;
            width: 310px;
            height: 28px;
            line-height: 14px;
            margin-top: 5px;
            margin-bottom: 5px;
            border: 2px solid #B0BEC5;
        }
        
        .duplication,
        .alert {
            color: red;
            font-size: 15px;
            font-weight: 400;
            margin-top: 3px;
            display: none;
        }
        
        .duplication.view,
        .alert.view {
            display: block;
        }
    </style>
</head>

<c:import url="/header"></c:import>
    <div id="contents">
        <div class="aux">
            <h2>회원가입</h2>

            <div id="joinBox">
                <form action="/join" method="post" id="joinForm">
                    <fieldset>
                        <legend class="screen_out">회원가입 폼</legend>

                        <div class="input_box">
                            <div class="label">
                                아이디
                            </div>
                            <div class="alert">
                                4자~10자리의 영문, 숫자를 입력해주세요.
                            </div>
                            <div class="duplication">
                                이미 사용중인 아이디 입니다.
                            </div>
                            <input type="text" id="id" name="id" placeholder=" 4자~10자리의 영문, 숫자를 입력해주세요." required />
                        </div>

                        <div class="input_box">
                            <div class="label">
                                비밀번호
                            </div>
                            <div class="alert">
                                4자~10자리의 영문, 숫자를 입력해주세요.
                            </div>
                            <input type="password" id="password" name="password" placeholder=" 4자~10자리의 영문, 숫자를 입력해주세요." required/>
                        </div>

                        <div class="input_box">
                            <div class="label">
                                비밀번호 확인
                            </div>
                            <div class="alert">
                                비밀번호와 동일하게 입력해 주세요.
                            </div>
                            <input type="password" id="passwordCheck" placeholder=" 비밀번호와 동일하게 입력해 주세요." required/>
                        </div>

                        <div class="input_box">
                            <div class="label">
                                닉네임
                            </div>
                            <div class="alert">
                                1자~6자리의 한글,영문,숫자를 입력해주세요.
                            </div>
                            <div class="duplication">
                                이미 사용중인 닉네임 입니다.
                            </div>
                            <input type="text" id="nickname" name="nickname" placeholder=" 1자~6자리의 한글,영문,숫자를 입력해주세요." required />
                        </div>
                        <div id="bitrh" class="input_box">
                            <label>생년월일</label>
                            <select id="year" name="year">
                            </select>년
                            <select id="month" name="month">
                            </select>월
                            <select id="date" name="date">
                            </select>일
                        </div>

                        <div class="btnbox">
                            <button class="btn" type="reset">초기화</button>
                            <button class="btn join" type="submit">회원가입</button>
                        </div>
                    </fieldset>
                </form>
            </div>
            <!-- // joinBox -->
        </div>
        <!--//aux end -->
    </div>
    <!--//contents end -->
<c:import url="template/footer.jsp"></c:import>
    <script src="/js/jquery.js"></script>
    <script src="/js/moment-with-locales.js"></script>
    <script src="/js/template.js"></script>
    <script>
        var $year = $("#year"); //select부분
        var $month = $("#month");
        var $date = $("#date");
        var $id = $("#joinBox #joinForm #id");
        var $password = $("#joinBox #joinForm #password");
        var $passwordCheck = $("#joinBox #joinForm #passwordCheck");
        var $nickname = $("#joinBox #joinForm #nickname");

        createOption();

        //년과 월이 자동으로 만들어지는 함수
        function createOption() {

            //현재 날짜에 대한 moment객체
            var now = moment();

            //현재에서 년도를 얻어옴
            var year = now.year();
            //alert(year);

            for (var i = year; i > year - 100; i--) {
                //             100년 전에서 현재년도까지

                //console.log(i);
                //옵션객체 생성
                var $option = $("<option value='"+i+"'>").text(i);

                if (i == 1980) {
                    $option.attr("selected", "selected");
                } //if end

                //     추가기능
                $year.append($option);

            } //for end

            for (var i = 1; i < 13; i++) {
                //console.log(i);
                $("<option value='"+i+"'>").text(i).appendTo($month);

            } //for end

            //년월 만들었으니까 날짜도 생성
            createDates();

            //년을 변경했을 때 (년도를 바꾸면 선택한 월 대신 1월로)
            $year.change(function () {

                $month.children().removeAttr("selected");

                createDates();
            }); //change end

            //월을 변경했을 때
            $month.change(createDates);

        } //createOptions() end

        //유저가 선택하는 년도, 월에 따라서 다르게 날짜 옵션요소들이 생성되는 함수
        function createDates() {

            //$date 안에 있는 option요소들을 전부 비우기 (초기화)
            $date.empty();

            //유저가 선택한 년도를 얻어옴
            var year = $year.val();

            //유저가 선택한 월을 얻어옴
            var month = $month.val();

            //해당년월의 moment객체 생성
            var time = moment([year, month - 1]);

            //해당년월의 마지막일
            var end = time.endOf("month").date();

            for (var i = 1; i <= end; i++) {
                $("<option value='"+i+"'>").text(i).appendTo($date);
            } //for end

        } //createDates() end


        // id 유효성 검사: 4~10자, 영어, 숫자
        $("#joinBox #joinForm #id").keyup(function (e) {

            if (check(/^[A-Za-z0-9]{4,10}$/, $(this))) {
                if (isDupValue($(this))) { // 중복 검사

                    $(this).removeClass("success");
                    $(this).addClass("error");
                    //$(this).siblings(".alert").addClass("view");
                    $(this).siblings(".duplication").addClass("view");
                    $(this).focus();
                } else {
                    $(this).siblings(".duplication").removeClass("view");
                }
            } else {
                $(this).siblings(".duplication").removeClass("view");
            }
            displayBottom();
        });

        // password 유효성 검사: 4~10자, 영어, 숫자
        $("#joinBox #joinForm #password").keyup(function (e) {

            if (check(/^[A-Za-z0-9]{4,10}$/, $(this))) {
                if (isDupValue($(this))) { // 중복 검사

                    $(this).removeClass("success");
                    $(this).addClass("error");
                    //$(this).siblings(".alert").addClass("view");
                    $(this).siblings(".duplication").addClass("view");
                    $(this).focus();
                } else {
                    $(this).siblings(".duplication").removeClass("view");
                }
            } else {
                $(this).siblings(".duplication").removeClass("view");
            }
        });

        // password 일치 검사
        $("#joinBox #joinForm #passwordCheck").keyup(function (e) {
            var $this = $(this);
            if ($this.val() == $password.val()) {
                $this.removeClass("error");
                $this.addClass("success");
                $this.next().removeClass("view");
                $(this).siblings(".alert").removeClass("view");
                //alert("success");
            } else {
                $this.removeClass("success");
                $this.addClass("error");
                //$this.next().addClass("view");
                $(this).siblings(".alert").addClass("view");
                $this.focus();
                //alert("fail");
            }
        });

        // nickname 유효성 검사: 1~6자, 영어, 숫자, 한글
        $("#joinBox #joinForm #nickname").keyup(function (e) {

            if (check(/^[A-Za-z0-9가-힣ㄱ-ㅎㅏ-ㅣ]{1,6}$/, $(this))) {
                if (isDupValue($(this))) { // 중복 검사

                    $(this).removeClass("success");
                    $(this).addClass("error");
                    //$(this).siblings(".alert").addClass("view");
                    $(this).siblings(".duplication").addClass("view");
                    $(this).focus();
                } else {
                    $(this).siblings(".duplication").removeClass("view");
                }
            } else {
                $(this).siblings(".duplication").removeClass("view");
            }
            displayBottom();
        });

        // 가입하기 클릭시 입력 정보 확인
        $("#joinBox #joinForm .join").click(function (e) {

            if ($("#joinBox #joinForm .success").length < 4) {
                e.preventDefault();

                var $errorEl = $("#joinBox #joinForm .error");
                if ($errorEl.length > 0) {
                    $errorEl[0].focus();
                } else if (!$id.hasClass("success")) {
                    $id.focus();
                } else if (!$nickname.hasClass("success")) {
                    $nickname.focus();
                } else if (!$password.hasClass("success")) {
                    $password.focus();
                } else if (!$passwordCheck.hasClass("success")) {
                    $passwordCheck.focus();
                } else {
                    $id.focus();
                }
            }
        });

        // id,nickname 중복 확인
        function isDupValue($input) {
            // test
            if ($input.val() != "1212") {
                return false;
            }

            $.ajax("ajax/duplicationCheck.jsp", {
                type: "post",
                dataType: "json",
                data: {
                    type: $input.attr("id"),
                    colName: $input.val()
                },
                error: function (xhr, error, code) {
                    return true;
                },
                success: function (json) {
                    return false;
                }
            });

            return true;
        }

        // input 정규식 입력 확인
        function check(reg, el) {
            if (reg.test(el.val())) {
                el.removeClass("error");
                el.addClass("success");
                el.siblings(".alert").removeClass("view");
                return true;
            } else {
                el.removeClass("success");
                el.addClass("error");
                el.siblings(".alert").addClass("view");
                el.focus();
                return false;
            }
        }
        
        
       
    </script>
</body>

</html>