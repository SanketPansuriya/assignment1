class HasManyThrough::PhysiciansController < ApplicationController
  before_action :set_physician, only: %i[ show edit update destroy ]

  # GET /physicians or /physicians.json
  def index
    @physicians = Physician.all
  end

  # GET /physicians/1 or /physicians/1.json
  def show
  end

  # GET /physicians/new
  def new
    @physician = Physician.new
  end

  # GET /physicians/1/edit
  def edit
  end

  # POST /physicians or /physicians.json
  def create
    @physician = Physician.new(physician_params)

    respond_to do |format|
      if @physician.save
        format.html { redirect_to has_many_through_physician_url(@physician), notice: "Physician was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /physicians/1 or /physicians/1.json
  def update
    respond_to do |format|
      if @physician.update(physician_params)
        format.html { redirect_to has_many_through_physician_url(@physician), notice: "Physician was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physicians/1 or /physicians/1.json
  def destroy
    @physician.destroy

    respond_to do |format|
      format.html { redirect_to has_many_through_physicians_url, notice: "Physician was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_physician
      @physician = Physician.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def physician_params
  params.require(:physician).permit(:name, :email)
    end
end
