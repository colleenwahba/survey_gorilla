$(function(){
  $('#add-option').on('click', function() {
  $('#options').append(
  	'Option:<input type="text" name="option_text[]"><br>')
  })
})