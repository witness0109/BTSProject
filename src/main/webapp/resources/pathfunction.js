function makePathBox(start, end, obj, midString, classtype) {
    let totalTime = obj.time;//전체 소요 시간
    let totalPay = obj.payment;//전체 요금

    let time = Math.floor(obj.time / 60) + "시간 " + obj.time % 60 + "분"
    let result = '<div class="box '+classtype+'"><div class="pathborder"><h6>출발지로 가는길</h6>';
    result += opendivdom + '<div class="subpath1">';
    let stp;
    for (let p = 0, x = start.length; p < x; p++) {
        const stname = start[p].name;
        if (stname == obj.startSTN) {
            stp = start[p].path.result.path[0];
            result
                += addsubpath(stp.subPath, stp);
            totalTime += stp.info.totalTime;//출발지까지 가는 시간
            totalPay += stp.info.payment;//출발지까지 가는 요금
        }

    }
    result += "</div></div>"
    result += midString
    result += '<div class="pathborder"><h6>도착지로 가는길</h6>' + opendivdom + '<div class="subpath1">';
    let endp;
    for (let p = 0, x = end.length; p < x; p++) {
        const endname = end[p].name;
        if (endname == obj.endSTN) {
            endp = end[p].path.result.path[0];
            totalTime += endp.info.totalTime;//도착지까지 가는 시간
            totalPay += endp.info.payment;//도착지까지 가는 요금
            result
                += addsubpath(endp.subPath, endp);
        }

    }

    totalTime = Math.floor(totalTime / 60) + "시간 " + totalTime % 60 + "분"
    result += '</div></div>' + '<br><p>전체 소요 시간 : ' + totalTime + '</p>'
        + '<p>전체 요금: ' + Number(totalPay).toLocaleString('en') + "원</p>"
        + '</div>'

    return result;
}