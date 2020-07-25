class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]

  # GET /assets
  # GET /assets.json
  def index
    @q = current_tenant.assets.ransack(params[:q])
    @assets = @q.result.page(params[:page])
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
  end

  # GET /assets/new
  def new
    @asset = current_tenant.assets.new
  end

  # GET /assets/1/edit
  def edit
  end

  # POST /assets
  # POST /assets.json
  def create
    @asset = current_tenant.assets.new asset_params

    respond_to do |format|
      if @asset.save
        format.html { redirect_to @asset, notice: 'Asset was successfully created.' }
        format.json { render :show, status: :created, location: @asset }
      else
        format.html { render :new }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @asset }
      else
        format.html { render :edit }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to assets_url, notice: 'Asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def sidebar
    :assets
  end

  def set_asset
    @asset = current_tenant.assets.find params[:id]
  end

  def asset_params
    params.require(:asset).permit(
      :name,
      :description,
      :model,
      :manufacturer,
      :purchase_date,
      :purchase_price,
      :serial_number,
      :warranty_date
    )
  end
end
