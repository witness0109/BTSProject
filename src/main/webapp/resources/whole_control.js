

var s_id = "system";
var parent = document.getElementById('parent');
var user_son = document.getElementById('son');

if(id == s_id){

	parent.removeChild(user_son);
	
	parent.innerHTML +=
		'<li class="sub-menu" id="son"><a href="./manageMember"><i class="fa fa-user-circle">'+
		'</i><span>회원 관리</span><i class="arrow fa fa-angle-right pull-right"></i></a></li>';

	
}






