class UsersController < ApplicationController
  def show
    # @user = User.find(params[:id])
    @user = current_user
    @address= current_user.address
  end
end
