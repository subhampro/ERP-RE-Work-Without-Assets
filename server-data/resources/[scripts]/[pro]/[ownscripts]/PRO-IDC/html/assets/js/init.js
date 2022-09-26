  $(document).ready(function(){
  window.addEventListener('message', function( event ) {
    if (event.data.action == 'open') {
      var type        = event.data.type;
      var gender      = event.data.gender;
      var userData    = event.data.array;
      var sex         = userData.gender;
      var url         = userData.url;

      // if ( type == '' || type == null) {
        
        $('img').show();
        $('#name').css('color', '#282828');
        if (url == null) {
            url = "https://cdn.discordapp.com/attachments/932667172981993582/960481049824079892/unknown.png"
        } else {
          $('img').attr('src', url);
        } 
        console.log(url)
        $('#sex').text(gender);
        $('#name').text(userData.firstname + ' ' + userData.lastname);
        $('#dob').text(userData.birthdate);
        $('#height').text(userData.citizenid);
        $('#signature').text(userData.firstname + ' ' + userData.lastname);
        $('#id-card').css('background', 'url(assets/images/idcard.png)');
      // }
      $('#id-card').show();
    } else if (event.data.action == 'close') {

      $('#name').text('');
      $('#dob').text('');
      $('#height').text('');
      $('#signature').text('');
      $('#sex').text('');
      $('#id-card').hide();
      $('#licenses').html('');
    }
  });
});
