
$(document).ready(function() {

  function formattingNumericInput() {
    $('#credit-card-number').keyup(function(){
      $(this).val($(this).val().replace(/[\D\s\._\-]+/g, ""));
    });
  }

  formattingNumericInput();

});

