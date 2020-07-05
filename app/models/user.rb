class User < ApplicationRecord
  api_guard_associations refresh_token: 'refresh_tokens', blacklisted_token: 'blacklisted_tokens'
  has_many :refresh_tokens, dependent: :delete_all
  has_many :blacklisted_tokens, dependent: :delete_all

  has_many :questions
  has_many :answers

  has_secure_password

  def self.top_three
    User.all.order(total_points: :desc).limit(3)
  end

  def my_ranking
    User.all.order(total_points: :desc).pluck(:id).index(self.id) + 1
  end
end
