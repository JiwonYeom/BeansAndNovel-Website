<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>findStore</title>
    <c:import url="template/link.jsp"></c:import>
    <style>
        body {
            font-family: "bon", sans-serif;
        }
        
        #contents {
            width: 980px;
            margin: auto;
        }
        
        h2 {
            font-size: 30px;
            margin:20px auto 13px auto;
        }
        
        .storeInfo {
            height: 232px;
            position:relative;
            margin:20px auto;
            /*background-color: green;*/
        }
        
        .storeInfo .storePic img {
            width: 301px;
            /*height: 240px;*/
            position: absolute;
            bottom:0;
            left:0;
            /*background-color: antiquewhite;*/
        }
        
        .storeInfo .aboutStore {
            width: 388px;
            height: 232px;
            position: absolute;
            bottom:0;
            left: 312px;
            padding-left:10px;
            font-size:15px;
            /*background-color: beige;*/
        } 
        
        .aboutStore p {
            margin-bottom:8px;
        }
        
        .aboutStore .store_name {
            font-size: 23px;
            margin-top: 10px;
        }
        .aboutStore .store_address {
            margin : 25px auto 25px auto;
        }
        
        .aboutStore .store_hours_info {
            margin-top: 25px;
        }
        
        .aboutStore .store_hours_info .office_hours {
            margin-bottom: 12px;
        }
        
        .aboutStore .store_hours_info p {
            margin-bottom: 8px;
        }
        
        .storeInfo .store_location {
            width: 270px;
            height: 232px;
            position: absolute;
            bottom:0;
            right:0;
            /*background-color: aqua;*/
        }
    </style>
