$(function(){
  Payjp.setPublicKey('pk_test_9803a05e60bf76b41efc634f');
  var form = $('#charge-form'),
      btn = $('.submit-btn');

  form.on('submit', function(e){

    e.preventDefault();
    btn.prop('disabled', true);

    const card = {
      number: $('.number').val(),
      cvc: $('.cvc').val(),
      exp_month: $('#exp_month').val(),
      exp_year: $('#exp_year').val()
    };
    
    Payjp.createToken(card, (s, response) => {
      if (response.error) {
        $('.payment-errors').text(response.error.message);
        btn.prop('disabled', false);
      }
      else {
        $('.number').removeAttr("name");
        $('.cvc').removeAttr("name");
        $('.exp_month').removeAttr("name");
        $('.exp_year').removeAttr("name");
        
        var token= response.id;

        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      }
    });
  });
});