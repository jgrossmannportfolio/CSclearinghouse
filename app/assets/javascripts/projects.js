$('document').ready(function() {
  $('#newprojecttag').click(function() {
    $.ajax({type: 'GET',
            url: "/projects/new",
            data: {tag: $('#tag_name').val(), tags: $('meta[name=tags]').attr('content') },
            success: function(result) {
                $('#projecttags').html(result).show() },
            error: function() { alert('error'); },
            timeout: 5000 });
    return false;
  }),
  $('#projecttagcheck input').click(function() {
    $.ajax({type: 'GET',
            url: "/projects/new",
            data: {deletetag: $(this).attr('id')},
            success: function(result) {
                $('#projecttags').html(result).show() },
            error: function() { alert('error'); },
            timeout: 5000 });
    return false;
  })
	return false
});
