class AssetsController < ApplicationController

  def index
    @assets = Asset.all
  end

  def show
    @asset = Asset.find(params[:id])
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.new(asset_params)
    @asset.user = current_user
    if @asset.save
      redirect_to asset_path(@asset)
    else
      render :new
    end
  end

  def edit
    @asset = Asset.find(params[:id])
  end

  def update
    @asset = Asset.find(params[:id])
    @asset.user = current_user
    if @asset.update
      redirect_to asset_path(@asset)
    else
      render :edit
    end
  end

  def destroy
    @asset = Asset.find(params[:id])
    @restaurant.destroy

    redirect_to asset_path(@asset)
  end

  private

  def asset_params
    params.require(:asset).permit(:address, :city, :title, :price, :description, :capacity)
  end
end
