class CreateWordAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :word_answers do |t|
      t.references :word, foreign_key: true
      t.text :content
      t.boolean :is_correct

      t.timestamps
    end
  end
end
