jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_movies_url = $('.pagination .next_page a').attr('href')
      if more_movies_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
          $('.pagination').html('<img class="loader" src="/assets/ajax-loader.gif"/>')
          $.getScript more_movies_url
      return
    return