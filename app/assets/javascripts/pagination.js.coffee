jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_movies_url = $('.pagination .next_page a').attr('href')
      if more_movies_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
          $('.loader').remove();
          $('#infinite-scrolling').after().append('<div class="loader"><img src="/assets/ajax-loader.gif"/></div>')
          $.getScript more_movies_url
      return
    return