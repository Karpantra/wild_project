class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]

  def index
    search = params[:product][:search]
    if search.to_s.size > 0
      #raise
      @products= Product.near(search, 10).where.not(latitude: nil, longitude: nil)
         @hash = Gmaps4rails.build_markers(@products) do |product, marker|
         marker.lat product.latitude
         marker.lng product.longitude
    #   filter product where city = search
      end
    else
      @products = Product.where.not(latitude: nil, longitude: nil)
      @hash = Gmaps4rails.build_markers(@products) do |product, marker|
        marker.lat product.latitude
        marker.lng product.longitude
      # marker.infowindow render_to_string(partial: "/products/map_box", locals: { product: product })
      end
    # raise
    end
  end

  def show
    @product = Product.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @reviews = Review.all
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
    params.require(:product).permit(:address, :city, :title, :price, :description, :capacity, :category, :latitude, :longitude, :seed_picture, photos: [])
  end
end

