class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    @item.update(item_params)
    redirect_to item_path
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :memo, :category_id, :condition_id, :price, :days_to_ship_id, :shipping_fee_id,
                                 :ship_from_id, :ship_to_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
