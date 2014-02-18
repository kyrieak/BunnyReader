# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('document').ready ->
  accent_a = $("#menu_content").data('accent_a')

  $('#menu_content .col-md-1').css('background', 'url(bg_tiles/full_' + accent_a + '.jpg) repeat fixed')

#  theme = combination accent_label, accent2_label, background_label,