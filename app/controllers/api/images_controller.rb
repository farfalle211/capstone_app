class Api::ImagesController < ApplicationController

  def create
    @image = Image.new(
                        user_id: current_user.id,
                        image_url: params[:image_url]
                      )

    if @image.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @images.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @image = Image.find(params.fetch(:id))

    @image.image_url = params.fetch(:image_url, @image.image_url)

    if @image.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @images.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    image = Image.find(params.fetch(:id))
    image.destroy
    render json: {message: "Successfully removed image"}
  end
end
