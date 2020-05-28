class ItemsController < ApplicationController

  def index
    @items = Item.all
    @images = ItemImage.all
  end

  def new
  end
  


  def show
    @item = Item.find(params[:id])
  end
end

