# frozen_string_literal: true

class SessionsController < ApplicationController # rubocop:disable Style/Documentation
  def new; end

  def create # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    user = User.find_by(email: params[:username_or_email]) ||
           User.find_by(username: params[:username_or_email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to (session[:intended_url] || user),
                  notice: "Welcome back, #{user.name}!"
      session[:intended_url] = nil
    else
      flash.now[:alert] = 'Invalid email/password combination!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to events_url, status: :see_other, notice: "You're now signed out!"
  end
end
