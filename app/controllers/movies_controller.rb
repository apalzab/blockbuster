class MoviesController < ApplicationController

  def index
    @movies = Movie.paginate(page: params[:page], per_page: 15).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_purchase_options = @movie.movie_purchase_options
  end

end
