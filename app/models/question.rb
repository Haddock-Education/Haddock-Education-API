class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  def display_answers
    Answer.where(question_id: self.id)
  end

  def as_json(options = {})
    super(
      methods: :display_answers
    )
  end
end
