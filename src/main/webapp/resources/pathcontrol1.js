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
            if(result.result.searchType == 1){
                $('#findresult').html('결과 없음')
                return;
            }

            busonly ='';
            subwayonly ='';
            bustrain = '';
            str = "<p>버스만 이용 :" + result.result.busCount + "개</p>" +
                "<p>지하철만 이용 :" + result.result.subwayCount + "개</p>" + "<p>버스, 지하철 이용 :" + result.result.subwayBusCount + "개</p>";
            pathArr = result.result.path;
            for (let i = 0; i < pathArr.length; i++) {
                
                let subpathList = pathArr[i].subPath;



                let distance = pathArr[i].info.totalDistance / 1000 + "km"
                let time = Math.floor(pathArr[i].info.totalTime / 60) + "시간 " + pathArr[i].info.totalTime % 60 + "분"
                let foldingdivdom = '<div  class="folding" onClick="foldDiv(this)">경로 펼치기</div>'
                var tmpStr = '<div class="box">'
                    + "<p>총 요금 :" + pathArr[i].info.payment + "</p>"
                    + "<p>버스 환승 횟수 :" + pathArr[i].info.busTransitCount + "</p>"
                    + "<p>지하철 환승 횟수 :" + pathArr[i].info.subwayTransitCount + "</p>"
                    + "<p>출발점 :" + pathArr[i].info.firstStartStation + "</p>"
                    + "<p>도착점 :" + pathArr[i].info.lastEndStation + "</p>"
                    + "<p>총 이동 거리 :" + distance + "</p>"
                    + "<p>총 소요시간 :" + time + "</p>"
                    + foldingdivdom+'<div id="subpath1">'
                    //서브패스 넣는 자리
                    let passList, laneList;
                    for (let j = 0; j < subpathList.length; j++) {
                        const subpath = subpathList[j];//트래픽타입 1 = 지하철, 2 = 버스, 3= 도보(거리랑 시간만 나옵니다.)
                        var subt = foldingdivdom+'<div id="subpath2">';
                        
                        switch(subpath.trafficType){
                            case 1 : 
                                passList = subpath.passStopList.stations
                                laneList = subpath.lane
                                
                                for(let p=0;p<laneList.length;p++){
                                    subt+='<p>전철 노선 : '+ subpath.lane[p].name+ '</p>'
                                }         
                                subt+='<p>지하철 이동 거리 '+subpath.distance+ 'm</p>'
                                subt+='<p>지하철 이동 시간 : '+subpath.sectionTime+ '분</p>'
                                subt+='<p>역 이동 개수 : '+subpath.stationCount+ '</p>'
                                subt+='<p>출발역 '+subpath.startName+'역 '
                                if(subpath.startExitNo!=undefined){
                                    subt+=subpath.startExitNo+'번 출구'
                                }
                                subt+='</p>'
                                subt+='<p>도착역 '+subpath.endName+'역 '
                                if(subpath.endExitNo!=undefined){
                                    subt+=subpath.endExitNo+'번 출구</p>'
                                }
                                subt+='</p>'
                                subt+= foldingdivdom
                                subt+= '<div id="passStopList">'
                                    for(let p=0;p<passList.length;p++){
                                        if(p!=passList.length-1){
                                            subt+='<p>'+ passList[p].stationName +'</p><p> ↓ </P>'
                                        }else{
                                            subt+='<p>'+ passList[p].stationName +'</p>'
                                        }
                                    }
                                    subt+='</div>'
                            break;
                            case 2 : 
                                passList = subpath.passStopList.stations
                                laneList = subpath.lane
                                for(let p=0;p<laneList.length;p++){
                                    subt+='<p>버스 번호 : '+ subpath.lane[p].busNo+ '</p>'
                                }                                
                                subt+='<p>버스 이동 거리 '+subpath.distance+ 'm</p>'
                                subt+='<p>버스 이동 시간 : '+subpath.sectionTime+ '분</p>'
                                subt+='<p>정류장 이동 개수 : '+subpath.stationCount+ '</p>'
                                subt+='<p>출발 정류장 '+subpath.startName+'</p>'
                                subt+='<p>도착 정류장 '+subpath.endName+'</p>'
                                subt+= foldingdivdom
                                subt+= '<div id="passStopList">'
                                    for(let p=0;p<passList.length;p++){
                                        if(p!=passList.length-1){
                                            subt+='<p>'+ passList[p].stationName +'</p><p> ↓ </P>'
                                        }else{
                                            subt+='<p>'+ passList[p].stationName +'</p>'
                                        }
                                    }
                                    subt+='</div>'
                            break;
                            
                            case 3 : 
                            subt+='<p>도보 이동 거리 : '+subpath.distance+'m</p>'
                            subt+='<p>도보 이동 시간 : '+subpath.sectionTime+'분</p>'
                                if(j==0){
                                    subt+='<p>도착 : ' + subpathList[1].startName+'</p>'
                                }else if(j==subpathList.length-1){
                                    subt+='<p>출발 : ' + subpathList[j-1].endName+'</p>'
                                }else{
                                    subt+='<p>출발 : ' + subpathList[j-1].endName+'</p>'
                                    subt+='<p>도착 : ' + subpathList[j+1].startName+'</p>'
                                }
            
                            break;
                        }
                        subt+='</div>'
                        tmpStr+=subt;
                    }
                    
                    tmpStr+= '</div></div></div>';
                
                    
                switch(pathArr[i].pathType){
                    case 1 : subwayonly += tmpStr; break;
                    case 2 : busonly += tmpStr; break;
                    case 3 : bustrain += tmpStr; break;
                }
            }
                    let option = '<option selected value="0">전체</option><option value="1">버스</option><option value="2">지하철</option><option value="3">버스+지하철</option>'
                    $('#searchOption').html(option)

            $('#findresult').html(str+bustrain+busonly+subwayonly)
        }

        
        function foldDiv(ev){
            ev.innerText = (ev.innerText=='경로 펼치기')?'접기':'경로 펼치기'
            var nextdiv = ev.nextSibling
            nextdiv.style.display=(nextdiv.style.display=='none' || nextdiv.style.display=='')?'block':'none';//펼칠떄 초기값은 ''
        }
