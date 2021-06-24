class PurchasesController < ApplicationController
before_action :authenticate_user!, only: [:index, :create]
before_action :define_item, only: [:index, :create] 
before_action :move_to_index, only: [:index, :create]
before_action :move_to_index1, only: [:index, :create]

  def index
   @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def define_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id
    redirect_to root_path
    end
  end
  
  def move_to_index1
    if @item.purchase != nil
      redirect_to root_path
    end
  end

 
end
