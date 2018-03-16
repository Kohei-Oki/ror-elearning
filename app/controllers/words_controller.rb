class WordsController < ApplicationController

  def index
    @words = Word.all
  end

  def show
    @word_view = Word.find(params[:id])
    @word = Word.find(params[:id])
    @category = Category.find(params[:category_id])
    @answers = []
    3.times { @answers << @word.word_answers.build }
  end

  def new
    category = Category.find(params[:category_id])
    @word = category.words.build
  end

  def create
    category = Category.find(params[:category_id])
    word = category.words.build(word_params)

    if word.save
    flash[:info] = "New category is created"
      redirect_to word.category
     else
      render 'new'
    end
  end

  def edit
    @word = Word.find(params[:word_id])
    @category = Category.find(params[:category_id])
    @word_answer = WordAnswer.find(:id)
  end

  def update
    @word = Word.find(params[:id])
    if @word.update_attributes(word_params)
      flash[:succuess] = "Word updated"
      redirect_to @word.category
    else
      render 'edit'
    end
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
    redirect_to word.category
  end

  private

  def word_params
    params.require(:word).permit(:content)
  end

end
