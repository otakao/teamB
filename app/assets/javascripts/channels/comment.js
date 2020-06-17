$(function() {
  function buildHTML(comment) {
    var html = $('<li class="comment">').append(comment.content);
    return html;
  }

  $('.comment-button').on('submit', function(e){
    e.preventDefault()
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
  .done(function(comment){
    var html = buildHTML(comment)
    $(".comments").append(html)
    $('.textarea').val("");
    $('.comments').animate({ scrollTop: $('.comments')[0].scrollHeight});
  })
  .fail(function() {
    alert("メッセージ送信に失敗しました");
  });
});