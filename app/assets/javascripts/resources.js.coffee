# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('document').ready ->
  token = $('meta[name="csrf-token"]').attr('content')
  hidden_csrf = $.find("input:hidden[name=\"authenticity_token\"]")
  console.log(hidden_csrf)
  $(hidden_csrf).attr('value', token)