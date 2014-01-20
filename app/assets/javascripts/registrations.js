$('document').ready(function() {
  $('<div id="formdata"></div>').hide().insertAfter($('#usertype_usertype')),
  $('#usertype_usertype').change(function() {
    $.ajax({type: 'GET',
            url: "/users/sign_up",
            data: {usertype: $("#usertype_usertype option:selected").text()},
            success: function(result) {
              $('#formdata').html(result).show() },
            timeout: 5000 });
    return false;
  })
});
