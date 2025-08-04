class SeatsController < ApplicationController
  before_action :set_seat, only: %i[ show update destroy ]

  def index
    @seats = Seat.all

    render json: @seats
  end

  def show
    render json: @seat
  end

  def create
    @seat = Seat.new(seat_params)

    if @seat.save
      render json: @seat, status: :created
    else
      render json: { errors: @seat.errors.full_message }, status: :unprocessable_entity
    end
  end

  def update
    if @seat.update(seat_params)
      render json: @seat
    else
      render json: { errors: @seat.errors.full_message }, status: :unprocessable_entity
    end
  end

  def destroy
    @seat.destroy!
  end

  private
    def set_seat
      @seat = Seat.find(params.expect(:id))
    end

    def seat_params
      params.expect(seat: [ :hall_id, :seat_number, :row, :column, :seat_type, :status ])
    end
end
