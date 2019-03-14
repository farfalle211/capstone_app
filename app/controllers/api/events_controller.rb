class Api::EventsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @events = Event.all
    render 'index.json.jbuilder'
  end

  def create
    event = Event.new(
      name: params[:name],
      date: params[:date],
      category: params[:category],
      location: params[:location]
    )

    if event.save
      render json: {message: 'Event created successfully'}, status: :created
    else
      render json: {errors: event.errors.full_messages}, status: :bad_request
    end
  end

  def show
    # check_user_event
      @event = Event.find(params[:id])
      render 'show.json.jbuilder'
  end

end
