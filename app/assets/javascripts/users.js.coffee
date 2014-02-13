# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  
  options = $('#bg_options').find('option')

  for opt in options
    console.log(opt)
    label = $(opt).data('bg_label')
    bg_id = $(opt).attr('value')
    console.log(label + " " + bg_id)

    $('#bg_tile').append("<img src=\"/bg_tiles/tile_sm_" + label + ".jpg\"/>")