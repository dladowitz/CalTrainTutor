image_results = null;
current_index = 0;

window.set_image = ->
  unless image_results
    return false;

  url = image_results[current_index].url

  unless url
    return false

  $('#image_hud').html('Loading')

  $(new Image()).load(() ->
#      $(this).css({display: 'none', id: 'main-image'}) # .hide() doesn't work in Safari when the element isn't on the DOM already
#      $(this).hide();
      $('#image_hud').html('').append(this);
      $(this).fadeIn();
  ).error( () ->
      $('#image_hud').html('Failed. Try another.')
  ).attr({src: url, id: 'main-image'});

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
  image_results = null;
  get_images();
  false

$(document).on 'click',  '#main-image', ()->
  set_image()
  false



#$("#new_lesson").validate();



$(document).on 'focus', '.overlabel input', (e)->
  $(e.currentTarget).closest('.overlabel').find('label').hide()