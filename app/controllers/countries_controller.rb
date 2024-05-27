class CountriesController < ApplicationController
  # load_and_authorize_resource

  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(resource_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Dot was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end


  end

  def show
    @country = Country.find(params[:id])
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    respond_to do |format|
      if @country.update(resource_params)
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    respond_to do |format|
      format.html { redirect_to Countries_url }
      format.json { head :no_content }
    end
  end

  private

  def resource_params
    permited_fields = [ :title, :description ]
    params.require(:country).permit(permited_fields)
  end
end
