        var lat, lng;
        var clickmarker, startingMarker, destMarker;
        var geocoder;
        var positions = [];
        var map;
        var url;
        
        navigator.geolocation.getCurrentPosition(function (gg) {
            lat = gg.coords.latitude;
            lng = gg.coords.longitude;
            var markerPosition = new kakao.maps.LatLng(lat, lng);
            // 지도 생성 및 객체 리턴
            var container = document.getElementById('map11'); // 지도를 담을 영역의
																// DOM 레퍼런스
            var options = { // 지도를 생성할 때 필요한 기본 옵션
                center: markerPosition, // 지도의 중심좌표.
                level: 8 // 지도의 레벨(확대, 축소 정도)
            };

            //////////////////////
            map = new kakao.maps.Map(container, options);  //지도생성

            // ////////////////////
            // getWeather(map);
          // 지도 중심 좌표 변경시 얻어오기
            kakao.maps.event.addListener(map, 'dragend', function() {
            	// getWeather(map);

            });
            
  
            // 지도에 클릭 이벤트를 등록합니다
            // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
            kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

                // 클릭한 위도, 경도 정보를 가져옵니다 
                var latlng = mouseEvent.latLng;

                // 마커 위치를 클릭한 위치로 옮깁니다
    
                let clickPosition = new kakao.maps.LatLng(latlng.Ha, latlng.Ga)
                geocoder = new kakao.maps.services.Geocoder();

                var content = '<div class="wrap"><div class = "setContainer"><div id="startset" onClick="setStarting()">출발지</div><div id="destset" onClick="setDestination()">도착지</div></div>' +
                    '<div onClick="closeOverlay()">닫기</div></div>';

                var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
                message += '경도는 ' + latlng.getLng() + ' 입니다';

                //console.log(message);


                if (clickmarker == undefined) {
                    if (overlay == undefined) {// 마커, 오버레이 모두없을때만 생성
                        makeOverlayMarker();
                    }
                }

                function makeOverlayMarker() {
                    overlay = new kakao.maps.CustomOverlay({
                        content: content,
                        map: map,
                        position: clickPosition
                    });
                    overlay.setMap(map);

                    clickmarker = new kakao.maps.Marker({
                        map: map, // 마커를 표시할 지도
                        position: clickPosition, // 마커를 표시할 위치
                    });
                    clickmarker.setMap(map)
                }

            });

        });



        // 마커 위에 커스텀오버레이를 표시합니다
        // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
        var overlay, startingov, destov; // 커스텀 오버레이 하나 돌려쓰기

        // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다. 마커와 오버레이 모두 제거합니다.
        function closeOverlay() {
            overlay.setMap(null);
            overlay = undefined;
            clickmarker.setMap(null);
            clickmarker = undefined;
        }


        function setStarting() {
            console.log("출발지 : "+clickmarker.getPosition())
            if(startingov != undefined){
                startingov.setMap(null);
            }
            if(startingMarker!=undefined){
                startingMarker.setMap(null);
            }
            startingov = new kakao.maps.CustomOverlay({
                content: '<div  class="markingov" style="background-color: white;">출발지</div>',
                map: map,
                position: new kakao.maps.LatLng(clickmarker.getPosition().Ha, clickmarker.getPosition().Ga)
            });
        
            var imageSrc = "./resources/start_marker.png";
        
            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new kakao.maps.Size(44, 60);
        
            // 마커 이미지를 생성합니다    
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
        
            startingMarker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: new kakao.maps.LatLng(clickmarker.getPosition().Ha, clickmarker.getPosition().Ga),// 마커를 표시할 위치
                image: markerImage // 마커 이미지 
            });
            startingov.setMap(map);
            startingMarker.setMap(map);
            closeOverlay();
            
            sy = startingMarker.getPosition().Ha;
            sx = startingMarker.getPosition().Ga;

            searchDetailAddrFromCoords(startingMarker.getPosition(), function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    $('#startaddr').val(result[0].address.address_name);
                }   
            });

          
        }
        
        function setDestination() {
        
                console.log("도착지 : " + clickmarker.getPosition())
                if(destov != undefined){
                    destov.setMap(null);
                }
                if(destMarker!=undefined){
                    destMarker.setMap(null);
                }
                destov = new kakao.maps.CustomOverlay({
                    content: '<div class="markingov" style="background-color: white;">도착지</div>',
                    map: map,
                    position: new kakao.maps.LatLng(clickmarker.getPosition().Ha, clickmarker.getPosition().Ga)
                });
                
                var imageSrc = "./resources/dest_marker.png";
                var imageSize = new kakao.maps.Size(44, 60);
        
                // 마커 이미지를 생성합니다    
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                destMarker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: new kakao.maps.LatLng(clickmarker.getPosition().Ha, clickmarker.getPosition().Ga), // 마커를 표시할 위치
                    image: markerImage
                });
                
                destov.setMap(map);
                destMarker.setMap(map);
                closeOverlay();
                ey = destMarker.getPosition().Ha;
                ex = destMarker.getPosition().Ga;

                searchDetailAddrFromCoords(destMarker.getPosition(), function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        $('#endaddr').val(result[0].address.address_name);
                    }   
                });
            
        }
        
        function searchDetailAddrFromCoords(coords, callback) {
            // 좌표로 법정동 상세 주소 정보를 요청합니다
            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }
        
        
        