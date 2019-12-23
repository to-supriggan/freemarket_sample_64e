class ImagesController < ApplicationController

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    @product_id = @image.product_id
    redirect_to "/products/#{@product_id}/edit"
  end
end
