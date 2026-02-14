class Api::SessionsController < ApplicationController
  def create
    email    = params[:email]    || params.dig(:session, :email)    || params.dig(:api_session, :email)
    password = params[:password] || params.dig(:session, :password) || params.dig(:api_session, :password)
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, email: user.email, user_id: user.id}, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
