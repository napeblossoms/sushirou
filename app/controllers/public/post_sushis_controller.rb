class Public::PostSushisController < ApplicationController
  def new
    @post_sushi = PostSushi.new
  end

  def create
    #パラメーターを定義する前にパラメータの内容欲しいため階層構造で定義
    params[:post_sushi][:region] = params[:post_sushi][:region].to_i
    params[:post_sushi][:prefecture] = params[:post_sushi][:prefecture].to_i
    params[:post_sushi][:price] = params[:post_sushi][:price].to_i
    params[:post_sushi][:atmosphere] = params[:post_sushi][:atmosphere].to_i
    @post_sushi = PostSushi.new(post_sushi_params)
    @post_sushi.end_user_id = current_end_user.id
    @post_sushi.save
    redirect_to public_post_sushis_path

  end

  def index
    @post_sushis = PostSushi.order('created_at desc')#投稿順にする
  end

  def show
    @post_sushi = PostSushi.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post_sushi =PostSushi.find(params[:id])
    @post_sushi.destroy
    redirect_to public_post_sushis_path
  end
  
  # def followed_post_sushis
  #   @end_user = current_end_user
  #   @end_users = @end_user.followings.order('created_at desc') #フォローしている人の投稿を投稿順にする
  # end

  def edit
  end

  def update
  end

  private

  def post_sushi_params
    params.require(:post_sushi).permit(:image, :end_user_id, :name, :region, :prefecture, :municipalities, :price, :atmosphere, :lunch_dinner, :memo)
  end
end
