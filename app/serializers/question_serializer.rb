class QuestionSerializer < ActiveModel::Serializer
  attribute :id
  attribute :title
  attribute :text
  attribute :user_id
  attribute :answer

  def answer
    object.answers
  end
end
