var pathArr;
        const findpath_apiurl = 'https://api.odsay.com/v1/api/searchPubTransPathR';
        
        
       // api data setting
        function setData(searchType) {
            return {
                    apiKey: 'bKv5QtEW7wrE81s/i5iJMRiIwxTasu5T5p2/vsfkZAY',
                    lang: 0,
                    SX: startingMarker.getPosition().Ga,
                    SY: startingMarker.getPosition().Ha,
                    EX: destMarker.getPosition().Ga,
                    EY: destMarker.getPosition().Ha,
                    OPT: 0, // 0: 최단거리, 1 타입별정렬
                    SearchType: searchType
                };
        }

// 시내길찾기 버튼
        $('#findpath').on('click', (ev) => {
            if (startingMarker == undefined || destMarker == undefined) {
                alert('먼저 출발지와 도착지를 모두 설정해 주세요')
                return
            }
            let data0 = setData(0);
            $.ajax({
                url: findpath_apiurl,
                data: data0,
                type: 'get',
                datatype: 'json',
                success: (r)=>findPathCityIn(r),
                error: (e) => { console.log(e) }
            })

        })

        // 시외 길찾기 버튼
        $('#findpath2').on('click', (ev) => {
            if (startingMarker == undefined || destMarker == undefined) {
                alert('먼저 출발지와 도착지를 모두 설정해 주세요')
                return
            }
            let data1 = setData(1);
            $.ajax({
                url: findpath_apiurl,
                data: data1,
                type: 'get',
                datatype: 'json',
                success: (r)=>findPathCityOut(r),
                error: (e) => { console.log(e) }
            })
        })
        function shoeErrMsg(errcode, msg) {
            if (errcode == '-98') {
                alert(msg)
            }
            else if (errcode == '500') {
                alert(msg)
            }
            else if (errcode == '6') {
                alert(msg)
            }
            else if (errcode == '-99') {
                alert(msg)
            }
            return
        }


// 도시간 길찾기(기차, 고속, 시외버스)
        let trainResult='';
        let expbusResult='';
        var str = '';
        function findPathCityOut(result) {
            if (result.error !== undefined) {
                shoeErrMsg(result.error.code, result.error.msg)
            }

            var trainpath = result.result.trainRequest;
            var expBuspath = result.result.exBusRequest;
            var outBuspath = result.result.outBusRequest;

            
            str = "<p>출발 도시 :" + result.result.startCityName + "</p>" + "<p>도착 도시 :" + result.result.endCityName + "</p>" + "<p>총 결과 :" + result.result.totalCount + "개</p>" +
                "<p>기차 이용 :" + trainpath.count + "개</p>" + "<p>고속버스, 시외버스 이용 :" + (expBuspath.count + outBuspath.count) + "개</p>";

            let tarinobj = trainpath.OBJ;
            trainResult='';
            expbusResult='';

            for (let i = 0; i < trainpath.count; i++) {
                let time = Math.floor(tarinobj[i].time / 60) + "시간 " + tarinobj[i].time % 60 + "분"
                trainResult += '<div class="box train">'
                    + "<p>요금 :" + tarinobj[i].payment + "</p>"
                    + "<p>기차 종류 :" + tarinobj[i].trainType + "</p>"
                    + "<p>출발역 :" + tarinobj[i].startSTN + "</p>"
                    + "<p>도착역 :" + tarinobj[i].endSTN + "</p>"
                    + "<p>총 소요시간 :" + time + "</p>"
                    + '</div>'
            }
            let expbusobj = expBuspath.OBJ;
            for (let i = 0; i < expBuspath.count; i++) {
                let time = Math.floor(expbusobj[i].time / 60) + "시간 " + expbusobj[i].time % 60 + "분"
                expbusResult += '<div class="box expbus">'
                    + "<p>요금 :" + expbusobj[i].payment + "</p>"
                    + "<p>버스 종류 : 고속버스</p>"
                    + "<p>출발터미널 :" + expbusobj[i].startSTN + "</p>"
                    + "<p>도착터미널 :" + expbusobj[i].endSTN + "</p>"
                    + "<p>총 소요시간 :" + time + "</p>"
                    + '</div>'
            }

            let outBusobj = outBuspath.OBJ;
            for (let i = 0; i < outBusobj.length ; i++) {
                let time = Math.floor(outBusobj[i].time / 60) + "시간 " + outBusobj[i].time % 60 + "분"
                expbusResult += '<div class="box expbus">'
                    + "<p>요금 :" + outBusobj[i].payment + "</p>"
                    + "<p>기차 종류 : 시외버스</p>"
                    + "<p>출발터미널 :" + outBusobj[i].startSTN + "</p>"
                    + "<p>도착터미널 :" + outBusobj[i].endSTN + "</p>"
                    + "<p>총 소요시간 :" + time + "</p>"
                    + '</div>'
            }

            let option = '<option selected value="4">기차</option><option value="5">고속, 시외버스</option>'
            $('#searchOption').html(option)

            $('#findresult').html(str+trainResult)
        }

        $('#applyopt').on('click',(ev)=>{
            let selected = $('option:selected').val()
            if(selected=='검색먼저'){
                return
            }

            switch (selected) {
                case '0':
                    $('#findresult').html(str+bustrain+busonly+subwayonly)
                    break;
                case '1':
                    $('#findresult').html(str+busonly)
                    break;
                case '2':
                    $('#findresult').html(str+subwayonly)
                    break;
                case '3':
                    $('#findresult').html(str+bustrain)
                    break;
                case '4':
                    $('#findresult').html(str+trainResult)
                    break;
                case '5':
                    $('#findresult').html(str+expbusResult)
                    break;
                default:
                    break;
            }
            

        })

