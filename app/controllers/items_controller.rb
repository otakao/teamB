class ItemsController < ApplicationController
  require 'payjp'

  before_action :set_params, only: [:show, :destroy, :edit, :update, :confirm, :pay]

  before_action :set_card, only: [:confirm, :pay]
  before_action :payjp_api_key, only: [:confirm, :pay]

  def index
    @items = Item.includes(:saler)

    @images = [] 
    @items.each do |item|
      @images << item.item_images.first    

    end
  end

  def new
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    @item = Item.new
    @item.item_images.new
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
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def show
    @category= @item.category
    @images= @item.item_images
    @first_image= @images.first
    @other_images= @images.where.not(id: @images.select('min(id)'))
    @comment = Comment.new
    @comments = @item.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    grandchild_category = @item.category
    child_category = grandchild_category.parent

    @category_parent_array = ['選択してください']
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end

  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path(@item)
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
    @image= @item.item_images.first
    @address= current_user.address
    if @card.present?
      customer= Payjp::Customer.retrieve(@card.customer_id)
      @card= customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    if @card.present?
      @item.update(buyer_id: current_user.id)

      charge= Payjp::Charge.create(
        amount: @item.price,
        customer: @card.customer_id,
        currency: 'jpy',
      )
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :discription, :condition, :postage, :prefecture, :shipping_date, :price, :category_id, :brand_id, :buyer_id, item_images_attributes: [ :image, :_destroy, :id]).merge(saler_id: current_user.id)
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