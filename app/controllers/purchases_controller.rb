class PurchasesController < ApplicationController
before_action :authenticate_user!, only: [:index, :create]
before_action :move_to_index, only: :index
before_action :move_to_index1, only: :index

  def index
   @item = Item.find(params[:item_id])
   @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
    redirect_to root_path
    end
  
  def move_to_index1
    @item = Item.find(params[:item_id])
    if user_signed_in?
    if @item.purchase != nil
      redirect_to root_path
    end
    end
  end


  end

 
end
