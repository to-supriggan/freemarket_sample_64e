class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :pay, :purchase_confirmation, :done, :destroy]
  before_action :before_params, only: [:new, :edit]
  before_action :set_product, only: [:edit, :update, :show, :destroy]

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
    @parents = Category.where(ancestry: nil) #親カテゴリーを取得
    @categoryResponse = {} #ビューに渡すハッシュを初期化
    @parents.each do |category| #取得したカテゴリーでループ
      products =[] #商品を取得する配列を初期化※１
      category.children.each do |childCategory| #子カテゴリーでループ
        childCategory.children.each do |grandChildCategory| #孫カテゴリーでループ
          products.concat(grandChildCategory.products) #孫カテゴリーに紐づく商品をループし、「※１」の配列に追加※２
        end
      end
      #ここで「※２」で取得した商品一覧（ハッシュ）を登録日でソート（降順）する予定
      @categoryResponse.store(category.genre.to_sym, products.sort.reverse) #ソートした商品をkey名「親カテゴリー名」でハッシュに追加
    end
    @brands = Brand.all.limit(4).includes(:products => :images)
  end

  def show
    @comments = @product.comments.order('created_at ASC')

    # 出品者の商品に対する評価を確認
    @ship_good = Product.where(user_id: @product.user_id, evaluation: 0)
    @ship_nomal = Product.where(user_id: @product.user_id, evaluation: 1)
    @ship_bad = Product.where(user_id: @product.user_id, evaluation: 2)
  end

  require 'payjp'

  def pay
    @product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:api_secret_key] 
    Payjp::Charge.create(
      amount: @product.price,
      customer: card.customer_id, #customer.idかtokenどちらかが必須 今回はcustomer
      currency: 'jpy'
    )
    Dealing.create(product_id: @product.id, user_id: current_user.id, status: 2)
    redirect_to done_products_path(product_id: @product.id)
  end

  def done
    @product = Product.find(params[:product_id])
  end

  def purchase_confirmation
    @product = Product.find(params[:product_id])
    @user = User.find(current_user.id)
    @card = Card.find_by(user_id: current_user.id)
    if @card.present?
      Payjp.api_key = Rails.application.credentials.payjp[:api_secret_key] 
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @card_information.brand
        case @card_brand
        when "Visa"
          @card_src = '//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?1398199435'
        when "JCB"
          @card_src = '//www-mercari-jp.akamaized.net/assets/img/card/jcb.svg?1398199435'
        when "MasterCard"
          @card_src = '//www-mercari-jp.akamaized.net/assets/img/card/master-card.svg?1398199435'
        when "American Express"
          @card_src = '//www-mercari-jp.akamaized.net/assets/img/card/american_express.svg?1398199435'
        when "Diners Club"
          @card_src = '//www-mercari-jp.akamaized.net/assets/img/card/dinersclub.svg?1398199435'
        when "Discover"
          @card_src = '//www-mercari-jp.akamaized.net/assets/img/card/discover.svg?1398199435'
        when "Saison"
          @card_src = '//www-mercari-jp.akamaized.net/assets/img/card/saison-card.svg?1398199435'
      end
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show 

    end
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

  def product_params
    params.require(:item).permit(
      :name,
      :text,
      :price,
    ).merge(user_id: current_user.id)
  end

  def before_params
    @category = Category.where(ancestry: nil)
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
end