</head>
<c:import url="/header"></c:import>

    <div id="contents">
        <h2>Beans &amp; Novel 매장 안내</h2>
        <hr /> 
          
        <div class="storeInfo">    
            <div class="storePic">
                <img src="img/store.jpg" />
            </div> <!-- // storePic -->
            <div class="aboutStore">
                <p class="store_name">서울대점</p>
                <p class="store_address">서울특별시 관악구 관악로 1 서울대학교 학생회관 구내서점</p>
                <p class="store_phonenumber">전화번호 : (02)880-8581~3</p>
                <p class="store_faxnumber">팩스 : 0502-987-5763</p>
                <div class="store_hours_info">
                    <p class="office_hours">영업시간</p>
                    <p class="mon_to_fri">월~금 : 09:00 ~ 19:00</p>
                    <p class="sat_to_sun">토~일 : 09:00 ~ 22:00</p>
                </div>
            </div> <!-- // aboutStore -->
            <div class="store_location"></div> <!-- // store_location -->
        </div> <!-- // storeInfo -->
        
        <hr />
        
        <div class="storeInfo">    
            <div class="storePic">
                <img src="img/store.jpg" />
            </div> <!-- // storePic -->
            <div class="aboutStore">
                <p class="store_name">강남점</p>
                <p class="store_address">서울특별시 서초구 강남대로 465 교보타워 지하1,2층</p>
                <p class="store_phonenumber">전화번호 : 1544-1900</p>
                <p class="store_faxnumber">팩스 : 0502-987-5744</p>
                <div class="store_hours_info">
                    <p class="office_hours">영업시간</p>
                    <p class="mon_to_fri">월~금 : 09:30 ~ 22:00</p>
                    <p class="sat_to_sun">토~일 : 09:30 ~ 22:00</p>
                </div>
            </div> <!-- // aboutStore -->
            <div class="store_location"></div> <!-- // store_location -->
        </div> <!-- // storeInfo -->
        
        <hr />
        
        <div class="storeInfo">    
            <div class="storePic">
                <img src="img/store.jpg" />
            </div> <!-- // storePic -->
            <div class="aboutStore">
                <p class="store_name">영등포점</p>
                <p class="store_address">서울특별시 영등포구 영중로 15 타임스퀘어 멀티플렉스 2층</p>
                <p class="store_phonenumber">전화번호 : 1544-1900</p>
                <p class="store_faxnumber">팩스 : 0502-987-5760</p>
                <div class="store_hours_info">
                    <p class="office_hours">영업시간</p>
                    <p class="mon_to_fri">월~금 : 10:00 ~ 22:00</p>
                    <p class="sat_to_sun">토~일 : 10:00 ~ 22:00</p>
                </div>
            </div> <!-- // aboutStore -->
            <div class="store_location"></div> <!-- // store_location -->
        </div> <!-- // storeInfo -->
        
        <hr />
        
        <div class="storeInfo">    
            <div class="storePic">
                <img src="img/store.jpg" />
            </div> <!-- // storePic -->
            <div class="aboutStore">
                <p class="store_name">잠실점</p>
                <p class="store_address">서울특별시 송파구 올림픽로 269 롯데 캐슬프라자 지하1층</p>
                <p class="store_phonenumber">전화번호 : 1544-1900</p>
                <p class="store_faxnumber">팩스 : 0502-987-5747</p>
                <div class="store_hours_info">
                    <p class="office_hours">영업시간</p>
                    <p class="mon_to_fri">월~금 : 09:30 ~ 22:00</p>
                    <p class="sat_to_sun">토~일 : 09:30 ~ 22:00</p>
                </div>
            </div> <!-- // aboutStore -->
            <div class="store_location"></div> <!-- // store_location -->
        </div> <!-- // storeInfo -->
        
        <hr />
        
        <div class="storeInfo">    
            <div class="storePic">
                <img src="img/store.jpg" />
            </div> <!-- // storePic -->
            <div class="aboutStore">
                <p class="store_name">목동점</p>
                <p class="store_address">서울특별시 양천구 목동서로 159-1 CBS지하 1층</p>
                <p class="store_phonenumber">전화번호 : 1544-1900</p>
                <p class="store_faxnumber">팩스 : 0502-987-5757</p>
                <div class="store_hours_info">
                    <p class="office_hours">영업시간</p>
                    <p class="mon_to_fri">월~금 : 11:00 ~ 21:30</p>
                    <p class="sat_to_sun">토~일 : 11:00 ~ 21:30</p>
                </div>
            </div> <!-- // aboutStore -->
            <div class="store_location"></div> <!-- // store_location -->
        </div> <!-- // storeInfo -->
    </div> <!-- // contents -->
   <c:import url="template/footer.jsp"></c:import>
    <script src="js/jquery.js"></script>
    <script src="js/template.js"></script>
    <!-- 다음 지도 import -->
    <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=2daedda5cd472c7aac96b03f668a692c"></script>
    <script>
        
        // 서울대점
        var container1 = $(".store_location").get(0);
    
        var latLng1 = new daum.maps.LatLng(37.459591, 126.950559);
        
        var option1 = {
            center:latLng1,
            level:3
        };
        
        var map1 = new daum.maps.Map(container1,option1);
        
        var marker1 = new daum.maps.Marker();
            marker1.setMap(map1);
            marker1.setPosition(latLng1);
        
        // ------------------------------------------------ //
        
        // 강남점
        var container2 = $(".store_location").get(1);
    
        var latLng2 = new daum.maps.LatLng(37.503903, 127.024031);
        
        var option2 = {
            center:latLng2,
            level:3
        };
        
        var map2 = new daum.maps.Map(container2,option2);
        
        var marker2 = new daum.maps.Marker();
            marker2.setMap(map2);
            marker2.setPosition(latLng2);
        
        // ------------------------------------------------ //
        
        // 영등포점
        var container3 = $(".store_location").get(2);
    
        var latLng3 = new daum.maps.LatLng(37.517175, 126.903735);
        
        var option3 = {
            center:latLng3,
            level:3
        };
        
        var map3 = new daum.maps.Map(container3,option3);
        
        var marker3 = new daum.maps.Marker();
            marker3.setMap(map3);
            marker3.setPosition(latLng3);
        
        // ------------------------------------------------ //
        
        // 잠실점
        var container4 = $(".store_location").get(3);
    
        var latLng4 = new daum.maps.LatLng(37.512900, 127.100817);
        
        var option4 = {
            center:latLng4,
            level:3
        };
        
        var map4 = new daum.maps.Map(container4,option4);
        
        var marker4 = new daum.maps.Marker();
            marker4.setMap(map4);
            marker4.setPosition(latLng4);
        
        // ------------------------------------------------ //
        
        // 잠실점
        var container5 = $(".store_location").get(4);
    
        var latLng5 = new daum.maps.LatLng(37.528436, 126.874970);
        
        var option5 = {
            center:latLng5,
            level:3
        };
        
        var map5 = new daum.maps.Map(container5,option5);
        
        var marker5 = new daum.maps.Marker();
            marker5.setMap(map5);
            marker5.setPosition(latLng5);
        
        // ------------------------------------------------ //
        
        
        
       
        

    </script>
</body>
</html>
