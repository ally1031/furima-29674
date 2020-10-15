class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order = OrderAddress.new
    # @orders = @room.orders.includes(:user)
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類(日本円)
    )
  end
end

# def index
#  @message = Message.new
#  @room = Room.find(params[:room_id])
#  @messages = @room.messages.includes(:user)
# end

# def create
#  @room = Room.find(params[:room_id])
#  @message = @room.messages.new(message_params)
#  @message.save
#  if @message.save
#    redirect_to room_messages_path(@room)
#  else
#    @messages = @room.messages.includes(:user)
#    render :index
#  end
# end

# private

# def message_params
#  params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
# end
