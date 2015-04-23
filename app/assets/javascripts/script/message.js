  $(function() {
    $('#new_message').on('ajax:complete', function(e, data, status, xhr){
      $('#message_message').val('');
        var mObject = JSON.parse(data.responseText);
        var event_id = parseFloat(mObject.event_id);
          $(function messageCall( ) {
            var messageRequest = $.get( '/events/' + event_id + '/messages', function(e, data, status, xhr ) {
            var messages = JSON.parse(data);
            debugger;
            messages.forEach(function(){});
            for (i = 0; i < messages.length; i++) {
            $( ".chatter_box" ).append('<li>' + data[i] + '<li>');
            }

            debugger;
      messageRequest.done(function(messages) {
      var data = JSON.parse(messages);
      for (i = 0; i < data.length; i++) {
        $('#titles-list').append('<li>' + data[i] + '<li>');
      }
        });
      });
    });
  });
});


