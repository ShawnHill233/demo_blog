// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require wice_grid
//= require bootstrap
//= require_self

$(document).on("click", "#article_preview", function(e) {
	$('#article_edit_div').hide();
	$('#article_preview_div').show();
	var text = $('#article_text').val();
	$.post('/admin/articles/preview', {data: $('#article_text').val()}, function(data) {
    $('#article_preview_div').html(data.text);
  });
});

$(document).on("click", "#article_edit", function(e) {
	$('#article_preview_div').hide();
	$('#article_edit_div').show();
})




