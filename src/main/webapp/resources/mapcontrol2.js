
var sx,sy,ex,ey;
    




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
var polyarr= new Array();
function drawkakaoPolyLine(data){
	var lineArray;
for(var j=0 ; j <polyarr.length; j++){
			polyarr[j].setMap(null)
		}
	for(var i = 0 ; i < data.result.lane.length; i++){
		
		for(var j=0 ; j <data.result.lane[i].section.length; j++){
			lineArray = null;
			lineArray = new Array();
			for(var k=0 ; k < data.result.lane[i].section[j].graphPos.length; k++){
				lineArray.push(new kakao.maps.LatLng(data.result.lane[i].section[j].graphPos[k].y, data.result.lane[i].section[j].graphPos[k].x));
			}
			
			
			
		//지하철결과의 경우 노선에 따른 라인색상 지정하는 부분 (1,2호선의 경우만 예로 들음)
			var polyline
			if(data.result.lane[i].type == 1){
				polyline = new kakao.maps.Polyline({
				    map: map,
				    path: lineArray,
				    strokeWeight: 15,
				    strokeColor: '#003499'
				});
				//
			}else if(data.result.lane[i].type == 2){
				polyline = new kakao.maps.Polyline({
				    map: map,
				    path: lineArray,
				    strokeWeight: 15,
				    strokeColor: '#37b42d'
				});
				//polyline.setMap(null)
			}else{
				polyline = new kakao.maps.Polyline({
				    map: map,
				    path: lineArray,
				    strokeWeight: 15,
				    strokeColor:  '#5F00FF',
				    strokeStyle:	'dashed',
				    strokeStyle:	'solid',
				    strokeOpacity: 1
				});
				//polyline.setMap(null)
				
			
			}
			polyarr.push(polyline)
		}
	}
}

