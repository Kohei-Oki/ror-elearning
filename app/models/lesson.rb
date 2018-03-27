class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :lesson_words, dependent: :destroy
  has_many :word_answers, through: :lesson_words

  default_scope -> { order(created_at: :desc)}

  def correct_answers
    self.word_answers.where(is_correct: true)
  end

end
