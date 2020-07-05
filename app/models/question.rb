class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  def serialize
    QuestionSerializer.new(self).to_hash
  end
end
