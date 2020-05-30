class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @address= current_user.address
  end
end
