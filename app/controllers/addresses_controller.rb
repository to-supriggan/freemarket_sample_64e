class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(save_params)

    if @address.save
      redirect_to new_card_path
    else
      render "new" 
    end
  end

  private
  def save_params
    params.require(:address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_cord,
                                    :prefecture_id, :city, :street_num, :building, :phone_num).merge(user_id: current_user.id)
  end



end