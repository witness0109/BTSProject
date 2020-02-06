
var lat, lng;
var clickmarker, startingMarker, destMarker;
var positions = [];
var map;
var sx,sy,ex,ey;
navigator.geolocation.getCurrentPosition(function (gg) {
    lat = gg.coords.latitude;
    lng = gg.coords.longitude;
    // var markerPosition  = new kakao.maps.LatLng(lat, lng); 
    var markerPosition = new kakao.maps.LatLng(37.490134,126.705715); // 지도의 중심좌표

    var container = document.getElementById('map11'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
        center: markerPosition, //지도의 중심좌표.
        level: 3 //지도의 레벨(확대, 축소 정도)
    };

    //////////////////////
    map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴



    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // // 지도를 클릭한 위치에 표출할 마커입니다
    // var marker = new kakao.maps.Marker({ 
    //     // 지도 중심좌표에 마커를 생성합니다 
    //     position: map.getCenter() 
    // }); 
    // // 지도에 마커를 표시합니다
    // marker.setMap(map);

    // 지도에 클릭 이벤트를 등록합니다
    // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

        // 클릭한 위도, 경도 정보를 가져옵니다 
        var latlng = mouseEvent.latLng;

        // 마커 위치를 클릭한 위치로 옮깁니다
        // marker.setPosition(latlng);

        // positions.push(
        //     {
        //         title: '',
        //         latlng: new kakao.maps.LatLng(latlng.Ha, latlng.Ga)
        //     }
        // )
        let clickPosition = new kakao.maps.LatLng(latlng.Ha, latlng.Ga)
        
        var content = '<div class="wrap"><div class = "setContainer"><div id="startset" onClick="setStarting()">출발지</div><div id="destset" onClick="setDestination()">도착지</div></div>' +
            '<div onClick="closeOverlay()">닫기</div></div>';

        var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
        message += '경도는 ' + latlng.getLng() + ' 입니다';

        //console.log(message);


        if (clickmarker == undefined) {
            if (overlay == undefined) {// 마커, 오버레이 모두없을때만 생성
                makeOverlayMarker()
            }
        }

        function makeOverlayMarker() {
            overlay = new kakao.maps.CustomOverlay({
                content: content,
                map: map,
                position: clickPosition
            });
            overlay.setMap(map);

//            clickmarker = new kakao.maps.Marker({
//                map: map, // 마커를 표시할 지도
//                position: clickPosition, // 마커를 표시할 위치
//            });
//            재영오빠거
            clickmarker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: clickPosition, // 마커를 표시할 위치             
                
            });
        }

    });

})




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

    startingMarker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: new kakao.maps.LatLng(clickmarker.getPosition().Ha, clickmarker.getPosition().Ga)// 마커를 표시할 위치
    });
    startingov.setMap(map);
    startingMarker.setMap(map);
    closeOverlay();
    
    sy = startingMarker.getPosition().Ha;
    sx = startingMarker.getPosition().Ga;
   
    
    
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
    
    destMarker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: new kakao.maps.LatLng(clickmarker.getPosition().Ha, clickmarker.getPosition().Ga) // 마커를 표시할 위치
    });
    destov.setMap(map);
    destMarker.setMap(map);
    closeOverlay();
  
    ey = destMarker.getPosition().Ha;
    ex = destMarker.getPosition().Ga;
    searchPubTransPathAJAX();
}



function searchPubTransPathAJAX() {
	var xhr = new XMLHttpRequest();
	//ODsay apiKey 입력
	var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey+"&apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY";	
	
	//var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX=126.705715&SY=37.490134&EX=126.723525&EY=37.489521&apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY";
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
		console.log( JSON.parse(xhr.responseText) ); // <- xhr.responseText 로 결과를 가져올 수 있음
		//노선그래픽 데이터 호출
		callMapObjApiAJAX((JSON.parse(xhr.responseText))["result"]["path"][0].info.mapObj);
		}
	}
	
}

//길찾기 API 호출


function callMapObjApiAJAX(mabObj){
	var xhr = new XMLHttpRequest();
	//ODsay apiKey 입력
	var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@"+mabObj+"&apiKey=bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY";
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultJsonData = JSON.parse(xhr.responseText);
			startingMarker;				// 출발지 마커 표시
			destMarker;				// 도착지 마커 표시		
			drawkakaoPolyLine(resultJsonData);		// 노선그래픽데이터 지도위 표시
			// boundary 데이터가 있을경우, 해당 boundary로 지도이동
			/*if(resultJsonData.result.boundary){
					var boundary = new kakao.maps.LatLngBounds(
			                new kakao.maps.LatLng(resultJsonData.result.boundary.top, resultJsonData.result.boundary.left),
			                new kakao.maps.LatLng(resultJsonData.result.boundary.bottom, resultJsonData.result.boundary.right)
			                );
					map.panToBounds(boundary);
			}*/
		}
	}
}

// 지도위 마커 표시해주는 함수
function drawkakaoMarker(x,y){
	var marker = new kakao.maps.Marker({
	    position: new kakao.maps.LatLng(y, x),
	    map: map
	});
}

// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
function drawkakaoPolyLine(data){
	var lineArray;
	
	for(var i = 0 ; i < data.result.lane.length; i++){
		for(var j=0 ; j <data.result.lane[i].section.length; j++){
			lineArray = null;
			lineArray = new Array();
			for(var k=0 ; k < data.result.lane[i].section[j].graphPos.length; k++){
				lineArray.push(new kakao.maps.LatLng(data.result.lane[i].section[j].graphPos[k].y, data.result.lane[i].section[j].graphPos[k].x));
			}
			
		//지하철결과의 경우 노선에 따른 라인색상 지정하는 부분 (1,2호선의 경우만 예로 들음)
			if(data.result.lane[i].type == 1){
				var polyline = new kakao.maps.Polyline({
				    map: map,
				    path: lineArray,
				    strokeWeight: 20,
				    strokeColor: '#003499'
				});
			}else if(data.result.lane[i].type == 2){
				var polyline = new kakao.maps.Polyline({
				    map: map,
				    path: lineArray,
				    strokeWeight: 20,
				    strokeColor: '#37b42d'
				});
			}else{
				var polyline = new kakao.maps.Polyline({
				    map: map,
				    path: lineArray,
				    strokeWeight: 20,
				    strokeColor:  '#5F00FF'
				});
			}
		}
	}
}

