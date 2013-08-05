$(document).on('ready page:load',function(){
    $('.close').on('click', function() { $(this).parent().hide(); });

    $('.blink').css('color', '#64983e');
    $.fn.blink = function(time) {
        var time = typeof time == 'undefined' ? 200 : time;
        this.hide(0).delay(time).show(0);
    }
    setInterval(function  () {
        $('.blink').blink();
    }, 800)

});