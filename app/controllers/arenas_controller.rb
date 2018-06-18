class ArenasController < ApplicationController
  before_action :set_arena, only: [:show]
  def index
    @Arenas = Arena.all
    render json: @Arenas
  end

  def show
    render json: @arena
  end

  def destroy
    @arena.destroy
    render json: Arena.all
  end

  private

  def set_arena
    @arena = Arena.where(params[:id])
  end

end
