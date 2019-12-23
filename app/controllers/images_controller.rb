class ImagesController < ApplicationController

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to edit_product_path(@image.product.id)
  end
end
