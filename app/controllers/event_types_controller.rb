class EventTypesController < ApplicationController
  before_action :set_event_type, only: [:show]
  def index
    @event_types = EventType.all
    render json: @event_types
  end

  def show
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

end
