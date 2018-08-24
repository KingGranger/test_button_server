class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :update, :destroy]
  def index
    if params[:id] || params[:is_deleted]
      @image = Image.with_id(params[:id]).with_is_deleted(params[:is_deleted])
    else
      @image = Image.all
    end
    render json: @image
  end


  def create
    @image = Image.create(image_params)
    render json: @image
  end

  def show
    render json: @image
  end

  def update
    @image.update(image_params)
    render json: @image
  end

  def destroy
    @image.destroy
    render json: Image.all
  end

  private

  def set_image
    @image = Image.where(params[:id])
  end

  def image_params
    params.permit(:image_data, :is_deleted)
  end
end
