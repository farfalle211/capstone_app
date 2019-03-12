class Api::UserEventsController < ApplicationController

  #we will be on the Events index or show page when creating a User_event? I think it will be an event show. 
  def create
    user_event = User_event.new(
      user_id: current_user.id,
      event_id: params[:event_id],   #this populated from the backend with this.event.id?
      confirmation: params[:confirmation]
    )

    if user_event.save
      render json: {message: 'User_event created successfully'}, status: :created
    else
      render json: {errors: user_event.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user_event = User_event.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @user_event = User_event.find(params[:id])

    @user_event.confirmation = params[:confirmation] || @user_event.confirmation

    if @user_event.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user_events.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    user_event = User_event.find(params[:id])
    user_event.destroy
    render json: {message: "User_event destroyed successfully"}
  end
end
