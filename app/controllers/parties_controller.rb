class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieService.get_movie(params[:movie_id])
    @users = User.all
  end

  def create
    user = User.find(params[:user_id])
    user.parties.create!(party_params)
    redirect_to "/users/#{@user.id}"
  end

  private

  def party_params
    params.permit("start_time(4i)", "start_time(5i)", :movie_id, :length, :date)
  end
end
