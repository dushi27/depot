 $ ->
  $('#post').imagesLoaded ->
    $('#post').masonry
      itemSelector: '.box'
      isFitWidth: true