class HasAndBelongsToMany::IndustriesController < ApplicationController
  before_action :set_industry, only: %i[ show edit update destroy ]

  # GET /industries or /industries.json
  def index
    @industries = Industry.all
  end

  # GET /industries/1 or /industries/1.json
  def show
  end

  # GET /industries/new
  def new
    @industry = Industry.new
  end

  # GET /industries/1/edit
  def edit
  end

  # POST /industries or /industries.json
  def create
    @industry = Industry.new(industry_params)
    @industry.sectors << Sector.where(id: params[:industry][:sector_ids])
    respond_to do |format|
      if @industry.save
        format.html { redirect_to has_and_belongs_to_many_industry_url(@industry), notice: "Industry was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /industries/1 or /industries/1.json
  def update
    # raise "He"
    respond_to do |format|
      @industry.sectors.destroy_all
      @industry.sectors << Sector.where(id: params[:industry][:sector_ids])
      if @industry.update(industry_params)
        format.html { redirect_to has_and_belongs_to_many_industry_url(@industry), notice: "Industry was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industries/1 or /industries/1.json
  def destroy
    @industry.destroy

    respond_to do |format|
      format.html { redirect_to has_and_belongs_to_many_industries_url, notice: "Industry was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industry
      @industry = Industry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def industry_params
      params.require(:industry).permit(:name, :email)
    end
end
