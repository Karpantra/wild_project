class AssetsController < ApplicationController

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
    @product = Product.new(asset_params)
    @product.user = current_user
    if @product.save
      redirect_to asset_path(@product)
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
      redirect_to asset_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @restaurant.destroy

    redirect_to asset_path(@product)
  end

  private

  def asset_params
    params.require(:asset).permit(:address, :city, :title, :price, :description, :capacity)
  end
end
