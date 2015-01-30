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
//= require jquery.cookie
//= require foundation
//= #require turbolinks
//= #require mousetrap
//= #require ckeditor/override
//= require ckeditor/init
//= require main
//= require main.js.coffee
//= require meta_table

// EMBER BLOCK

//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require blog

// EMBER BLOCK
// for more details see: http://emberjs.com/guides/application/

$(function(){ $(document).foundation(); });


$(document).ready(function(){
  $('.background').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 6);
    var amountMovedY = (e.pageY * -1 / 6);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
  });
});


// init ember
this.Blog = Ember.Application.create({
  LOG_TRANSITIONS: true,
  VERSION: '1.0.0',
  ready: function () {
    console.log('App version: ' + Blog.VERSION + ' is ready.');
  }
});
