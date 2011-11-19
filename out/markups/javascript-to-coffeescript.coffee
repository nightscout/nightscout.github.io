(($) ->
  $.fn.highlight = ->
    $(this).css 
      color: "red"
      background: "yellow"
    
    $(this).fadeIn()
) jQuery