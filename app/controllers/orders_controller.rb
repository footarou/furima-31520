class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @shopper_info = ShopperInfo.new
    
  end

  def create
    @shopper_info = ShopperInfo.new(shopper_params)
    binding.pry
     if @shopper_info.valid?
       pay_item
       @shopper_info.save
       redirect_to root_path
     else
       render action: :index
     end
  end

  private

  def shopper_params
    params.require(:shopper_info).permit(:zip_code, :prefecture_id, :municipality, :address, :building, :phone_no).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end 
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_5a946b0c90462a6d8febf1a1"
    Payjp::Charge.create(
      amount: Item.find(shopper_params[:item_id]).price,
      card: shopper_params[:token],
      currency: 'jpy'
    )      
  end

end

