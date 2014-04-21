module PostsHelper
  def recent_posts
    @recent_posts = Post.desc.limit(5)
  end

  def best_ever
    @best_posts = sorted(Post.published.includes(:impressions))
  end

  def best_by_year
    @best_by_year = sorted(Post.last_year.published.includes(:impressions))
  end

  def best_by_month
    @best_by_month = sorted(Post.last_month.published.includes(:impressions))
  end

  def sorted(posts)
    posts.sort{|x,y| x.impressionist_count(:filter=>:session_hash) <=> y.impressionist_count(:filter=>:session_hash) }.reverse.first(5)
  end

end
