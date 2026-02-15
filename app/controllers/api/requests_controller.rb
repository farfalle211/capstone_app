class Api::RequestsController < ApplicationController

def index
  @requests = Request.all
  render 'index.json.jbuilder'
end

 def create
  #these params below could be string query, url segement or form params. They will be form params from vue.js params hash

  group = Group.find(params.fetch(:group_id))
  user_event = UserEvent.find_by(event_id: group.event.id, user_id: current_user.id)

   @request = Request.new(
     user_event_id: user_event.id,
     group_id: params.fetch(:group_id)  #this can be group_id: params[:group_id] or group_id: group.id
   )

   if (current_user.id != group.creater_id) && (group.open == true)
     @request.save
     render 'show.json.jbuilder'
   else
     render json: {errors: @request.errors.full_messages}, status: :bad_request
   end
 end

  def show
    @request = Request.find(params.fetch(:id))
    render 'show.json.jbuilder'
  end


  def update   #this particular method should be for the admin only to update the confirmed enum
    # creater_id = params[:creater_id]

    @request = Request.find(params.fetch(:id))
    creater_id = @request.group.creater.id

    @request.confirmed = params.fetch(:confirmed, @request.confirmed)

    if current_user.id == creater_id
      @request.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @request.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    request = Request.find(params.fetch(:id))
    request.destroy
    render json: {message: "Successfully removed request"}
  end
end
