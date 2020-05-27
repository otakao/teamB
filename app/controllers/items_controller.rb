class ItemsController < ApplicationController
  require 'payjp'
  before_action :set_params, only: [:confirm, :pay]
  before_action :set_card, only: [:confirm, :pay]
  before_action :payjp_api_key, only: [:confirm, :pay]

  def index
    @items = Item.all
    @images = ItemImage.all
  end

  def new
  end
  

  def show2
  end

  def confirm
    if @card.present?
      customer= Payjp::Customer.retrieve(@card.customer_id)
      @card= customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @item.update(buyer_id: current_user.id)

    charge= Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy',
    )
  end

  private

  def set_params
    @item = Item.find(params[:id])
  end

  def set_card
    @card= current_user.card
  end

  def payjp_api_key
    Payjp.api_key= 'sk_test_6b4fc47bce523efc167dda60'
    # Payjp.api_key= Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
  end

end