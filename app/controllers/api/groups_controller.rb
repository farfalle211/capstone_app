class Api::GroupsController < ApplicationController
  def create
    group = Group.new(
      size: params[:size],
      event_id: params[:event_id],
      seating_quality: params[:seating_quality],
      label: params[:label],
      meet_before: params[:meet_before],
      drink_level: params[:drink_level],
      gender_preference: params[:gender_preference] 
    )

    if group.save
      render json: {message: 'Group created successfully'}, status: :created
    else
      render json: {errors: group.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @group = Group.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @group = Group.find(params[:id])

    @group.size = params[:size] || @group.size
    @group.event_id = params[:event_id] || @group.event_id
    @group.seating_quality = params[:seating_quality] || @group.seating_quality
    @group.open = params[:open] || @group.open
    @group.label = params[:label] || @group.label
    @group.meet_before = params[:meet_before] || @group.meet_before
    @group.drink_level = params[:drink_level] || @group.drink_level
    @group.gender_preference = params[:gender_preference] || @group.gender_preference

    if @group.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @groups.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    render json: {message: "Group destroyed successfully"}
  end
end
