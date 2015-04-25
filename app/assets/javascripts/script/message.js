  $(function() {
    $('#new_message').on('ajax:complete', function(e, data, status, xhr){
      $('#message_message').val('');
        var mObject = JSON.parse(data.responseText);
        var eventId = parseInt(mObject.event_id);

      $(function messageCall() {
      var messageRequest = $.get( '/events/20/messages', function(event, data, status, xhr) {
      debugger;
      var messages = JSON.parse(data);
    });
  });
});

//       messageRequest.done(function(messages) {
//       messages.forEach(function(){
//       $( '.chatter_box' ).append('<li>' + data[i] + '<li>');
//       });
//     });
//   });
// });




