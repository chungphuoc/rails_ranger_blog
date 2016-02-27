class PostsController < ApplicationController
  before_filter :set_post, except: [:index, :create, :new]

  def index
    @posts = Post.order("created_at desc").page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    respond_to do |format|
      if PostManager.create(@post, post_params)
        format.html { redirect_to posts_path, notice: "Post was successfully created." }
        format.json { head :no_content }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: "Post was successfully updated." }
        format.json { head :no_content }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @post.destroy
        format.html { redirect_to posts_path, notice: "Post was successfully deleted." }
        format.json {head :no_content }
      end
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(
        :title,
        :content,
        :cover_photo,
        :remote_cover_photo_url
      )
    end
end
