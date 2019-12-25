class GoodsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    if product.goods.where(user_id: current_user.id).exists?
      good = current_user.goods.find_by(product_id: product.id)
      good.destroy
    else
      good = current_user.goods.new(product_id: product.id)
      good.save!
    end
    redirect_to product_path(params[:product_id])
  end

end
