$(document).ready ->
  $('.col-sm-12').click ->
    $.get($(this).attr("value"), (data) ->
        $("#area").html(data)
      )
    console.log($(this).attr("value"))
