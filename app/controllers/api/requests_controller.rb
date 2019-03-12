class Api::RequestsController < ApplicationController
 
 def create
  #these params below could be string query, url segement or form params. They will be form params from vue.js params hash 
  group = Group.find(params[:group_id]) #if this is going to be on the group show page, this will be an axios call with the group id that will populate here? passing along the params of the page you're currently on?
  user_event = UserEvent.find_by(event_id: group.event.id, user_id: current_user.id)

   request = Request.new(
     user_event: user_event.id,   #need to be on user event page
     group_id: params[:group_id] #this can be group_id: params[:group_id] or group_id: group.id
   )

   if request.save
     render json: {message: 'Request created successfully'}, status: :created
   else
     render json: {errors: request.errors.full_messages}, status: :bad_request
   end
 end

  def show
    @request = Request.find(params[:id])
    render 'show.json.jbuilder'
  end


  def update   #this particular method should be for the admin only to update the confirmed boolean
    @request = Request.find(params[:id])

    @request.confirmed = params[:confirmed] || @request.confirmed

    if @request.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @requests.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    request = Request.find(params[:id])
    request.destroy
    render json: {message: "Successfully removed request"}
  end
end
