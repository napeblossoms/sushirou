class Public::DictionarysController < ApplicationController
  before_action :authenticate_end_user!

  def new
    @dictionary = Dictionary.new
  end

  def create
    @dictionary = Dictionary.new(dictionary_params)
    @dictionary.save
    redirect_to public_dictionarys_path
  end

  def index
    # @dictionarys = Dictionary.all
    @dictionary = Dictionary.new
    method = params[:search_method]#haru,natumaki,huyu
    @dictionarys = Dictionary.search(method)
  end

  def show
    @dictionary = Dictionary.find(params[:id])
  end

  def edit
    @dictionary = Dictionary.find(params[:id])
  end

  def update
    dictionary = Dictionary.find(params[:id])
    dictionary.update(dictionary_params)
    redirect_to public_dictionary_path(dictionary.id)
  end

  def destroy
    @dictionary = Dictionary.find(params[:id])
    @dictionary.destroy
    redirect_to public_dictionarys_path
  end

  # def search
  #   method = params[:search_method]
  #   word = params[:search_word]
  #   @dictionarys = Dictionary.search(method,word)
  # end

  private

  def dictionary_params
    params.require(:dictionary).permit(:name, :body, :season)
  end

end
