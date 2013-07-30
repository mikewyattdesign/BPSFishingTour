$(document).ready(function(){
    $("input:file").change(function() {
            $("input[type='submit']").attr('disabled',false).removeClass('disabled');
});
});
