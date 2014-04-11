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

  # trigger search form
    $('span.search_button').click ->
      $('#posts_search').submit()


  # toggle input field width
  # $("#autocomplete_search").blur ->
  #   value = $(this).val()
  #   if value.length > 0
  #     $(this).css
  #       'transition': '0.4s',
  #       'width': '240px'
  #   else
  #     $(this).css
  #       'transition': '0.4s',
  #       'width': '150px'

  # $("#autocomplete_search").focus ->
  #   $(this).css
  #     'transition': '0.4s',
  #     'width': '240px'


# $(window).load ->
#   if $("#autocomplete_search").val().length > 0
#     $("#autocomplete_search").css
#       'width': '240px'