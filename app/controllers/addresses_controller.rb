class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    binding.pry
    @address = Address.new(save_params)
    @address.save!
    redirect_to step4_signup_index_path 
  end

def save_params
  params.require(:address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_cord,
                                   :prefecture_id, :city, :street_num, :building, :phone_num).merge(user_id: 1)
end



end