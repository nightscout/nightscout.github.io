
autolink_header = ( ) ->
  $('H1, H2, H3, H4, H5, H6').filter('[id]').each (i, v) ->
    el   = $(@)
    val  = '#' + el.attr('id')
    link = $('<A>').attr({name: val, href: val}).addClass('permalink autolink').append(
           $('<SPAN>').addClass('icon-link xxfa-anchor').text(' '))
    el.addClass('autolink header').prepend(link) 
$(document).ready(autolink_header)

