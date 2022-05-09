class HasAndBelongsToMany::SectorsController < ApplicationController
  before_action :set_sector, only: %i[ show edit update destroy ]

  # GET /sectors or /sectors.json
  def index
    @sectors = Sector.all
  end

  # GET /sectors/1 or /sectors/1.json
  def show
  end

  # GET /sectors/new
  def new
    @sector = Sector.new
  end

  # GET /sectors/1/edit
  def edit
  end

  # POST /sectors or /sectors.json
  def create
    @sector = Sector.new(sector_params)
    @sector.industries << Industry.where(id: params[:sector][:industry_ids])
    respond_to do |format|
      if @sector.save
        format.html { redirect_to has_and_belongs_to_many_sector_url(@sector), notice: "Sector was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sectors/1 or /sectors/1.json
  def update
    @sector.industries.destroy_all
    @sector.industries << Industry.where(id: params[:sector][:industry_ids])
    respond_to do |format|
      if @sector.update(sector_params)
        format.html { redirect_to has_and_belongs_to_many_sector_url(@sector), notice: "Sector was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sectors/1 or /sectors/1.json
  def destroy
    @sector.destroy

    respond_to do |format|
      format.html { redirect_to sectors_url, notice: "Sector was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sector
      @sector = Sector.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sector_params
      params.require(:sector).permit(:name)
    end
end
