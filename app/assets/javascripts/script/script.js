$(document).ready(function() {
$(function() {
$("#datepicker").datepicker();
$(function() {
$("#datepicker").datepicker("option", "dateFormat", ("yy-mm-dd"));
    });
  });
});
$( "#showr" ).click(function() {
  $( ".listing" ).first().show( "fast", function showNext() {
    $( this ).next( ".listing" ).show( "fast", showNext );
  });
});

$( window ).load(function() {
  $( ".listing" ).hide();
});

$('.edit a').click(function(e){
  e.preventDefault();
  var number = $(this).attr('name');
  $('.edit-' + number).hide();
  $('.delete-' + number).hide();
  $('.share-' + number).hide();
  $('.task_detail-' + number).hide();
  $('.review-form-' + number).fadeIn();
});

$('.cancel a').click(function(e){
  e.preventDefault();
  var number = $(this).attr('name');
  debugger;
  $('.edit-' + number).fadeIn();
  $('.delete-' + number).fadeIn();
  $('.share-' + number).fadeIn();
  $('.task_detail-' + number).fadeIn();
  $('.review-form-' + number).hide();
});

