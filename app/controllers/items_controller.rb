class ItemsController < ApplicationController
  require 'payjp'
  before_action :set_params, only: [:show, :destroy, :confirm, :pay]
  before_action :set_card, only: [:confirm, :pay]
  before_action :payjp_api_key, only: [:confirm, :pay]

  def index
    @items = Item.includes(:saler)
    @images = ItemImage.all
  end

  def new
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    @items = Item.new
    @items.item_images.new
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
    @category= @item.category
    @images= @item.item_images
    @first_image= @images.first
    @other_images= @images.where.not(id: @images.select('min(id)'))
  end

  def edit
    @items = Item.find(params[:id])
  end

  def update
    if @items.update(item_params)
      redirect_to root_path
    else
      render edit_item_path
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else 
      render item_path(@item)
    end
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

  def item_params
    params.require(:item).permit(:name, :discription, :condition, :postage, :prefecture, :shipping_date, :price, :category_id, :brand_id, item_images_attributes: [ :image, :_destroy, :id]).merge(saler_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end

  def set_card
    @card= current_user.card
  end

  def payjp_api_key
    Payjp.api_key= Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
  end
end