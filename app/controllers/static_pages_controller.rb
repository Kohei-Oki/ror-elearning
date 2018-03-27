class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @lessons = current_user.lessons
      @feed_items = current_user.feed
    end
  end

end
