$('document').ready(function() {
  $('<div id="formdata"></div>').hide().appendTo($('body')),
  $('#usertype_usertype').change(function() {
    $.ajax({type: 'GET',
            url: "/users/sign_up",
            data: {usertype: $(this).val().to_s},
            success: showFormData,
            timeout: 5000 });
    return false;
  })
});
showFormData: function(data) {
  $('#formdata').html(data).css({'top': 300}).show();
  return false;
}
$('#accounttype').select(function() {
  window.location = "/users"
});
$('#type').click(function() {
});
$('document').ready(function() {
  if ($('body').length) {
    console.log("RIGHT HERE IT ACTUALLY WORKED");
  }
});
$('document').ready(function() {
  $('#usertype_usertype').change(function() {
    console.log("AGAIN it actually worked");
    return false;
  });
});
