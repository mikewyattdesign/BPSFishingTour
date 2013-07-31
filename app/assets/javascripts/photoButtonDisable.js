$(document).on('page:load ready', function(){
    $("input:file").change(function() {
        if ($("input:file").val() != "")
        {
            $("input[type='submit']").attr('disabled',false).removeClass('disabled');
        }
        else
        {
            $("input[type='submit']").attr('disabled',true).addClass('disabled');
        }
});
});
