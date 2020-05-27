class CardsController < ApplicationController
  require 'payjp'
  before_action :payjp_api_key, only: [:create, :edit, :destroy]

  def new
  end

  def create

    customer= Payjp::Customer.create(
      card: params['payjpToken'],
      metadata: {user_id: current_user.id}
    )

    @card= Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    if @card.save
      redirect_to edit_card_path(@card)
    else
      render :new
    end
  end

  def edit
    @card= current_user.card
    customer= Payjp::Customer.retrieve(@card.customer_id)
    @card = customer.cards.retrieve(@card.card_id)
  end

  def destroy
    @card= current_user.card
    customer= Payjp::Customer.retrieve(@card.customer_id)
    if @card.destroy
      customer.delete
    end
  end

  private

  def payjp_api_key
    Payjp.api_key= Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
  end
end
