module PostsHelper
  def recent_posts
    @recent_posts = Post.desc.limit(5)
  end

  def best_ever
    @best_posts = sorted(Post.published)
  end

  def best_by_year
    @best_by_year = sorted(Post.last_year.published)
  end

  def best_by_month
    @best_by_month = sorted(Post.last_month.published)
  end

  def sorted(posts)
    posts.sort{|x,y| x.views_count <=> y.views_count}.reverse.first(5)
  end

  def type_title(post)
    case post.content_type
    when 'Article'
      I18n.t('posts.read')
    when 'Travel'
      'travel' 
    when 'Photo'
      'see' 
    when 'Code'
      'Class.new'
    end
  end

end
