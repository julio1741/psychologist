// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "jquery_ujs"
import "popper"
import "bootstrap"

//= require_tree .

$.get( "/hospitals.json", function(data) {
  //alert(data[0].name);
});

$(document).ready(function(){
  $('select#reservation_hospital_id').on('change', function() {
    let sel = this
    let hospital_id = this.value
    let $sel = $('select#reservation_doctor_id')
    $sel.html('')
    $.ajax({
      url: "/doctors/by_hospital/"+ hospital_id +".json", 
      success: function(result) {
        $sel.prop("disabled", false)
        $.each(result, function(key, val) {
          let text = result[key].firstname + ' ' + result[key].lastname
          $sel.append($("<option>").val(result[key].id).text(text));
        });
    }});
  })
});

