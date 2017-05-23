class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.user = current_user
    if @product.update
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @restaurant.destroy

    redirect_to product_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:address, :city, :title, :price, :description, :capacity)
  end
end
