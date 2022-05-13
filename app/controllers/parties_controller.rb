class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieService.get_movie(params[:movie_id])
    @users = User.all
  end
end
