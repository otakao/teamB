# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def new
  end

  def destroy
    redirect_to root_path
  end

  # def create
  #   user =User.find_by(email: session_params[:email])

  #   if user&.authenticate(session_params[:password])
  #     session[:user_id] = user.id
  #     redirect_to root_path, notice: 'ログインしました。'
  #   else
  #     render :new
  #   end
  # end

  # private
  # def session_params
  #   params.permit(:email, :password)
  # end

 end
