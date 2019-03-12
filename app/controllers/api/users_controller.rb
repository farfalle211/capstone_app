class Api::UsersController < ApplicationController


  def index
    @users = User.all
    render 'index.json.jbuilder'
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      age: params[:age],
      gender: params[:gender],
      summary: params[:summary],
      location: params[:location]
    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @user = User.find(params[:id])

    @user.name = params[:name] || @user.name
    @user.email = params[:email] || @user.email
    @user.password = params[:password] || @user.password
    @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation
    @user.age = params[:age] || @user.age
    @user.gender = params[:gender] || @user.gender
    @user.summary = params[:summary] || @user.summary
    @user.location = params[:location] || @user.location


    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @users.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
