$('document').ready(function() {
  $('#skilltagcheck input').click(function() {
    console.log($(this).attr('id'));
    return false;
  })
});
$('document').ready(function() {
  $('#editheader').click(function() {
    $.ajax({type: 'GET',
            url: $('#editheader form').attr('action'),
            data: {editblock: "header" },
            success: function(result) {
              $('.headerblock').html(result).show() },
            timeout: 5000 });
    return false;
  }),
  $('#skilltags form').submit(function() {
    $.ajax({type: 'PUT',
            url: $('#newskilltag form').attr('action'),
            data: {skilltag: $('#tag_name').val()},
            success: function(result) {
              $.ajax({type: 'GET',
                      url: $('#newskilltag form').attr('action'),
                      success: function(result) {
                        $('#skilltags').html(result).show() },
                      timeout: 5000 }); },
            error: function() { alert('error'); },
            timeout: 5000 });
    return false;
  }),
  $('#skilltagcheck input').click(function() {
    $.ajax({type: 'PUT',
            url: $('#newskilltag form').attr('action'),
            data: {deletetag: $(this).attr('id')},
            success: function(result) {
              $.ajax({type: 'GET',
                      url: $('#newskilltag form').attr('action'),
                      success: function(result) {
                        $('#skilltags').html(result).show() },
                      timeout: 5000 }); },
            error: function() { alert('error'); },
            timeout: 5000 });
    return false;
  })
	return false
});

