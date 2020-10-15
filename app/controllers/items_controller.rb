class ItemsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def new
    @item = Item.new
  end

  def index
    @item = Item.all.order('created_at DESC')
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def set_params
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :title, :text, :genre_id, :status_ah_id, :shipping_charges_ah_id, :shipment_source_ah_id, :shipping_days_ah_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && current_user
  end
end
