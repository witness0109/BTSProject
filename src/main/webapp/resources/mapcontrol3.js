


function callMapOutCity(mabObj, sx, sy, ex, ey, mabObj2, event) {
	// mabObj => obejct. key s= 시작점 e= 도착점 c = 출발 도착의 좌표 집합 객체
	event.stopPropagation();
	if (currentMapobj != undefined && sx == currentMapobj.sx && sy == currentMapobj.sy && ex == currentMapobj.ex && ey == currentMapobj.ey) {
		return;
	}

	var xhr = new XMLHttpRequest();
	//ODsay apiKey 입력
	var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@" + mabObj + "&apiKey=" + odApiKey;
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var startLine = JSON.parse(xhr.responseText);
			url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@" + mabObj2 + "&apiKey=" + odApiKey;
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function () {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var endLine = JSON.parse(xhr.responseText);

					let ob = {};
					ob.sx = sx;
					ob.sy = sy;
					ob.ex = ex;
					ob.ey = ey;
					currentMapobj = ob;

					drawOutCityPolyLine(startLine, ob, endLine);		// 노선그래픽데이터 지도위 표시
					// boundary 데이터가 있을경우, 해당 boundary로 지도이동
					if (endLine.result.boundary) {
						var boundary = new kakao.maps.LatLngBounds(
							new kakao.maps.LatLng(endLine.result.boundary.top, endLine.result.boundary.left),
							new kakao.maps.LatLng(endLine.result.boundary.bottom, endLine.result.boundary.right)
						);
						map.setBounds(boundary);
					}
				}
			}

		}
	}
}


// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
function drawOutCityPolyLine(start, center, end) {
	var lineArray, polyline;
	for (var j = 0; j < polyarr.length; j++) {
		polyarr[j].setMap(null)
	}
	for (var i = 0; i < start.result.lane.length; i++) {

		for (var j = 0; j < start.result.lane[i].section.length; j++) {
			lineArray = null;
			lineArray = new Array();
			for (var k = 0; k < start.result.lane[i].section[j].graphPos.length; k++) {
				lineArray.push(new kakao.maps.LatLng(start.result.lane[i].section[j].graphPos[k].y, start.result.lane[i].section[j].graphPos[k].x));
			}
			// lineArray.push(new kakao.maps.LatLng(35.879655, 128.628464));
			// lineArray.push(new kakao.maps.LatLng(35.879655, 128.732923));



			polyline = makePolyLine(start, i, polyline, lineArray);

			polyarr.push(polyline)
		}
	}
	lineArray = new Array();
	lineArray.push(new kakao.maps.LatLng(center.sy, center.sx));
	lineArray.push(new kakao.maps.LatLng(center.ey, center.ex));
	polyline = new kakao.maps.Polyline({
		map: map,
		path: lineArray,
		strokeWeight: 10,
		strokeColor: '#1D2A56',
		strokeOpacity: 1,
		strokeStyle: 'solid'
			
	});
	polyarr.push(polyline)

	for (var i = 0; i < end.result.lane.length; i++) {
		lineArray = new Array();
		for (var j = 0; j < end.result.lane[i].section.length; j++) {

			for (var k = 0; k < end.result.lane[i].section[j].graphPos.length; k++) {
				lineArray.push(new kakao.maps.LatLng(end.result.lane[i].section[j].graphPos[k].y, end.result.lane[i].section[j].graphPos[k].x));
			}




			polyline = makePolyLine(end, i, polyline, lineArray);

			polyarr.push(polyline)
		}
	}

}

