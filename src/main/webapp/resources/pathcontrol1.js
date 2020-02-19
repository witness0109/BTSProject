var pathArr;
const findpath_apiurl = 'https://api.odsay.com/v1/api/searchPubTransPathR';
const findpath_realtime = './findapi/findpath';// need to change addr
const findoutpath = './findapi/findoutpath';// need to change addr
const foldingdivdom = '<div  class="folding" onClick="foldDiv(this)">경로 펼치기</div>'
const opendivdom = '<div  class="folding" onClick="openPathWindow(this)">상세경로</div>'

// api data setting
function setData() {
    return {
        sx: startingMarker.getPosition().Ga,
        sy: startingMarker.getPosition().Ha,
        ex: destMarker.getPosition().Ga,
        ey: destMarker.getPosition().Ha
    };
}


// 시내길찾기 버튼
$('#findpath').on('click', (e) => {
    if (startingMarker == undefined || destMarker == undefined) {
        alert('먼저 출발지와 도착지를 모두 설정해 주세요')
        return
    }
    let data0 = setData();
    $.ajax({
        url: findpath_realtime,
        data: data0,
        type: 'get',
        datatype: 'json',
        success: (r) => findPathCityIn(r),
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
        url: findoutpath,
        data: data1,
        type: 'get',
        datatype: 'json',
        success: (r) => {//시외 검색
            
            findPathCityOut(r)
        },
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
let trainResult = '';
let expbusResult = '';
var str = '';
function findPathCityOut(result) {
    if (result.error !== undefined) {
        shoeErrMsg(result.error.code, result.error.msg)
        return;
    }

    var trainpath = result.result.trainRequest;
    var expBuspath = result.result.exBusRequest;
    var outBuspath = result.result.outBusRequest;


    str = "<div class='box'><p>출발 도시 : " + result.result.startCityName + "</p>" + "<p>도착 도시 : " + result.result.endCityName + "</p>" 
    + "<p>총 결과 : " + result.result.totalCount + "개</p>" +
        "<p>기차 이용 : " + trainpath.count + "개</p>" + "<p>고속버스, 시외버스 이용 : " + (expBuspath.count + outBuspath.count) + "개</p></div>";

    let trainobj = trainpath.OBJ;
    trainResult = '';
    expbusResult = '';

    // 기차 계산
    for (let i = 0; i < trainpath.count; i++) {
            let trainst = result.innerpath.ts;
            let trainend = result.innerpath.te;
            let time = Math.floor(trainobj[i].time / 60) + "시간 " + trainobj[i].time % 60 + "분"
            let midstring = "<p>요금 : " + Number(trainobj[i].payment).toLocaleString('en')+"원</p>"
                    + "<p>기차 종류 : " + trainobj[i].trainType + "</p>"
                    + "<p>출발터미널 : " + trainobj[i].startSTN + "</p>"
                    + "<p>도착터미널 : " + trainobj[i].endSTN + "</p>"
                    + "<p>총 소요시간 : " + time + "</p>";
            trainResult += makePathBox(trainst, trainend, trainobj[i], midstring, 'train')

    }
    // 고속버스 계산
    let expbusobj = expBuspath.OBJ;
    for (let i = 0; i < expBuspath.count; i++) {

        let expbusst = result.innerpath.es;
        let expbusend = result.innerpath.ee;
        let time = Math.floor(expbusobj[i].time / 60) + "시간 " + expbusobj[i].time % 60 + "분"
        let midstring = "<p>요금 : " + Number(expbusobj[i].payment).toLocaleString('en')+"원</p>"
        + "<p>버스 종류 : 고속버스</p>"
        + "<p>출발터미널 : " + expbusobj[i].startSTN + "</p>"
                + "<p>도착터미널 : " + expbusobj[i].endSTN + "</p>"
                + "<p>총 소요시간 : " + time + "</p>";
                expbusResult += makePathBox(expbusst, expbusend, expbusobj[i], midstring, 'expbus')

    }
    // 시외버스 계산
    let outBusobj = outBuspath.OBJ;
    for (let i = 0; i < outBusobj.length; i++) {

        let outbusst = result.innerpath.os;
        let outbusend = result.innerpath.oe;
        let time = Math.floor(outBusobj[i].time / 60) + "시간 " + outBusobj[i].time % 60 + "분"
        let midstring = "<p>요금 : " + Number(outBusobj[i].payment).toLocaleString('en')+"원</p>"
            + "<p>버스 종류 : 시외버스</p>"
            + "<p>출발터미널 : " + outBusobj[i].startSTN + "</p>"
            + "<p>도착터미널 : " + outBusobj[i].endSTN + "</p>"
            + "<p>총 소요시간 : " + time + "</p>";
        expbusResult += makePathBox(outbusst, outbusend, outBusobj[i], midstring, 'expbus')

    }

    let option ='전체<input type="radio" class="pathradio" name="opt" checked value="7"><br>기차<input type="radio"  class="pathradio" name="opt" value="4"><br>고속, 시외버스<input type="radio"  class="pathradio" name="opt" value="5">'
    $('#searchOption').html(option)
    $('#searchOption').addClass('box')
    $('#findbox').html(str)
    $('#findresult').html(trainResult+expbusResult)
    addRadioEvent()
    ////// 시내구간추가 시작

    traindivs = $('.box.train');
    busdivs = $('.box.expbus');
    

}

function addRadioEvent(){
    $("input:radio[name=opt]").on('click', (ev) => {

        switch ($("input[name=opt]:checked").val()) {
            case '0':
                $('#findresult').html( bustrain + busonly + subwayonly)
                break;
            case '1':
                $('#findresult').html( busonly)
                break;
            case '2':
                $('#findresult').html(subwayonly)
                break;
            case '3':
                $('#findresult').html(bustrain)
                break;
            case '4':
                $('#findresult').html(trainResult)
                break;
            case '5':
                $('#findresult').html( expbusResult)
                break;
            default:
                $('#findresult').html( trainResult  + expbusResult)
                break;
        }
    
    
    
    
    })
    
}

// 도시내 길찾기 (시내버스나 지하철)
let busonly = '', subwayonly = '', bustrain = '';
function findPathCityIn(result) {
    if (result.error !== undefined) {
        shoeErrMsg(result.error.code, result.error.msg)
    }
    if (result.result.searchType == 1) {
        $('#findresult').html('결과 없음')
        return;
    }

    busonly = '';
    subwayonly = '';
    bustrain = '';
    str = "<div class='box'><p>버스만 이용 : " + result.result.busCount + "개</p>" +
        "<p>지하철만 이용 : " + result.result.subwayCount + "개</p>" +
        "<p>버스, 지하철 이용 : " + result.result.subwayBusCount + "개</p></div>";
    pathArr = result.result.path;
    for (let i = 0; i < pathArr.length; i++) {

        let subpathList = pathArr[i].subPath;
        let isreal = false;
        let cango = true;

        let distance = pathArr[i].info.totalDistance / 1000 + "km"
        
        let tmpStr = addsubpath(subpathList,pathArr[i]);

        switch (pathArr[i].pathType) {
            case 1: subwayonly += tmpStr; break;
            case 2: busonly += tmpStr; break;
            case 3: bustrain += tmpStr; break;
        }
    }

    let option = '전체<input type="radio" class="pathradio" name="opt" checked value="0"><br>버스<input type="radio" name="opt" value="1"  class="pathradio"><br>지하철<input type="radio" name="opt" value="2"  class="pathradio"><br>버스+지하철<input type="radio" name="opt" value="3" class="pathradio">'
    $('#searchOption').html(option)
    $('#searchOption').addClass('box')
    $('#findbox').html(str)
    $('#findresult').html(bustrain + busonly + subwayonly)
    addRadioEvent()
    return str + bustrain + busonly + subwayonly;
}

function foldDiv(ev) {
    ev.innerText = (ev.innerText == '경로 펼치기') ? '접기' : '경로 펼치기'
    var nextdiv = ev.nextSibling
    nextdiv.style.display = (nextdiv.style.display == 'none' || nextdiv.style.display == '') ? 'block' : 'none';//펼칠떄 초기값은 ''
}

function addsubpath(subpathList,path) {
    var cango = true, isreal = false;
    var subresult = '';
    //서브패스 넣는 자리
    let passList, laneList;
    for (let j = 0, x = subpathList.length; j < x; j++) {
        const subpath = subpathList[j];//트래픽타입 1 = 지하철, 2 = 버스, 3= 도보(거리랑 시간만 나옵니다.)
        var subt = foldingdivdom + '<div class="subpath2">';



        switch (subpath.trafficType) {
            case 1:
                passList = subpath.passStopList.stations
                laneList = subpath.lane

                for (let p = 0; p < laneList.length; p++) {
                    subt += '<p>노선 : ' + subpath.lane[p].name + '</p>'
                    if (isreal === false) {
                        if(subpath.lane[p].arrmsg1!=undefined){
                            path.info.totalTime += Math.floor(subpath.lane[p].arrmsg1 / 60);//실시간 적용
                            console.log(subpath.lane[p].arrmsg1)
                            let time = Math.floor(subpath.lane[p].arrmsg1 / 60) + "분 " + subpath.lane[p].arrmsg1 % 60 + "초"
                            subt += '<p>' + time + ' 후 도착 예정</p>'
                            subt += '<p>도착 예정 시간 : ' + String(subpath.lane[p].subwayarrtime).substring(0, 2) + '시 ' + String(subpath.lane[p].subwayarrtime).substring(2, 4) + '분' + '</p>'
                        }else{
                            subt += '<p>도착 정보 없음</p>'
                        }
 
                        isreal = true;
                    }
                }
                subt += '<p>지하철 이동 거리 ' + subpath.distance + 'm</p>'
                subt += '<p>지하철 이동 시간 : ' + subpath.sectionTime + '분</p>'
                subt += '<p>역 이동 개수 : ' + subpath.stationCount + '</p>'

                subt += '<p>출발역 ' + subpath.startName + '역 '
                if (subpath.startExitNo != undefined) {
                    subt += subpath.startExitNo + '번 출구'
                }
                subt += '</p>'
                subt += '<p>도착역 ' + subpath.endName + '역 '
                if (subpath.endExitNo != undefined) {
                    subt += subpath.endExitNo + '번 출구</p>'
                }
                subt += '</p>'
                subt += foldingdivdom
                subt += '<div class="passStopList">'
                for (let p = 0; p < passList.length; p++) {
                    if (p != passList.length - 1) {
                        subt += '<p>' + passList[p].stationName + '</p><p> ↓ </P>'
                    } else {
                        subt += '<p>' + passList[p].stationName + '</p>'
                    }
                }
                subt += '</div>'
                break;
            case 2:
                passList = subpath.passStopList.stations
                laneList = subpath.lane
                let mintime = 9999999;
                let minbus = [];
                if (isreal === false) {
                    for (let p = 0, x = laneList.length; p < x; p++) {
                        if (mintime > subpath.lane[p].arrmsg1) {
                            minbus = [];
                            minbus.push(subpath.lane[p].busNo);
                            continue;
                        }
                        if (mintime == subpath.lane[p].arrmsg1) {
                            minbus.push(subpath.lane[p].busNo);
                            continue;
                        }
                    }
                }
                isreal = true;
                var recommendbus = '', alternatebus = '', ischeck = false;
                for (let p = 0, x = laneList.length; p < x; p++) {
                    if (subpath.lane[p].arrmsg1 < 0) {
                        continue;
                    }
                    if( subpath.lane[p].arrmsg1 == undefined){
                        alternatebus += '<p>버스 번호 : ' + subpath.lane[p].busNo + '</p>'
                        alternatebus += '<p>도착 예정 정보 없음</p>'
                        continue;
                    }
                    if (minbus.includes(subpath.lane[p].busNo)) {
                        recommendbus += '<p>추천 버스 번호 : ' + subpath.lane[p].busNo + '</p>'
                        if (!ischeck) {
                            path.info.totalTime += Math.floor(subpath.lane[p].arrmsg1 / 60);//실시간 적용
                        }
                        console.log(subpath.lane[p].arrmsg1)
                        let time = Math.floor(subpath.lane[p].arrmsg1 / 60) + "분 " + subpath.lane[p].arrmsg1 % 60 + "초"
                        recommendbus += '<p>' + time + ' 후 도착 예정</p>'
                    } else {
                        alternatebus += '<p>버스 번호 : ' + subpath.lane[p].busNo + '</p>'
                        console.log(subpath.lane[p].arrmsg1)
                        let time = Math.floor(subpath.lane[p].arrmsg1 / 60) + "분 " + subpath.lane[p].arrmsg1 % 60 + "초"
                        alternatebus += '<p>' + time + ' 후 도착 예정</p>'
                    }

                }
                if (recommendbus.length + alternatebus.length == 0) {
                        return '';
                }
                subt += recommendbus;
                if (alternatebus != '') {
                    subt += '대체 버스 목록 <br>' + alternatebus + '<br>'
                }
                subt += '<p>버스 이동 거리 ' + subpath.distance + 'm</p>'
                subt += '<p>버스 이동 시간 : ' + subpath.sectionTime + '분</p>'
                subt += '<p>정류장 이동 개수 : ' + subpath.stationCount + '</p>'
                subt += '<p>출발 정류장 ' + subpath.startName + '</p>'
                subt += '<p>도착 정류장 ' + subpath.endName + '</p>'
                subt += foldingdivdom
                subt += '<div class="passStopList">'
                for (let p = 0; p < passList.length; p++) {
                    if (p != passList.length - 1) {
                        subt += '<p>' + passList[p].stationName + '</p><p> ↓ </P>'
                    } else {
                        subt += '<p>' + passList[p].stationName + '</p>'
                    }
                }
                subt += '</div>'
                break;

            case 3:
                subt += '<p>도보 이동 거리 : ' + subpath.distance + 'm</p>'
                subt += '<p>도보 이동 시간 : ' + subpath.sectionTime + '분</p>'
                if (j == 0) {
                    subt += '<p>도착 : ' + subpathList[1].startName + '</p>'
                } else if (j == subpathList.length - 1) {
                    subt += '<p>출발 : ' + subpathList[j - 1].endName + '</p>'
                } else {
                    subt += '<p>출발 : ' + subpathList[j - 1].endName + '</p>'
                    subt += '<p>도착 : ' + subpathList[j + 1].startName + '</p>'
                }

                break;
        }
        if (!cango) {
            break;
        }
        subt += '</div>'
        subresult += subt;
    }
    
    let time = Math.floor(path.info.totalTime / 60) + "시간 " + path.info.totalTime % 60 + "분"
    var tmpStr = '<div class="box" onclick="callMapInCity(\''+path.info.mapObj+'\',event);">'
        + "<p>총 요금 : " + Number(path.info.payment).toLocaleString('en') + "원</p>";
    if (path.info.busTransitCount != 0) {
        tmpStr += "<p>버스 환승 횟수 : " + path.info.busTransitCount + "</p>"
    }
    if (path.info.subwayTransitCount != 0) {
        tmpStr += "<p>지하철 환승 횟수 : " + path.info.subwayTransitCount + "</p>"
    }
    if(path.info.trafficDistance>1000){
        path.info.trafficDistance = path.info.trafficDistance/1000+" k";
    }else{
        path.info.trafficDistance = path.info.trafficDistance;
    }
    tmpStr += "<p>출발점 : " + path.info.firstStartStation + "</p>"
        + "<p>도착점 : " + path.info.lastEndStation + "</p>"
        + "<p>총 이동 거리 : " + path.info.trafficDistance + "m</p>"
        + "<p>총 소요시간 : " + time + "</p>"
        + foldingdivdom + '<div class="subpath1">' + subresult;


    tmpStr += '</div></div>';

    return tmpStr
}

function openPathWindow(ev){
    var nextdiv = ev.nextSibling.outerHTML;
    var wnd = window.open("", "new window", "width=500,height=600");  
    wnd.document.write("<html><head><title>버스-트레인-서브웨이</title><link rel='stylesheet' href='./resources/pathbox.css'></head><body id='openbg'><div>"+nextdiv+"</div>"+
    "<script>function foldDiv(ev){ev.innerText = (ev.innerText == '경로 펼치기') ? '접기' : '경로 펼치기';"
    +"var nextdiv = ev.nextSibling;"
    +"nextdiv.style.display = (nextdiv.style.display == 'none' || nextdiv.style.display == '') ? 'block' : 'none';}</script></body></html>");
    wnd.document.getElementsByClassName("subpath1")[0].style.display = "block"  
}