class Admins::ItemsController < ApplicationController
  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_items_path
    else
      redirect_to new_admins_item_path
    end
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:introduction,:genre_id,:price,:is_active)
  end
end
