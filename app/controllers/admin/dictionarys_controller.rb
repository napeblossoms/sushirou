class Admin::DictionarysController < ApplicationController
  before_action :authenticate_admin!
  def index
     @dictionarys = Dictionary.all
  end

  def show
    @dictionary = Dictionary.find(params[:id])
  end

  def destroy
    @dictionary = Dictionary.find(params[:id])
    @dictionary.destroy
    redirect_to admin_dictionarys_path
  end
end
