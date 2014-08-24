$ ->
  # close flash message 
  $('a.close').click ->
    $('.flash').fadeOut('500')

  $("#posts_search input").keyup ->
    data = $.get $("#posts_search").attr("action"), $("#posts_search").serialize(), null, "script"
    false

  #autocomplete search
  $("#autocomplete_search").autocomplete
    source: '/autocomplete'

  #trigger search form
  $('span.search_button').click ->
    $('#posts_search').submit()


  # toggle input field width
  $("#autocomplete_search").blur ->
    value = $(this).val()
    if value.length > 0
      $(this).css
        'transition':'0.4s',
        # 'width':'200px',
        # 'background-color':'white'
    else
      $(this).css
        'transition':'0.4s',
        # 'width':'150px',
        # 'background-color':'#666'

  $("#autocomplete_search").focus ->
    $(this).css
      'transition': '0.4s',
      # 'width': '200px',
      # 'background-color':'white'

  # # set height for sidebar eq to posts div
  # height = $('.main').outerHeight()
  # $('.menu').css
  #   'height':height+'px'

  # logo to home
  $('.hexagon-in2').click ->
    window.location = '/'




$(window).load ->
  if ($("#autocomplete_search").val() && $("#autocomplete_search").val().length > 0)
    $("#autocomplete_search").css
      # 'width': '200px'
      # 'background-color':'white'