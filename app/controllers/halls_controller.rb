class HallsController < ApplicationController
  before_action :set_hall, only: %i[ show update destroy ]

  def index
    @halls = Hall.all

    render json: @halls
  end

  def show
    render json: @hall
  end

  def create
    @hall = Hall.new(hall_params)

    if @hall.save
      render json: @hall, status: :created
    else
      render json: { errors: @hall.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @hall.update(hall_params)
      render json: @hall
    else
      render json: { errors: @hall.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @hall.destroy!
  end

  private
    def set_hall
      @hall = Hall.find(params.expect(:id))
    end

    def hall_params
      params.expect(hall: [ :cinema_id, :name, :total_seats ])
    end
end
