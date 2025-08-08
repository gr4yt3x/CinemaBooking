class MovieSessionsController < ApplicationController
  before_action :set_movie_session, only: %i[show update destroy]

  def index
    movie_sessions = MovieSession.active
    render json: movie_sessions
  end

  def show
    render json: @movie_session
  end

  def create
    @movie_session = MovieSession.new(movie_session_params)
    if @movie_session.save
      render json: @movie_session, status: :created
    else
      render json: { errors: @movie_session.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @movie_session.update(movie_session_params)
      render json: @movie_session
    else
      render json: { errors: @movie_session.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @movie_session.update(is_active: false)
    head :no_content
  end

  private

  def set_movie_session
    @movie_session = MovieSession.find(params[:id])
  end

  def movie_session_params
    params.require(:movie_session).permit(
      :movie_id, :hall_id, :start_time, :end_time,
      :language, :subtitles, :price_full, :price_half
    )
  end
end
