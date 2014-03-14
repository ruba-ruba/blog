$ ->
  # close flash message 
  $('a.close').click ->
    $('.flash').fadeOut('500')

  # blablalblalf
  $("#posts_search input").keyup ->
    $.get $("#posts_search").attr("action"), $("#posts_search").serialize(), null, "script"
    false

  #autocomplete search
  $("#autocomplete_search").autocomplete
    source: '/autocomplete'


  #posts roller
#   $('.next_post').click ->
#     post = $(this).parent()
#     post.hide()
#     post.next().show()
#   $('.prev_post').click ->
#     post = $(this).parent()
#     post.hide()
#     post.prev().show()

  #paly with posts
# $(window).load ->
#   $('.posts > div').first().show();
#   return

  $("#autocomplete_search").blur ->
    value = $(this).val()
    if value.length > 0
      $(this).css
        'transition': '0.4s',
        'width': '240px'
    else
      $(this).css
        'transition': '0.4s',
        'width': '150px'

  $("#autocomplete_search").focus ->
    $(this).css
      'transition': '0.4s',
      'width': '240px'


