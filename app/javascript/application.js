// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "jquery_ujs"
import "popper"
import "bootstrap"

//= require_tree .


$(document).ready(function(){

  // hospital select behaviour
  $('select#reservation_hospital_id').on('change', function() {
    let sel = this;
    let hospital_id = this.value;
    let $sel = $('select#reservation_doctor_id');
    $sel.html('')
    $.ajax({
      url: "/doctors/by_hospital/"+ hospital_id +".json", 
      success: function(result) {
        $sel.prop("disabled", false)
        $sel.append($("<option>").val('').text('Choose a doctor'));
        $.each(result, function(key, val) {
          let text = result[key].firstname + ' ' + result[key].lastname
          $sel.append($("<option>").val(result[key].id).text(text));
        });
      }
    });
  });

  // doctor select behaviour
  $('select#reservation_doctor_id').on('change', function() {
    $('input#reservation_day').prop("disabled", false)
  });

  //
  $('input#reservation_day').on('change', function() {
    let input = this;
    let day = input.value;
    let doctor_id = $('select#reservation_doctor_id').val();
    let data = { day: day, id: doctor_id }
    $.ajax({
      url: "/doctors/available_hours.json",
      data: data,
      success: function(result) {
        let $block_times_div = $('div#block_times_container');
        $block_times_div.html('')
        $('span#day_selected').text(day);
        let html = '';
        if (result.length > 0) {
          let i = 0;
          html = html +'<div class="p-3 border rounded-3">'
          $.each(result, function(key, val) {
            let text = result[key].firstname + ' ' + result[key].lastname
            let  start = ("0" + new Date(result[key].start).getUTCHours()).slice(-2) + ":" +("0" + new Date(result[key].start).getUTCMinutes()).slice(-2); 
            let  end = ("0" + new Date(result[key].end).getUTCHours()).slice(-2) + ":" +("0" + new Date(result[key].end).getUTCMinutes()).slice(-2);
            html = html +'<div class="form-check">'
            html = html +  '<input class="form-check-input" type="radio" name="reservation[block_time]" id="radios'+ i +'" value="'+result[key].id+'" checked>'
            html = html +  '<label class="form-check-label" for="radios'+ i +'">'
            html = html +   start + ' - ' + end
            html = html +  '</label>'
            html = html +'</div>'
            i = i + 1;
          });
          html = html +'</div>'
        } else {
          html = html +'<div class="p-3 border rounded-3">'
          html = html +'<h2>No available hours for this day</h2>'
          html = html +'</div>'
        }
        $block_times_div.html(html);
      }
    });
  });
});
