class ProductsController < ApplicationController
  before_action :before_params

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(save_params)
    @images = image_params

    # 子、孫カテゴリ
    if !params.permit(:grandchild_category_id)[:grandchild_category_id].blank?
      @product[:category_id] = params.permit(:grandchild_category_id)[:grandchild_category_id]
    elsif !params.permit(:child_category_id)[:child_category_id].blank?
      @product[:category_id] = params.permit(:child_category_id)[:child_category_id]
    end

    # ブランド
    if Brand.where(name: brand_params).blank?
      # DBにない場合
      @product[:brand_id] = Brand.where(name: "").ids[0]
    else
      # DBにある場合
      @product[:brand_id] = Brand.where(name: brand_params).ids[0]
    end

    # 保存処理
    if @product.save
      if @images.blank?
        redirect_to new_product_path
      else
        @images[:images].each do |image|
          Image.create(image: image,product_id: @product.id)
        end
        redirect_to products_path
      end
    else
      redirect_to new_product_path
    end
  end

  def index
    @categories = Category.all.limit(4).includes(:products => :images)
    @brands = Brand.all.limit(4).includes(:products => :images)
  end

  def get_child_category
    respond_to do |format|
      format.html
      format.json do
        @childs = Category.find(params[:parent_id]).children
      end
    end
  end

  def get_grandchild_category
    respond_to do |format|
      format.html
      format.json do
        @grandchilds = Category.find(params[:child_id]).children
      end
    end
  end

  private

  def before_params
    @category = Category.where(ancestry: nil)

    @condition = [["新品、未使用"], ["未使用に近い"], ["目立った傷や汚れなし"], ["やや傷や汚れあり"], ["傷や汚れあり"], ["全体的に状態が悪い"]]
    @shipping_charge = [["送料込み(出品者負担)"], ["着払い(購入者負担)"]]
  
    prefs = Prefecture.all
    @prefecture = []
    prefs.each do |pref|
      @prefecture << [pref.name, pref.id]
    end
    @prefecture << ["未定", 99]

    @days_before_skipment = [["1~2日で発送"], ["2~3日で発送"], ["4~7日で発送"]]
  end

  def save_params
    params.permit(:name, :information, :category_id, :condition, :shipping_charge, :prefecture_id,
                  :brand_id, :days_before_skipment, :price).merge(user_id: current_user.id)
  end

  def brand_params
    params.permit(:brand)[:brand]
  end

  def image_params
    params.require(:new_images).permit(images: [])
  end
  
  def num_params
    params.require(:new_images).permit(num: [])
  end

  def show
    @products = Product.all
  end
end
