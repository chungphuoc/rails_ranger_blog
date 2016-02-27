class PostManager
  def self.create(post, params)
    post.assign_attributes(params)
    post.save
  end
end