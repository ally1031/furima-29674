class OrderController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    #@orders = @room.orders.includes(:user)
  end

  def create
    @order = OrdersAddress.new(order_params)
    @order.save
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
     render 'index'
    end
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
     render 'index'
    end
  end

  private

  def order_params
    params.require(:orders_address).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number,:token).marge(user_id: current_user_id, item_id: params[:item.id],token: params[:token])
  end

  def pay_item
   Payjp.api_key = "sk_test_de58444b5c040a231a5ab73f"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end

#def index
#  @message = Message.new
#  @room = Room.find(params[:room_id])
#  @messages = @room.messages.includes(:user)
#end

#def create
#  @room = Room.find(params[:room_id])
#  @message = @room.messages.new(message_params)
#  @message.save
#  if @message.save
#    redirect_to room_messages_path(@room)
#  else
#    @messages = @room.messages.includes(:user)
#    render :index
#  end
#end

#private

#def message_params
#  params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
#end