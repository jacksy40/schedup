$('.event_link a').on('load', function(){
  var messageRequest = $.ajax({
    method: 'GET',
    url: '/movies/' + movieId + '/reviews/' + reviewId,
    data: { message: message }
  });

  messageRequest.done(function() {
    $('.event_chatter').text(message);
  });
});
