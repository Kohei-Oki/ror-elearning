class UserCategoriesController < ApplicationController

  def index
    #@categories = Category.all
    @categories = Category.paginate(page: params[:page], per_page: 3)
  end



end
