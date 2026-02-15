class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render 'index.json.jbuilder'
  end

  def create
    p = params[:user] || params[:api_user] || params
    user = User.new(
      name: (p[:name] || "").to_s.titleize,
      email: p[:email],
      password: p[:password],
      password_confirmation: p[:password_confirmation],
      age: p[:age],
      gender: p[:gender],
      summary: p[:summary],
      location: p[:location],
      phone_number: p[:phone_number],
      image: p[:image]
    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user = User.find(params.fetch(:id))
    render 'show.json.jbuilder'
  end

  def update

    response = HTTP.get("https://api.seatgeek.com/2/events?geoip=true&client_id=#{ ENV["API_KEY"] }&client_secret=#{ ENV["API_SECRET"] }")

    @user = User.find(params.fetch(:id))

    @user.longitude = response.parse["meta"]["geolocation"]["lon"] || @user.longitude
    @user.latitude = response.parse["meta"]["geolocation"]["lat"] || @user.latitude
    @user.name = params.fetch(:name, @user.name)
    @user.email = params.fetch(:email, @user.email)
    @user.age = params.fetch(:age, @user.age)
    @user.gender = params.fetch(:gender, @user.gender)
    @user.summary = params.fetch(:summary, @user.summary)
    @user.location = params.fetch(:location, @user.location)
    @user.phone_number = params.fetch(:phone_number, @user.phone_number)
    # if params[:image]
      @user.image = params.fetch(:image, @user.image)
    # end

    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @users.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
