# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $.ajax(
    type: "GET"
    url: "/feeds"
    dataType: "json"
  ).done((feed_ids) ->
    for id in feed_ids
      t1 = (new Date()).getSeconds(); 

      $.ajax(
        type: "GET"
        url: "/feeds/#{id}"
        data: { "id" : id }
        dataType: "html"
      ).done((content) ->
        $("#area").append(content)
        t2 = (new Date()).getSeconds();
        console.log(t1 - t2)
      )
  )

  # left_feeds = []
  # for feed in $("#left").children(".feed")
  #   left_feeds.push($(feed).data("fid"))

  # right_feeds = []
  # for feed in $("#right").children(".feed")
  #   left_feeds.push($(feed).data("fid"))

  # $(".feed_logo").click (e) ->
  #   e.preventDefault()
  #   fid = $(this).data("fid")
  #   i = left_feeds.indexOf(fid)
  #   if i > -1
  #     tag = $("#left").find(".feed[data-fid=#{fid}]")
  #     pos_top = $(tag).position().top
      
  #     scroll(pos_top)
  #   else
  #     $.ajax(
  #       type: "GET"
  #       url: "/feeds/#{$(this).data("fid")}"
  #     ).done( (data) ->
  #       $("#left").append(data)
  #       left_feeds.push(fid)
  #       tag = $.find(".feed[data-fid=#{fid}]")
  #       pos_top = $(tag).position().top
  #       $("#feed_logo_#{fid}").bind("click", () ->
  #         tag = $.find(".feed[data-fid=#{fid}]")
  #         scroll(pos_top)
  #       )
  #       scroll(pos_top)
  #     )

  # scroll = (pos_top) ->
  #   $('html, body').animate({scrollTop:pos_top}, '300');