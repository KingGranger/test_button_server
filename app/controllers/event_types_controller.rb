class EventTypesController < ApplicationController
  before_action :set_event_type, only: [:show, :update, :destroy]
  def index
    @event_types = EventType.all
    render json: @event_types
  end

  def create
    @event_type = EventType.create(event_type_params)
    render json: @event_type
  end

  def show
    render json: @event_type
  end

  def update
    @event_type.update(event_type_params)
    render json: @event_type
  end

  def destroy
    @event_type.destroy
    render json: EventType.all
  end

  private

  def set_event_type
    @event_type = EventType.where(params[:id])
  end

  def event_type_params
    params.permit(:event_description, :is_deleted)
  end

end
