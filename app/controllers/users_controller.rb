class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/dashboard"
    else
      redirect_to "/register"
      flash[:message] = user.errors.full_messages.to_sentence.to_s
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def discover
    @user = User.find(session[:user_id])
    @facade = MovieFacade.new
  end

  def movies
    @user = User.find(session[:user_id])
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