// 도시내 길찾기 (시내버스나 지하철)
        let busonly ='', subwayonly ='', bustrain = '';
        function findPathCityIn(result) {
            if (result.error !== undefined) {
                shoeErrMsg(result.error.code, result.error.msg)
            }

            busonly ='';
            subwayonly ='';
            bustrain = '';
            str = "<p>버스만 이용 :" + result.result.busCount + "개</p>" +
                "<p>지하철만 이용 :" + result.result.subwayCount + "개</p>" + "<p>버스, 지하철 이용 :" + result.result.subwayBusCount + "개</p>";
            pathArr = result.result.path;
            for (let i = 0; i < pathArr.length; i++) {
                



                let distance = pathArr[i].info.totalDistance / 1000 + "km"
                let time = Math.floor(pathArr[i].info.totalTime / 60) + "시간 " + pathArr[i].info.totalTime % 60 + "분"
                let tmpStr = '<div class="box">'
                    + "<p>총 요금 :" + pathArr[i].info.payment + "</p>"
                    + "<p>버스 환승 횟수 :" + pathArr[i].info.busTransitCount + "</p>"
                    + "<p>지하철 환승 횟수 :" + pathArr[i].info.subwayTransitCount + "</p>"
                    + "<p>출발점 :" + pathArr[i].info.firstStartStation + "</p>"
                    + "<p>도착점 :" + pathArr[i].info.lastEndStation + "</p>"
                    + "<p>총 이동 거리 :" + distance + "</p>"
                    + "<p>총 소요시간 :" + time + "</p>"
                    + '</div>';
                
                    let option = '<option selected value="0">전체</option><option value="1">버스</option><option value="2">지하철</option><option value="3">버스+지하철</option>'
                    $('#searchOption').html(option)
                switch(pathArr[i].pathType){
                    case 1 : subwayonly += tmpStr; break;
                    case 2 : busonly += tmpStr; break;
                    case 3 : bustrain += tmpStr; break;
                }
            }


            $('#findresult').html(str+bustrain+busonly+subwayonly)
        }
