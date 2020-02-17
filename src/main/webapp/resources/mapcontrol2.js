
var sx, sy, ex, ey;
var currentMapobj;
var odApiKey = encodeURI('bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY');
// var odApiKey = encodeURIComponent('M8SKA0YgQxm9grGE6XQQutSOF6AI5wkAOpA+NNZlhCc')
;

//길찾기 API 호출


function callMapObjApiAJAX(mabObj) {
	if (mabObj == currentMapobj) {
		return;
	}

	currentMapobj = mabObj;
	var xhr = new XMLHttpRequest();
	//ODsay apiKey 입력
	var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@" + mabObj + "&apiKey=" + odApiKey;
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function () {
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
function drawkakaoMarker(x, y) {
	var marker = new kakao.maps.Marker({
		position: new kakao.maps.LatLng(y, x),
		map: map
	});
}

// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
var polyarr = new Array();
function drawkakaoPolyLine(data) {
	var lineArray;
	for (var j = 0; j < polyarr.length; j++) {
		polyarr[j].setMap(null)
	}
	for (var i = 0; i < data.result.lane.length; i++) {

		for (var j = 0; j < data.result.lane[i].section.length; j++) {
			lineArray = null;
			lineArray = new Array();
			for (var k = 0; k < data.result.lane[i].section[j].graphPos.length; k++) {
				lineArray.push(new kakao.maps.LatLng(data.result.lane[i].section[j].graphPos[k].y, data.result.lane[i].section[j].graphPos[k].x));
			}



			//지하철결과의 경우 노선에 따른 라인색상 지정하는 부분 (1,2호선의 경우만 예로 들음)
			var polyline


			if (data.result.lane[i].class == 1) {
/*

1	일반	12	지선
2	좌석	13	순환
3	마을버스	14	광역
4	직행좌석	15	급행
5	공항버스	20	농어촌버스
6	간선급행	21	제주도 시외형버스
10	외곽	22	경기도 시외형버스
11	간선	26	급행간선
*/

				if (data.result.lane[i].type == 1) { 
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#0068b7'
					});
				}else if (data.result.lane[i].type == 2) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#0068b7'
					});

				}else if (data.result.lane[i].type == 3) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#53b332'
					});

				}else if (data.result.lane[i].type == 4) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#e60012'
					});

				}else if (data.result.lane[i].type == 5) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#00a0e9'
					});

				}else if (data.result.lane[i].type == 6) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#e60012'
					});

				}else if (data.result.lane[i].type == 10) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#fe5b10'
					});

				}else if (data.result.lane[i].type == 11) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#ffc600'
					});

				}else if (data.result.lane[i].type == 12) { //jisun
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#53b332'
					});

				}else if (data.result.lane[i].type == 13) { //circular
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#f2b70a'
					});

				}else if (data.result.lane[i].type == 14) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#37b42d'
					});

				}else if (data.result.lane[i].type == 15) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#006896'
					});

				}else if (data.result.lane[i].type == 20) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#6600cc'
					});

				}else if (data.result.lane[i].type == 21) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#ffc600'
					});

				}else if (data.result.lane[i].type == 22) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#a800ff'
					});

				}else if (data.result.lane[i].type == 26) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#e60012'
					});

				}
			} else {
				if (data.result.lane[i].type == 1) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#003499'
					});
					//
				} else if (data.result.lane[i].type == 2) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#37b42d'
					});

				} else if (data.result.lane[i].type == 3) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#EF7C1C'
					});

				} else if (data.result.lane[i].type == 4) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#00A5DE'
					});

				} else if (data.result.lane[i].type == 5) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#996CAC'
					});

				} else if (data.result.lane[i].type == 6) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#CD7C2F'
					});

				} else if (data.result.lane[i].type == 7) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#747F00'
					});

				} else if (data.result.lane[i].type == 8) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#EA545D'
					});

				} else if (data.result.lane[i].type == 9) {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#BDB092'
					});

				} else if (data.result.lane[i].type == 100 || data.result.lane[i].type == 111) {//bundang line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#F5A200'
					});

				} else if (data.result.lane[i].type == 101) {//airline
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#0090D2'
					});

				} else if (data.result.lane[i].type == 104) {//gyeongui-center line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#77C4A3'
					});

				} else if (data.result.lane[i].type == 108) {//chun line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#0C8E72'
					});

				} else if (data.result.lane[i].type == 109) {//new bundang line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#D4003B'
					});

				} else if (data.result.lane[i].type == 112 || data.result.lane[i].type == 79) {//gyeonggang line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#003DA5'
					});

				} else if (data.result.lane[i].type == 113) {//ui line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#B0CE18'
					});

				} else if (data.result.lane[i].type == 114) {//west sea line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#81A914'
					});

				} else if (data.result.lane[i].type == 115) {//gimpo line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#A17800'
					});

				} else if (data.result.lane[i].type == 21) {//incheon 1 line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#7CA8D5'
					});

				} else if (data.result.lane[i].type == 22) {//incheon 2 line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#ED8B00'
					});

				} else if (data.result.lane[i].type == 31) {//dj 1 line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#007448'
					});

				} else if (data.result.lane[i].type == 41) {//dg 1 line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#D93F5C'
					});

				} else if (data.result.lane[i].type == 42) {//dg 2 line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#00AA80'
					});

				} else if (data.result.lane[i].type == 43) {//dg 3 line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#FFB100'
					});

				} else if (data.result.lane[i].type == 51) {//gj 1 line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#009088'
					});

				} else if (data.result.lane[i].type == 71) {//bs 1 line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#F06A00'
					});

				} else if (data.result.lane[i].type == 72) {//bs 2 line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#81BF48'
					});

				} else if (data.result.lane[i].type == 73) {//bs 3 line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#BB8C00'
					});

				} else if (data.result.lane[i].type == 74) {//bs 4 line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#217DCB'
					});

				} else if (data.result.lane[i].type == 78) {//east sea line
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#003DA5'
					});

				} else {
					polyline = new kakao.maps.Polyline({
						map: map,
						path: lineArray,
						strokeWeight: 15,
						strokeColor: '#1D2A56',
						strokeStyle: 'solid'
					});



				}
			}
			polyarr.push(polyline)
		}
	}
}

