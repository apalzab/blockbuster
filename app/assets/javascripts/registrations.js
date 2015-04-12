$(function(){
  $('form#new_user').submit(function() {
    var nickname = $('#user_nickname').val();
    var email = $('#user_email').val();
    var password = $('#user_password').val();
    var password_confirmation = $('#user_password_confirmation').val();
    sign_in(nickname, email, password, password_confirmation);
    return false;
  });

  function sign_in(nickname, email, password, password_confirmation) {
    $.ajax({ url: '/users',
      type: 'POST',
      beforeSend: function(xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')); },
      data: { user: { "nickname": nickname, "email": email, "password": password,
                      "password_confirmation": password_confirmation} },
      dataType: 'json',
      success: function(response) {
        $('#sign_up .errors').html('');
        window.location.href = '/movies';
      },
      error: function(response) {
        errors = $.parseJSON(response.responseText).errors;
        $('#sign_up .errors').html('');
        for(var message in errors) {
          var error = message + ": " + errors[message];
          $('#sign_up .errors').append('<p>' + error + '</p>');
        }
      }
    });
  }
});
