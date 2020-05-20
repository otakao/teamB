class ItemsController < ApplicationController

  def index
    @items = Item.all
    @images = ItemImage.all
    @parents = Category.where(ancestry: nil)
  end

  def new
  end
  

  def show
    @item = Item.find(params[:id])
  end

end

