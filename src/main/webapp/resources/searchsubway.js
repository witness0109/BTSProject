//전역변수
	var str = "";

	//역조회 
	function searchSubwayStationAJAX(stationName, subCode) {

		var stationName = $("#stationName").val();
		var subCode = $("#subCode").val();

		console.log("역결과 : " + stationName);

		$.ajax({
			url : "./findapi/subway?stationName=" + stationName + "&subwayCode="
					+ subCode,
			type : "post",
			data : "application/json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(result) {
				outSubwayStationAJAX(result);
			},
			error : function(e) {

				$('#resultDiv').html("<br>정확한 역명을 입력해주세요");

			}

		});

	}

	function outSubwayStationAJAX(r) {
		if (r.resultCode == "success") {
			//arrTime, endSubwayStationNm, subwayStationNm
			//평일, 주말, 공휴일별 배열 객체 저장소
			var week_u_list = "";
			var week_d_list = "";
			var sat_u_list = "";
			var sat_d_list = "";
			var sun_u_list = "";
			var sun_d_list = "";

			//호출할 값들 정의하는 저장소
			var w_u_arrT = "";
			var w_d_arrT = "";
			var w_u_endSt = "";
			var w_d_endSt = "";
			var w_u_subSt = "";
			var w_d_subSt = "";

			console.log(r);
			console.log(r.up);
			console.log(r.down);
			//평일, 주말, 공휴일 저장 (api)// 상행
			if (r.up!=undefined) {
				week_u_list = r.up.weekday.items.item;
				sat_u_list = r.up.saturday.items.item;
				sun_u_list = r.up.sunday.items.item;
			}

			//평일,주말,공휴일 저장 (api)// 하행
			if (r.down!=undefined) {
			week_d_list = r.down.weekday.items.item;
			sat_d_list = r.down.saturday.items.item;
			sun_d_list = r.down.sunday.items.item;
			}
			
			str = "<table><tr><td><div class='box sbw'><table><caption>평일 상행선</caption>";
			str += "<tr><th>도착시간</th><th>종착역</th></tr>";

			//평일 상행
			for (var i = 0; i < week_u_list.length; i++) {
				w_u_arrT = week_u_list[i].arrTime;
				w_u_endSt = week_u_list[i].endSubwayStationNm;
				if (w_u_arrT == '000000') {
					continue;
				}

				str += "<tr><td>" + arrTime_Set(w_u_arrT) + "</td><td>"
						+ w_u_endSt + "</td></tr>";

			}

			str += "</table></div></td>";
			str += "<td><div class='box sbw'><table><caption>토요일 상행선</caption>";
			str += "<tr><th>도착시간</th><th>종착역</th></tr>";

			//토요 상행
			for (var i = 0; i < sat_u_list.length; i++) {
				w_u_arrT = sat_u_list[i].arrTime;
				w_u_endSt = sat_u_list[i].endSubwayStationNm;
				if (w_u_arrT == '000000') {
					continue;
				}

				str += "<tr><td>" + arrTime_Set(w_u_arrT) + "</td><td>"
						+ w_u_endSt + "</td></tr>";

			}

			str += "</table></div></td>";

			str += "<td><div class='box sbw'><table><caption>일요일 상행선</caption>";
			str += "<tr><th>도착시간</th><th>종착역</th></tr>";

			//일요 상행
			for (var i = 0; i < sun_u_list.length; i++) {
				w_u_arrT = sun_u_list[i].arrTime;
				w_u_endSt = sun_u_list[i].endSubwayStationNm;
				if (w_u_arrT == '000000') {
					continue;
				}

				str += "<tr><td>" + arrTime_Set(w_u_arrT) + "</td><td>"
						+ w_u_endSt + "</td></tr>";

			}

			str += "</table></div></td></tr>";

			str += "<tr><td><div class='box sbw'><table><caption>평일 하행선</caption>";
			str += "<tr><th>도착시간</th><th>종착역</th></tr>";

			//평일 상행
			for (var i = 0; i < week_d_list.length; i++) {
				w_u_arrT = week_d_list[i].arrTime;
				w_u_endSt = week_d_list[i].endSubwayStationNm;
				if (w_u_arrT == '000000') {
					continue;
				}

				str += "<tr><td>" + arrTime_Set(w_u_arrT) + "</td><td>"
						+ w_u_endSt + "</td></tr>";

			}

			str += "</table></div></td>";

			str += "<td><div class='box sbw'><table><caption>토요일 하행선</caption>";
			str += "<tr><th>도착시간</th><th>종착역</th></tr>";

			//토요일 하행
			for (var i = 0; i < sat_d_list.length; i++) {
				w_u_arrT = sat_d_list[i].arrTime;
				w_u_endSt = sat_d_list[i].endSubwayStationNm;
				if (w_u_arrT == '000000') {
					continue;
				}

				str += "<tr><td>" + arrTime_Set(w_u_arrT) + "</td><td>"
						+ w_u_endSt + "</td></tr>";

			}

			str += "</table></div></td>";

			str += "<td><div class='box sbw'><table><caption>일요일 하행선</caption>";
			str += "<tr><th>도착시간</th><th>종착역</th></tr>";

			//일요일 하행
			for (var i = 0; i < sun_d_list.length; i++) {
				w_u_arrT = sun_d_list[i].arrTime;
				w_u_endSt = sun_d_list[i].endSubwayStationNm;
				if (w_u_arrT == '000000') {
					continue;
				}

				str += "<tr><td>" + arrTime_Set(w_u_arrT) + "</td><td>"
						+ w_u_endSt + "</td></tr>";

			}

			str += "</table></div></td></tr></table>";

			$('#resultDiv').html(str);

		} else {

		}

		//시간설정
		function arrTime_Set(t) {
			var t = t.toString();
			var hh = t.substring(0, 2);
			var mm = t.substring(2, 4);

			t = hh + "시" + mm + "분"
			return t;
		}

	}