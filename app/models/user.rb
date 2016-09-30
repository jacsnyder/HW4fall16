class User < ActiveRecord::Base
  class << self
    def create_user!(user_params)
      user_params[:session_token] = SecureRandom.base64
      create!(user_params)
    end
  end
end
