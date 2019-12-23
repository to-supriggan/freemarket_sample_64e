class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :before_params, only: [:new, :edit]
  before_action :set_product, only: [:edit, :update, :show]

  def new
    @product = Product.new
    @product.images.build
    @category = Category.where(ancestry: nil)

  end

  def create
    @product = Product.new(save_params)

    # 保存処理
    if @product.save
      params[:images][:image].each do |image|
        @product.images.create(image: image, product_id: @product.id)
      end
      redirect_to products_path
    else
      redirect_to new_product_path
    end
  end

  def edit
    # 現在のカテゴリ選択値
    @select_grandchild = Category.find(@product.category_id)
    @select_child = @select_grandchild.parent
    @select_parent = @select_child.parent

    # カテゴリ配列
    @category = Category.where(ancestry: nil)
    @child_category = @select_parent.children
    @grand_child_category = @select_child.children

    # ブランド名
    @brand_name = Brand.find(@product.brand_id).name
  end

  def update
    # 保存処理
    if @product.update(save_params)
      if params[:images].blank?
        # 新しい画像を登録しない場合
        redirect_to products_path  
      else
        # 新しい画像を登録する場合
        params[:images][:image].each do |image|
          @product.images.create(image: image, product_id: @product.id)
        end
        redirect_to products_path  
      end
    else
      redirect_to edit_product_path(params[:id])
    end
  end

  def index
    @categories = Category.all.limit(4).includes(:products => :images)
    @brands = Brand.all.limit(4).includes(:products => :images)
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments.order('created_at ASC')

    # 出品者の商品に対する評価を確認
    @ship_good = Product.where(user_id: current_user.id, evaluation: 0)
    @ship_nomal = Product.where(user_id: current_user.id, evaluation: 1)
    @ship_bad = Product.where(user_id: current_user.id, evaluation: 2)
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

  def set_product
    @product = Product.find(params[:id])
  end

  def before_params
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
    params.require(:product).permit(:name, :information, :category_id, :condition, :shipping_charge, :prefecture_id,
                  :days_before_skipment, :price, images_attributes: [:imgae, :id]).merge(user_id: current_user.id)

    # ブランド
    if Brand.where(name: brand_params).blank?
      # DBにない場合
      params.require(:product).permit(:name, :information, :category_id, :condition, :shipping_charge, :prefecture_id,
                                      :days_before_skipment, :price, images_attributes: [:imgae, :id]).merge(user_id: current_user.id, brand_id: Brand.where(name: "").first.id)
    else
      # DBにある場合
      params.require(:product).permit(:name, :information, :category_id, :condition, :shipping_charge, :prefecture_id,
                                      :days_before_skipment, :price, images_attributes: [:imgae, :id]).merge(user_id: current_user.id, brand_id: Brand.where(name: brand_params).first.id)
    end
  end

  def brand_params
    params.require(:product).permit(:brand)[:brand]
  end

  def num_params
    params.require(:new_images).permit(num: [])
  end
  require 'payjp'

  def purchase
    Payjp.api_key = Rails.application.credentials.aws[:api_secret_key]
    Payjp::Charge.create(
      amount: 809,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end
end
