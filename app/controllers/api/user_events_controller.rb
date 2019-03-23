class Api::UserEventsController < ApplicationController

  def index
    @user_events = UserEvent.all
    render 'index.json.jbuilder'
  end
  #we will be on the Events index or show page when creating a User_event? I think it will be an event show. 
  def create
    @user_event = UserEvent.new(
      user_id: current_user.id,
      event_id: params[:event_id],   #this populated from the backend with this.event.id?
      confirmation_status: params[:confirmation_status]
    )

    if @user_event.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user_event.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user_event = UserEvent.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @user_event = UserEvent.find(params[:id])

    @user_event.confirmation_status = params[:confirmation_status] || @user_event.confirmation_status

    if @user_event.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user_events.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    user_event = UserEvent.find(params[:id])
    user_event.destroy
    render json: {message: "User event destroyed successfully"}
  end
end
