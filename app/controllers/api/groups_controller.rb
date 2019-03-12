class Api::GroupsController < ApplicationController
  def create
    group = Group.new(
      size: params[:size],
      event_id: params[:event_id],   #this populated from the backend with this.event.id?
      confirmation: params[:confirmation]
    )

    if group.save
      render json: {message: 'Group created successfully'}, status: :created
    else
      render json: {errors: group.errors.full_messages}, status: :bad_request
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
