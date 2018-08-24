class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  def index
    if params[:id] || params[:is_deleted]
      @event = Event.with_id(params[:id]).with_is_deleted(params[:is_deleted])
    else
      @event = Event.all
    end
    render json: @event
  end


  def create
    @event = Event.create(event_params)
    render json: @event
  end

  def show
    render json: @event
  end

  def update
    @event.update(event_params)
    render json: @event
  end

  def destroy
    @event.destroy
    render json: Event.all
  end

  private

  def set_event
    @event = Event.where(params[:id])
  end

  def event_params
    params.permit(:max_winners, :event_datetime, :arena_id, :event_type_id, :is_deleted)
  end
end
