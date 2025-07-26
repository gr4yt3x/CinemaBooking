class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show update destroy]

  def index
    movies = Movie.all
    render json: movies
  end

  def show
    render json: @movie
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, status: :created
    else
      render json: { errors: @movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: { errors: @movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.expect(movie: [
      :title,
      :description,
      :duration_minutes,
      :genre,
      :director,
      :cast,
      :language,
      :trailer,
      :image,
      :banner,
      :release_date,
      :age_rating
    ])
  end
end
