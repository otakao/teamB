class AddressesController < ApplicationController
  before_action :set_params, only: [:edit, :update]

  def new
    @address= Address.new
  end

  def create
    @address= Address.new(address_params)
    if @address.save
      redirect_to root_path, notice: '保存しました'
    else
      render :new, alert: '必須項目に記入してください'
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to root_path, notice: '変更しました'
    else
      render :edit, alert: '変更に失敗しました'
    end
  end

  private
  
  def address_params
    params.require(:address).permit(:last_name, :first_name, :postal_code, :prefecture_name, :city, :street, :building, :tel).merge(user_id: current_user.id)
  end

  def set_params
    @address= Address.find(params[:id])
  end
end
