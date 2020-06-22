$(function(){
  function buildHTML(comment){
    var html = `<div class="comment_user_content">
                  <div class="profile">
                    <div class="profile__name">
                      ${comment.nickname}
                    </div>
                    <div class="profile__right">
                      <div class="image">
                        <i class="fas fa-user-circle"></i>
                      </div>
                      <div class="seller_or_buyer">
                        出品者
                      </div>
                    </div>
                  </div>
                  <div class="comment">
                    <div class="comment__text">
                      ${comment.content}
                    </div>
                    <div class="comment__bottom">
                      <div class="comment__trash">
                        <a item_id="@item" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.comment_id}"><i class="fa fa-trash"></i>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>`
    return html;
  }

  function buildHTMLother(comment){
    var html = `<div class="mainShow__box__content__top__commentBox__comments__comment--other">
                  <div class="profile">
                    <div class="profile__right">
                      <div class="image">
                        <i class="far fa-user-circle"></i>
                      </div>
                      <div class="seller_or_buyer">
                        お客様
                      </div>
                    </div>
                    <div class="profile__name">
                      ${comment.nickname}
                    </div>
                  </div>
                  <div class="comment">
                    <div class="comment__text">
                      ${comment.content}
                    </div>
                    <div class="comment__bottom">
                      <div class="date">
                        <i class="far fa-clock"></i>
                        本日
                      </div>
                      <div class="comment__icon">
                        <div class="flag">
                          <i class="far fa-flag"></i>
                        </div>
                        <div class="trash">
                          <a item_id="@item" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.comment_id}"><i class="fa fa-trash"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>`
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
      contentType: false
    })
    .done(function(data){
      // if (data.comment_user_id == data.item_user_id) {
        var html = buildHTML(data);
        $('.comment-box').append(html);
        $('.textarea').val('');
        $('.comment-button').prop('disabled', false);
      // } else {
      //   var html = buildHTMLother(data);
      //   $('.comment-box').prepend(html);
      //   $('.textarea').val('');
      //   $('.comment-button').prop('disabled', false);
      // }
    })
    .fail(function(){
      alert('error');
    })
  })
});

//   $('#comment_form').on ('submit',function(e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     var url = $(this).attr('action');
//     $.ajax({
//       url: url,
//       type: "POST",
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//     .done(function(data){
//       if (data.comment_user_id == data.item_user_id) {
//         var html = buildHTML(data);
//         $('#comments').append(html);
//         $('.text_area').val('');
//         $('.comment_btn').prop('disabled', false);
//       } else {
//         var html = buildHTMLother(data);
//         $('#comments').append(html);
//         $('.text_area').val('');
//         $('.comment_btn').prop('disabled', false);
//       }
//     })
//     .fail(function(){
//       alert('error');
//     })
//   })
// });



// $(function (){
//   function buildHTML(comment){
//     var html = `<div class="comment_user_content">
//                   <div class= "profile">
//                     <div class= "profile__name">
//                       ${comment.user_name}
//                     </div>
//                     <div class="profile__right">
//                       <div class="image">
//                         <i class="fas fa-user-circle"></i>
//                       </div>
//                       <div class="comment_position">
//                         出品者
//                       </div>
//                     </div>
//                   </div>
//                   <div class="comment">
//                     <div class="comment__text">
//                      ${comment.content}
//                     </div>
//                     <div class="comment__bottom">
//                       <div class="comment__trash">
//                         <a item_id="@item" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.content_id}"><i class="fa fa-trash"></i>
//                         </a>
//                       </div>
//                     </div>
//                   </div>
//                 </div>`
//     return html;
//   }

//   function buildHTMLother(comment){
//     var html = `<div class="comment_user_content_other">
//                   <div class= "profile">
//                     <div class="profile__right">
//                       <div class="image">
//                         <i class="fas fa-user-circle"></i>
//                       </div>
//                       <div class="comment_position">
//                         お客様
//                       </div>
//                     </div>
//                     <div class="profile__name">
//                       ${comment.user_name}
//                     </div>
//                   </div>
//                   <div class="comment">
//                     <div class="comment__text">
//                       ${comment.content}
//                     </div>
//                     <div class="comment__bottom">
//                       <div class="comment__trash">
//                         <a item_id="@item" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.content_id}"><i class="fa fa-trash"></i></a>
//                       </div>
//                     </div>
//                   </div>
//                 </div>`
//                 // `<div class="comment_user_content_other">
//                 //   <div class="profile">
//                 //     <div class="profile__right">
//                 //       <div class="image">
//                 //         <i class="far fa-user-circle"></i>
//                 //       </div>
//                 //       <div class="comment_position">
//                 //         お客様
//                 //       </div>
//                 //     </div>
//                 //     <div class="profile__name">
//                 //       ${comment.user_name}
//                 //     </div>
//                 //   </div>
//                 //   <div class= "comment__bottom">
//                 //     <div class="comment__trash">
//                 //       <a item_id="@item" rel="nofollow" data-method="delete" href="/items/${content.item_id}/comments/${content_id}"><i class="fa fa-trash"></i></a>
//                 //     </div>
//                 //   </div>
//                 // </div>`
//   }
//   $('#new_comment').on('submit', function(e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     var url = $(this).attr('action')
//     $.ajax({
//       url: url,
//       type: 'POST',
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false,
//     })
//     .done(function(data){
//       if (data.comment.user.id == data.item.user.id) {
//         var html = buildHTML(data);
//         $('.comment-box').prepend(html);
//         $('.textarea').val('');
//         $('.comment-button').prop('disabled', false);
//       } else {
//         var html = buildHTMLother(data);
//         $('.comment-box').prepend(html);
//         $('.textarea').val('');
//         $('.comment-button').prop('disabled', false);
//       }
//     })
//     .fail(function(){
//       alert('error');
//     })
//   })
// });