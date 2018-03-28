class UserWordsController < ApplicationController

  def index
    @user = current_user
    @lessons = @user.lessons
  end

end
