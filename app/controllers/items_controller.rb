class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :user_singed_in, only: [:edit, :update]

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
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def show
  end

  def update
    if @item.update(item_params)
       redirect_to item_path
    else
      render :edit
    end
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

  def user_singed_in
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path
    end 
  end

end
