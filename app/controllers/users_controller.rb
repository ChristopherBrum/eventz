# frozen_string_literal: true

class UsersController < ApplicationController # rubocop:disable Style/Documentation
  # before_action :set_user, only: [:show, :update, :destroy]
  before_action :require_signin, except: %i[new create destroy]
  before_action :require_correct_user, only: %i[edit update]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by!(slug: params[:id])
    @registrations = @user.registrations
    @liked_events = @user.liked_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'Thanks for signing up!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Account successfully updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to events_url, status: :see_other,
                            alert: 'Account successfully deleted!'
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

  def require_correct_user
    @user = User.find_by!(slug: params[:id])
    p "current user: #{@user}"
    redirect_to events_url unless current_user?(@user)
  end
end
