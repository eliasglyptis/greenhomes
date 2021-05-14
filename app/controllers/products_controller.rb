class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_product, except: [:new, :create]
  before_action :is_authorised, only: [:edit, :update]

  def new
    @product = current_user.products.build
    @categories = Category.all
  end

  def create
    @product = current_user.products.build(product_params)

    if @product.save
      @product.variants.create(Variant.variant_types.values.map{ |x| {variant_type: x} })
      redirect_to edit_product_path(@product), notice: "Done..."
    else
      redirect_to request.referrer, flash: { error: @product.errors.full_messages }
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def is_authorised
    redirect_to root_path, alert: "Hmm...Looks like you don't have permission to do this." unless current_user.id == @product.user_id
  end

  private
    def product_params
      params.require(:product).permit(:title, :video, :description, :active, :category_id, :has_single_variant, variants_attributes: [:id, :title, :description, :variant_number, :variant_type])
    end
end
