class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/register"
      flash[:message] = user.errors.full_messages.to_sentence.to_s
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
    @facade = MovieFacade.new
  end

  def movies
    @user = User.find(params[:id])
    @facade =
      if params[:title].nil?
        MovieFacade.new.top_movies
      else
        MovieFacade.new.search(params[:title])
      end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
