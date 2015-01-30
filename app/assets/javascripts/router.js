Blog.Router.map(function(){
  this.route('about');
  this.resource('posts', function () {
    this.route('show', {path: ':post_id'});
    this.route('artices');
  });
  this.resource('admin', function(){
    this.resource('posts');
  });
});

