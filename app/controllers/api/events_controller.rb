class Api::EventsController < ApplicationController
  before_action :authenticate_user
  
  def index
    # @events = Event.all

    response = HTTP.get("https://api.seatgeek.com/2/events?geoip=true&client_id=#{ ENV["API_KEY"] }&client_secret=#{ ENV["API_SECRET"] }")

    api_event_hashes = response.parse.fetch("events", []).map do |event_hash|
      venue = event_hash.fetch("venue", {})
      loc = venue.fetch("location", {})
      {
        name: event_hash.fetch("title"),
        date: Time.strptime(event_hash.fetch("datetime_local"), "%Y-%m-%eT%H:%M:%S"),
        category: event_hash.fetch("type").gsub('_', " ").titleize,
        location: "#{venue.fetch('address', '')}, #{venue.fetch('extended_address', '')}",
        formatted: {
          date: Time.strptime(event_hash.fetch("datetime_local"), "%Y-%m-%eT%H:%M:%S").strftime("%A, %d %b %Y %l:%M %p")
        },
        latitude: loc.fetch("lat"),
        longitude: loc.fetch("lon")
      }
    end

    render json: api_event_hashes

    # render 'index.json.jbuilder'
  end

  def create
    @event = Event.find_or_create_by(
                                      name: params.fetch(:name),
                                      date: params.fetch(:date),
                                      category: params.fetch(:category),
                                      location: params.fetch(:location),
                                      latitude: params.fetch(:latitude),
                                      longitude: params.fetch(:longitude)
                                    )

    render 'show.json.jbuilder'
  end

  def show
    # check_user_event
      @event = Event.find(params.fetch(:id))
      render 'show.json.jbuilder'
  end

  private
end
