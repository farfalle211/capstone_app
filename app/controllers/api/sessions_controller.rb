class Api::SessionsController < ApplicationController
  def create
    email    = params[:email]    || params.dig(:session, :email)    || params.dig(:api_session, :email)
    password = params[:password] || params.dig(:session, :password) || params.dig(:api_session, :password)
    email = email.to_s.strip.presence
    return render json: {}, status: :unauthorized if email.blank? || password.blank?

    user = User.find_by(email: email)
    if user&.authenticate(password)
      jwt = JWT.encode(
        {
          user_id: user.id,
          exp: 24.hours.from_now.to_i
        },
        Rails.application.credentials.fetch(:secret_key_base),
        'HS256'
      )
      @jwt = jwt
      @email = user.email.to_s
      @user_id = user.id
      render :create, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
