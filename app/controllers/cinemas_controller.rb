class CinemasController < ApplicationController
  before_action :set_cinema, only: %i[show update destroy]

  def index
    cinemas = Cinema.all
    render json: cinemas
  end

  def show
    render json: @cinema
  end

  def create
    @cinema = Cinema.new(cinema_params)
    if @cinema.save
      render json: @cinema, status: :created
    else
      render json: { errors: @cinema.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @cinema.update(cinema_params)
      render json: @cinema
    else
      render json: { errors: @cinema.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @cinema.destroy
  end

  private
  def set_cinema
    @cinema = Cinema.find(params[:id])
  end

  def cinema_params
    params.expect(cinema: [ :name, :address, :cnpj, :email, :city_id, :description, :phone, :logo ])
  end
end
