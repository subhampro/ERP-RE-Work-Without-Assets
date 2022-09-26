$(document).ready(function(){

  window.addEventListener('message', function(event) {
      if (event.data.action == 'open') {
        $('#plate').show();
      }
  });

  $(document).keyup(function(e) {
    if (e.keyCode == 13) {
      const length = $("#number").val().length;
      if (length >= 4 && length <= 8 ) {
        $('#plate').hide();
        $.post('http://PRO-plates/enter', JSON.stringify({
          number: $('#number').val()
        }));
      } else{
        $.post('http://IND-inventory/Notify', JSON.stringify({
            message: "Number Plate must be betwwen 4 to 8 Digits",
            type: "error"
        }))
      }
    } else if (e.keyCode == 27) {
      $('#plate').hide();
      $.post('http://PRO-plates/escape')
    }
  });
});
