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
    @asset.save

    # redirect_to ? A définir
  end

  def edit

  end

  def update
    @asset = Asset.find(params[:id])
    @asset.update(asset_params)

    # redirect to ? A définir.
  end

  private

  def asset_params
    params.require(:asset).permit(:address, :city, :)
  end
end
