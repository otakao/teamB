class ItemsController < ApplicationController
  
  def index
    @items = Item.all
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

  def create
    @items = Item.new(item_params)
    if @items.save!
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :discription, :condition, :postage, :prefecture, :shipping_date, :price, :brand_id, item_images_attributes: [ :image, :_destroy]).merge(saler_id: current_user.id)
  end



 
end