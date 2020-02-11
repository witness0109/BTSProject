$('#train_tm').on('click',function (ev) {
   $.ajax({
        url : "./train_search",
        contentType : 'text/html;charset=UTF-8',
        success : function (result) {
            var dom = result.split("<body>")[1].split("</body>")[0]
            $('#leftside').html(dom)
        },
        error : function (e) {
            alert(e);
        }
        
   });
});