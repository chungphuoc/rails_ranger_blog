module PostsHelper
  def render_cover_photo(blog)
    blog.cover_photo.present? ? blog.cover_photo : 'default.png'
  end
end
