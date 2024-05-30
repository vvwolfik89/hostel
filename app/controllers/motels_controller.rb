class MotelsController < ApplicationController
  def index
    @motels = Motel.all
  end

  def new
    @motel = Motel.new
  end

  def create
    @motel = Motel.new(resource_params)

    respond_to do |format|
      if @motel.save
        format.html { redirect_to @motel, notice: 'Dot was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: :edit }
        format.json { render json: @motel.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
    @motel = Motel.find(params[:id])
  end

  def edit
    @motel = Motel.find(params[:id])
  end

  def update
    @motel = Motel.find(params[:id])
    respond_to do |format|
      if @motel.update(resource_params)
        format.html { redirect_to @motel, notice: 'Motel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: :edit }
        format.json { render json: @motel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @motel = Motel.find(params[:id])
    @motel.destroy
    respond_to do |format|
      format.html { redirect_to motels_url }
      format.json { head :no_content }
    end
  end

  private

  def resource_params
    permited_fields = [ :name, :description, :country_id ]
    params.require(:motel).permit(permited_fields)
  end
end
