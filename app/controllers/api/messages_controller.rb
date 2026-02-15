class Api::MessagesController < ApplicationController
  def send_message
    group = Group.find(params.fetch(:group_id))
    group_phone_numbers = group.users.pluck(:phone_number)
    group_phone_numbers << group.creater.phone_number
    
    group_phone_numbers = [params[:phone_number]] if params[:phone_number]

    
    client = Twilio::REST::Client.new

    group_phone_numbers.each do |phone_number|
      client.messages.create({
        from: Rails.application.credentials.twilio_phone_number,
        to: phone_number,
        body: params[:message]
      })
    end

    render json: {message: "sent"}
  end
end
