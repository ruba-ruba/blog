

Blog.PostsRoute = Ember.Route.extend
  model: ->
    @get('store').findAll 'post'