$(document).on 'click', '#image_me', ()->
  console.log 'click', this, arguments
#  $.ajax {
#    url: 'https://www.googleapis.com/customsearch/v1'
##    url: 'https://ajax.googleapis.com/ajax/services/search/images'
#    data: {
#      v: "1.0",
#      rsz: '8',
#      q: 'spain',
#      safe: 'active'
#      key: 'AIzaSyBBfQWFFtvFGXa8DJ6FkPW8biT8dp7OFJA'
#      cx: '017576662512468239146:omuauf_lfve'
##      q: 'lectures'
#      searchType: 'image'
#    }
#    success: ()->
#      console.log 'success!', this, arguments
#  }
#  false
#

  $.getJSON "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=58b0c3d8f32066e7a3328a4104794307&tags=flower&per_page=3", {format: 'json'},
    (data) ->
      console.log(this, arguments)


window.jsonFlickrApi = ()->
  console.log this, arguments