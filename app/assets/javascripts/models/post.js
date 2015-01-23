
Blog.Post = DS.Model.extend({
  title:   DS.attr('string'),
  content: DS.attr(),
  content_type: DS.attr('string')
})