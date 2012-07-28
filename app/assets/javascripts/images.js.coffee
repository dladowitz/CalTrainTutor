$(document).on 'click', '#image_me', ()->
  console.log 'click', this, arguments
  $.ajax {
    url: 'https://www.googleapis.com/customsearch/v1'
    data: {
      key: 'AIzaSyBBfQWFFtvFGXa8DJ6FkPW8biT8dp7OFJA'
      cx: '017576662512468239146:omuauf_lfve'
      q: 'lectures'
    }
    success: ()->
      console.log 'success!', this, arguments
  }
  false