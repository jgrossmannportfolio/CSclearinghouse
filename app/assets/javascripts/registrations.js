RP = {
	setup: function() {
		$('<div id="registrationform"></div>').hide().appendTo($('body'));
		$('#accounttype').change(RP.getFormData);
	},
	getFormData: function() {
		$.ajax({type: 'GET', url: '/users/sign_up/form', data: {:accounttype => $(this).val()}, timeout: 5000, sucess: RP.showFormData, error: function() { alert('Error!'); }});
    return false;
  },
  showFormData: function(data) {
    $('#formdata').html(data).css{'top': 250}).show();
    return false;
  },
}
$(RP.setup);
$('#accounttype').change(function() {
  $.ajax({type: 'GET', url: '/users/sign_up/form', data: {:accounttype => $(this).find('option:selected').val()}, timeout: 5000 });
});
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
