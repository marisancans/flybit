# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'change', '#product_department_id', (evt) ->
    $.ajax 'update_categories',
      type: 'GET'
      dataType: 'script'
      data: {
        department_id: $("#product_department_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic department select OK!")


$ ->
  $('#product_image').on 'change', (event) ->
    files = event.target.files
    image = files[0]
    reader = new FileReader

    reader.onload = (file) ->
      img = new Image
      console.log file
      img.src = file.target.result
      $('#target').html img
      return

    reader.readAsDataURL image
    console.log files
  return
return