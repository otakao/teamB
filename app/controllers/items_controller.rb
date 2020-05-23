class ItemsController < ApplicationController

  def index
    @items = Item.all
    @images = ItemImage.all
  end

  def new
  end
  

  def show2
  end

end

