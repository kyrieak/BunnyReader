# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  options = $('#bg_options').find('option')

  for opt in options
    label = $(opt).data('bg_label')
    bg_id = $(opt).attr('value')
    img_src = "/bg_thumbs/sm_" + label + ".jpg"
    $('#bg_tile').append("<img data-label=\"" + label + "\" src=\"" + img_src + "\"/>")

  bg_thumbs = $.find("#bg_tile img")

  for thumb in bg_thumbs
    $(thumb).load ->
      $(this).on("click", (e) ->
        label = $(this).data("label")
        img_src = "/bg_tiles/full_" + label + ".jpg"
        console.log(img_src)
        $("body").css("background", "url(\"" + img_src + "\") repeat fixed")
      )