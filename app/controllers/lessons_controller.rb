class LessonsController < ApplicationController

  def show
     @lessons = Lesson.all
     @lesson = Lesson.find(params[:id])
  end

  def create
    category = Category.find(params[:category_id])
    lesson = category.lessons.create(user: current_user)
    
     category.words.each do |cword|
      lesson_word = lesson.lesson_words.create!(word: cword)
     end
     redirect_to lesson_lesson_word_path(lesson,lesson.lesson_words.first)
  end

  def update
    
  end

end
