class ProductsController < ApplicationController

  def index
    @products = Product.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@products) do |product, marker|
      marker.lat product.latitude
      marker.lng product.longitude
      # marker.infowindow render_to_string(partial: "/products/map_box", locals: { product: product })
    end
    # raise
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
    @product.destroy

    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:address, :city, :title, :price, :description, :capacity, :category, :latitude, :longitude, photos: [])
  end
end
