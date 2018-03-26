class UserCategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page], per_page: 3)
    @lesson = current_user.lessons.build
  end
end
