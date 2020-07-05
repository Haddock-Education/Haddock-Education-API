class Api::V1::RankingsController < ApplicationController
  def top_three
    render json: { top_three: User.top_three }
  end

  def my_ranking
    user = User.find_by(id: @current_user.id) unless @current_user.nil?

    render json: { my_ranking: user.my_ranking }
  end
end
