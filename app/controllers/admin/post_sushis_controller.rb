class Admin::PostSushisController < ApplicationController
    before_action :authenticate_admin!
    
    def index
      @post_sushis = PostSushi.order("created_at desc")
    end
    
    def show
      @post_sushi = PostSushi.find(params[:id])
    end
    
    def destroy
      @post_sushi = PostSushi.find(params[:id])
      @post_sushi.destroy
      redirect_to admin_post_sushis_path
        
    end
end
