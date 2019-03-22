class Api::EventsController < ApplicationController
  before_action :authenticate_user
  
  def index
    # @events = Event.all



    response = HTTP.get("https://api.seatgeek.com/2/events?geoip=true&client_id=#{ ENV["API_KEY"] }&client_secret=#{ ENV["API_SECRET"] }")

    api_event_hashes = response.parse["events"].map do |event_hash|
                                                  {
                                                    name: event_hash["title"],
                                                    date: Time.strptime(event_hash["datetime_local"], "%Y-%m-%eT%H:%M:%S"),
                                                    category: event_hash["type"].gsub('_', " ").titleize,
                                                    location: "#{event_hash['venue']['address']}, #{event_hash['venue']['extended_address']}",
                                                    formatted: {
                                                                date: Time.strptime(event_hash["datetime_local"], "%Y-%m-%eT%H:%M:%S").strftime("%A, %d %b %Y %l:%M %p")
                                                                }
                                                   }
                                                end

    render json: api_event_hashes


    # render 'index.json.jbuilder'
  end

  def create
    @event = Event.find_or_create_by(
                                      name: params[:name],
                                      date: params[:date],
                                      category: params[:category],
                                      location: params[:location]
                                    )

    render 'show.json.jbuilder'
  end

  def show
    # check_user_event
      @event = Event.find(params[:id])
      render 'show.json.jbuilder'
  end

end
