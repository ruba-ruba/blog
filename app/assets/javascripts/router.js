Blog.Router.map(function(){
  this.route('about');
  this.resource('posts', function () {
    this.route('show', {path: ':post_id'});
  });
});

