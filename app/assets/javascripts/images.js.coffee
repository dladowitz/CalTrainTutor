image_results = null;
current_index = 0;

window.set_image = ->
  unless image_results
    return false;

  url = image_results[current_index].url
#  console.log url;
  $('#main-image').attr('src', url).addClass('open')
  $('#lesson_image_url').attr('value', url)

  current_index++;

window.get_images = ->
  $.ajax {
      url: 'https://ajax.googleapis.com/ajax/services/search/images'
      dataType: "jsonp"
      data: {
        v: "1.0",
        rsz: '8',
        q: $('#lesson_title').val(),
        safe: 'active'
      }
      success: (data)->
#        console.log 'success!', this, arguments
        image_results = data.responseData.results
        set_image();
    }

$(document).on 'change', '#lesson_title', ()->
#  console.log 'change', this, arguments
  get_images();
  false

$(document).on 'click',  '#main-image', ()->
  set_image()
  false



#$("#new_lesson").validate();

