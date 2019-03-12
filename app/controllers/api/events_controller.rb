class Api::EventsController < ApplicationController

  def index
    @events = Events.all
    render 'index.json.jbuilder'
  end

  def show
    @event = Event.find(params[:id])
    render 'show.json.jbuilder'
  end

end
