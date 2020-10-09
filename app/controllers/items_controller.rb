class ItemsController < ApplicationController
  before_action :set_params,only:[:show]
  
  def new
    @item = Item.new
  end

  def index
    @item = Item.all.order("created_at DESC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def set_params
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :title, :text, :genre_id, :status_ah_id, :shipping_charges_ah_id, :shipment_source_ah_id, :shipping_days_ah_id, :price).merge(user_id: current_user.id,)
  end


end
