class LessonWordsController < ApplicationController

  def show
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_word = LessonWord.find(params[:id])
  end

  def update
    @lesson_word = LessonWord.find(params[:id])
    @lesson = @lesson_word.lesson
    if @lesson_word.update_attributes(lesson_word_params)
      if @lesson_word != @lesson.lesson_words.last
        i = @lesson.lesson_words.index(@lesson_word)
        redirect_to lesson_lesson_word_path(@lesson, @lesson.lesson_words[i+1])
      else 
        @lesson.update_attributes(result: @lesson.correct_answers.count)
        redirect_to @lesson
      end
    end
  end

  def lesson_word_params
    params.require(:lesson_word).permit(:word_answer_id)
  end

end
