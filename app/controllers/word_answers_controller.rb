class WordAnswersController < ApplicationController

  def index
    @word_answers = WordAnswer.all
  end

  def show
    @word_answer = WordAnswer.find(params[:id])
  end

  def new
    word = Word.find(params[:word_id])    
    @answers = []
    3.times { @answers << word.word_answers.build }
  end

  def create
    word = Word.find(params[:word_id])
    params[:answers].each do |answer|
    word_answer = word.word_answers.build(word_answer_params(answer))
    word_answer.save
    end
    redirect_to category_word_path(word.category,word)
  end

  def edit
    @word_answer = WordAnswer.find(params[:id])
    @word = Word.find(params[:word_id])    
  end

  def update
    word_answer = WordAnswer.find(params[:id])
    if word_answer.update_attributes(word_answer_params(params[:word_answer]))
      flash[:success] = "Word_answer updated"
      redirect_to category_word_path(word_answer.word.category,word_answer.word)
      else
      render 'edit'
      end
    end

  def destroy
     word = Word.find(params[:word_id])
     word_answer = WordAnswer.find(params[:id])
     word_answer.destroy
     redirect_to category_word_path(word.category,word)
  end

  private

  def word_answer_params(answer)
    answer.permit(:content, :is_correct)
  end

end

