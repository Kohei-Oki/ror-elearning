class Word < ApplicationRecord
  belongs_to :category
  has_many :word_answers, dependent: :destroy
  has_many :lesson_words

  def correct_answer
    self.word_answers.find_by(is_correct: true)
  end

end
