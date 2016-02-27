class PostsController < ApplicationController
  before_filter :set_post, except: [:index, :create]

  def index
    @posts = Post.order("created_at desc")
  end

  def show
  end

  def create
    @post = Post.new
    reponse_to do |format|
      if PostManager.create(@post, post_params)
        format.html { redirect_to post_path(@post), notice: "Post was successfully created." }
        format.json { head :no_content }
      end
    end
  end

  def edit
  end

  def update
    reponse_to do |format|
      if PostManager.update(post_params)
        format.html { redirect_to post_path(@post), notice: "Post was successfully updated." }
        format.json { head :no_content }
      end
    end
  end

  def destroy
    reponse_to do |format|
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
        :cover_photo
      )
    end
end
