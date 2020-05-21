class ItemsController < ApplicationController

  def index
    @items = Item.all
    @images = ItemImage.all
    @parents = Category.where(ancestry: nil)
  end

  def new
  end
  

  def show2
  end

end

