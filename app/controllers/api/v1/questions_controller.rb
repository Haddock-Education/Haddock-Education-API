class Api::V1::QuestionsController < ApplicationController
  def index
    questions = Question.all

    if questions
      json_response 'Todas as perguntas.', true, { questions: questions }, :ok
    else
      json_response 'Algo deu errado.', false, {}, :unprocessable_entity
    end
  end

  def index_own
    questions = Question.where(user_id: @current_user.id)

    if questions
      json_response 'Minhas perguntas.', true, { questions: questions }, :ok
    else
      json_response 'Algo deu errado.', false, {}, :unprocessable_entity
    end
  end

  def create
    question = Question.new(question_params)
    question.update(user_id: @current_user.id)

    if question.save
      @current_user.add_points(10)
      json_response 'Sua pergunta foi enviada!', true, { question: question }, :ok
    else
      json_response 'Algo deu errado.', false, {}, :unprocessable_entity
    end
  end

  def show
    question = Question.find_by(id: params[:id])
    answers = Answer.where(question_id: question.id)

    if question
      json_response 'Detalhes da pergunta.', true, { question: question.serialize }, :ok
    else
      json_response 'Algo deu errado.', false, {}, :not_found
    end
  end

  def update
    question = Question.find_by(id: params[:id])

    if question && question.user_id == @current_user.id && question.update(question_params)
      json_response 'Sua pergunta foi atualizada!', true, { question: question }, :ok
    else
      json_response 'Algo deu errado.', false, {}, :unprocessable_entity
    end
  end

  def destroy
    question = Question.find_by(id: params[:id])

    if question && question.user_id == @current_user.id && question.destroy
      @current_user.add_points(-10)
      json_response 'Sua pergunta foi excluída!', true, {}, :ok
    else
      json_response 'Algo deu errado.', false, { question: question }, :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :text)
  end
end
