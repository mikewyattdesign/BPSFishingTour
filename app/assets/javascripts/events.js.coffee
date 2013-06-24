events = ->
    activateDivisions = ->
        division = $(this).find('.active').attr 'data-division'
        $('.bassEventAttendBackground').removeClass 'active-event'
        $("[data-division*=#{division}]").addClass 'active-event'
    activateDivisions.call($('.carousel'))
    $('.carousel').carousel(interval: false)

    $('body').on 'slid', '.carousel', activateDivisions

$(document).on 'ready page:load', events