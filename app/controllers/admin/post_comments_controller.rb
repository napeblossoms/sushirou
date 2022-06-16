class Admin::PostCommentsController < ApplicationController
     before_action :authenticate_admin!
     
    def create
      @post_sushi = PostSushi.find(params[:post_sushi_id])
      comment = PostComment.new(post_comment_params)
      comment.save
      redirect_to  admin_post_sushi_path(@post_sushi)
    end

    def destroy
      @post_sushi = PostSushi.find(params[:post_sushi_id])
      PostComment.find(params[:id]).destroy
      redirect_to admin_post_sushi_path(params[:post_sushi_id])
    end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end

    

