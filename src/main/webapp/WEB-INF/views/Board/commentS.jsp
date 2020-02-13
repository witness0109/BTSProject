<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    
 
<script>
var seq = '${detail.seq}'; //게시글 번호
 
$('#commentInsertBtn').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('#commentInsertForm').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : './replylist',
        type : 'get',
        data : {'seq':seq},
        success : function(data){
            var a =''; 
           for(var i=0;i<data.length;i++){
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+data[i].rno+'">'+'댓글번호 : '+data[i].rno+' / 작성자 : '+data[i].writer;
                if(data[i].writer == $('#lid').val()){
                a += '<a onclick="commentUpdate('+data[i].rno+',\''+data[i].contents+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+data[i].rno+');"> 삭제 </a>';
                }
                a += '<div class="commentContent'+data[i].rno+'"> <p> 내용 : '+data[i].contents +'</p>';
                a += '</div></div></div>';
            
       		}
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : './replyinsert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('#contents').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(rno, contents){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" id="content_'+rno+'" value="'+contents+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+rno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+rno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(rno){
    var updateContent = $('#content_'+rno).val();
    
    $.ajax({
        url : './replyupdate',
        type : 'post',
        data : {'contents' : updateContent, 'rno' : rno},
        success : function(data){
            if(data == 1) commentList(seq); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(rno){
    $.ajax({
        url : './replydelete/',
        type : 'post',
        data : {'rno' : rno},
        success : function(data){
            if(data == 1) commentList(seq); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>