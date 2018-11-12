// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery.turbolinks
//= require jquery-ui/widgets/sortable
//= require bootstrap-sprockets

//= require_tree .
//= require cocoon
//= require jquery-ui
//= jquery-turbolinks

$(function() {
  $(document).on('click', '.edit_button', function() {
    $('.sign_modal_wrapper').show();
    $('.sign_modal').show();
    if ($(this).hasClass('edit_button')) {
      $('.sign_modal_edit').show();
    }
  });
});

$(document).on('click', '.sign_modal_wrapper, .fa_wrapper', function() {
    $('.sign_modal_wrapper').hide();
    $('.sign_modal').hide();
    $('.sign_modal_content').hide();
})


$(function() {
  $( ".table-sortable" ).disableSelection();
  $( ".table-sortable" ).sortable({

        axis: 'y',
        items: '.item',

        update: (e, ui) => {
          item = ui.item
          item_data = item.data()
          params = { _method: 'put' }
          params[item_data.modelName] = { row_order_position: item.index() }
          // console.log("aaa")
          console.log(item_data)
          $.ajax({
                 type: 'POST',
                 url: item_data.updateUrl,
                 dataType: 'json',
                 data: params
          });
        }
  });
});




