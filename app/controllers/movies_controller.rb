class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    # this one doesn't raise an exception 
    # movie_params = params[:movie].permit(:title, :description, :rating, :released_on, :total_gross)
    # this one is if you want to permit all attributes:
    # movie_params = params.require(:movie).permit!
    # this one raises exceptions
    movie_params = params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross)
    @movie.update(movie_params)
    redirect_to @movie
  end
end
