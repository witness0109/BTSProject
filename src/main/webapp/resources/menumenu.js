$('#train_TM').on('click',function (ev) {
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

$('#intercityBusTM').on('click',function (ev) {
    $.ajax({
         url : "./intercityBus",
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

 $('#expressBusTM').on('click',function (ev) {
    $.ajax({
         url : "./expressBus",
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

 $('#busTM').on('click',function (ev) {
    $.ajax({
         url : "./bus_search2",
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