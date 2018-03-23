class LessonWordsController < ApplicationController

  def show
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_word = LessonWord.find(params[:id])
  end

  def update
    @lesson_word = LessonWord.find(params[:id])
    if @lesson_word.update_attributes(lesson_word_params)
      redirect_to lesson_lesson_word_path
    end
  end

  def lesson_word_params
    params.require(:lesson_word).permit(:word_answer_id)
  end

end
