class Api::V1::QuestionsController < ApplicationController
  def index_all
    questions = Question.all

    if questions
      json_response 'Todas as perguntas.', true, { questions: questions }, :ok
    else
      json_response 'Algo deu errado.', false, {}, :unprocessable_entity
    end
  end

  def index
    questions = Question.find_by(user_id: params[:user_id])

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
      json_response 'Sua pergunta foi enviada!', true, { question: question }, :ok
    else
      json_response 'Algo deu errado.', false, {}, :unprocessable_entity
    end
  end

  def show
    question = Question.find_by(id: params[:id])

    if question
      json_response 'Detalhes da pergunta.', true, { question: question }, :ok
    else
      json_response 'Algo deu errado.', false, {}, :not_found
    end
  end

  def update
    if @current_user.id == params[:user_id].to_i
      question = Question.find_by(id: params[:id])

      if question&.update(question_params)
        json_response 'Sua pergunta foi atualizada!', true, { question: question }, :ok
      else
        json_response 'Algo deu errado.', false, {}, :unprocessable_entity
      end
    else
      json_response 'Não possui permissão para essa operação.', false, {}, :unauthorized
    end
  end

  def destroy
    if @current_user.id == params[:user_id].to_i
      question = Question.find_by(id: params[:id])

      if question&.delete
        json_response 'Sua pergunta foi excluída!', true, {}, :ok
      else
        json_response 'Algo deu errado.', false, { question: question }, :unprocessable_entity
      end
    else
      json_response 'Não possui permissão para essa operação.', false, {}, :unauthorized
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :text)
  end
end
