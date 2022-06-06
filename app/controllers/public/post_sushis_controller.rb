class Public::PostSushisController < ApplicationController
  def new
    @post_sushi = PostSushi.new
  end

  def create
    @post_sushi = PostSushi.new(post_sushi_params)
    @post_sushi.end_user.id = current_end_user.id
    @post_sushi.save
    redirect_to public_post_sushis_path

  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def post_sushi_params
    params.require(:post_sushi).permit(:image, :end_user_id, :name, :region, :prefecture, :municipalities, :price, :atmosphere, :lunch_dinner, :memo)
  end
end
