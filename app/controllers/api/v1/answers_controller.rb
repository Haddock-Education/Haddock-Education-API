class Api::V1::AnswersController < ApplicationController
  def create
    answer = Answer.new(answer_params)
    answer.update(question_id: params[:question_id], user_id: @current_user.id)

    if answer.save
      json_response 'Sua resposta foi enviada!', true, { answer: answer }, :ok
    else
      json_response 'Algo deu errado.', false, {}, :unprocessable_entity
    end
  end

  def show
    answer = Answer.find_by(id: params[:id])

    if answer
      json_response 'Visualizar resposta.', true, { answer: answer }, :ok
    else
      json_response 'Algo deu errado.', false, {}, :not_found
    end
  end

  def update
    answer = Answer.find_by(id: params[:id])

    if answer && answer.user_id == @current_user.id && answer.update(answer_params)
      json_response 'Sua resposta foi atualizada!', true, { answer: answer }, :ok
    else
      json_response 'Algo deu errado.', false, {}, :unprocessable_entity
    end
  end

  def destroy
    answer = Answer.find_by(id: params[:id])

    if answer && answer.user_id == @current_user.id && answer.destroy
      json_response 'Sua resposta foi excluída!', true, {}, :ok
    else
      json_response 'Algo deu errado.', false, { answer: answer }, :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text)
  end
end
