class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    #@item = Item.all
  end

  private
   def donation_params
    params.require(:user).permit(:email, :password, :family_name, :first_name, :family_name_kana, :first_name_kana)
  end
end
