class CardsController < ApplicationController
  require 'payjp'
  before_action :payjp_api_key, only: [:create, :edit, :update]

  def new
  end

  def create

    customer= Payjp::Customer.create(
      card: params['payjpToken'],
      metadata: {user_id: current_user.id}
    )

    @card= Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    unless @card.save
      render :new
    end
  end

  def edit
    @card= current_user.card
  end

  def update
    
  end

  private

  def payjp_api_key
    Payjp.api_key= Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
  end
end
