class Api::V1::AnswersController < ApplicationController
  def index
    answers = Answer.find_by(question_id: params[:question_id])
  end
end
