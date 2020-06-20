$(function (){
  function buildHTML(comment){
    var html = `<p>
                  <div class="comment_user_content">
                   ${comment.user_name}
                   ${comment.content}
                  </div>
                 
                </p>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comment-box').prepend(html);
      $('.textarea').val('');
      $('.comment-button').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});