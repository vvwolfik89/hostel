class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def new
    @service = Service.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  def create
    @service = Service.new(resource_params)
    @service.image.attach(params[:image])



    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Dot was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
    @service = Service.find(params[:id])
  end

  def edit
    @service = Service.find(params[:id])
    # service = SaveGeoPositionService.new(
    #   # locatable: locatable,
    #   latitude: params[:latitude],
    #   longitude: params[:longitude]
    # )
  end

  def update
    @service = Service.find(params[:id])
    @service.image.attach(params[:image])


    respond_to do |format|
      if @service.update(resource_params)
        format.html { redirect_to @service, notice: 'Motel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    respond_to do |format|
      format.html { redirect_to motels_url }
      format.json { head :no_content }
    end
  end

  private

  def resource_params
    permited_fields = [ :title, :description, :image ]
    params.require(:service).permit(permited_fields)
  end
end
