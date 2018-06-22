class DrawingsController < ApplicationController
  before_action :set_event_type, only: [:show, :update, :destroy]
  def index
    @drawings = Drawing.all
    render json: @drawings
  end

  def create
    @drawing = Drawing.create(drawing_params)
    render json: @drawing
  end

  def show
    render json: @drawing
  end

  def update
    @drawing.update(drawing_params)
    render json: @drawing
  end

  def destroy
    @drawing.destroy
    render json: Drawing.all
  end

  private

  def set_event_type
    @drawing = Drawing.where(params[:id])
  end

  def drawing_params
    params.permit(:event_id, :user_id, :is_drawing_winner, :drawing_datetime, :is_deleted)
  end

end
