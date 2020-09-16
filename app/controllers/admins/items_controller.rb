class Admins::ItemsController < ApplicationController
  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
  end

  def update
  end

  private
  def product_params
    params.require(:item).permit(:image_id,:name,:introduction,:genre_id,:price,:is_active)
  end
end
