$(function(){
  $('form#new_session').submit(function() {
    log_in();
    return false;
  });
});

function log_in() {
  var email = $('#user_email').val();
  var password = $('#user_password').val();

  $.ajax({ url: '/users/sign_in',
    type: 'POST',
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: { user: { "email": email, "password": password } },
    dataType: 'json',
    success: function(response) {
      $('#log_in .errors').html('');
      window.location.href = '/movies';
    },
    error: function(response) {
      $('#log_in .errors').html('');
      errors = $.parseJSON(response.responseText).error;
      $('#log_in .errors').append('<p>' + errors + '</p>');
    }
  });
}