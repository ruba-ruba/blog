module PostsHelper
  def recent_posts
    @recent_posts = Post.order('created_at DESC').limit(5)
  end
end
