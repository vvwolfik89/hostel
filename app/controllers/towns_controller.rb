class TownsController < ApplicationController
  # load_and_authorize_resource

  def index
    @towns = Town.all
  end

  def new
    @town = Town.new
  end

  def create
    @town = Town.new(resource_params)

    respond_to do |format|
      if @town.save
        format.html { redirect_to @town, notice: 'Dot was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: :edit }
        format.json { render json: @town.errors, status: :unprocessable_entity }
      end
    end


  end

  def show
    @town = Town.find(params[:id])
  end

  def edit
    @town = Town.find(params[:id])
  end

  def update
    @town = Town.find(params[:id])
    respond_to do |format|
      if @town.update(resource_params)
        format.html { redirect_to @town, notice: 'Town was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: :edit }
        format.json { render json: @town.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @town = Town.find(params[:id])
    @town.destroy
    respond_to do |format|
      format.html { redirect_to towns_url }
      format.json { head :no_content }
    end
  end

  private

  def resource_params
    permited_fields = [ :name, :description, :country_id ]
    params.require(:town).permit(permited_fields)
  end
end
