class ReponsesController < ApplicationController
  before_action :set_reponse, only: [:show, :edit, :update, :destroy]

  # GET /reponses
  # GET /reponses.json
  def index
    @reponses = Reponse.all
  end

  # GET /reponses/1
  # GET /reponses/1.json
  def show
  end

  # GET /reponses/new
  def new
    @reponse = Reponse.new
  end

  # GET /reponses/1/edit
  def edit
  end

  # POST /reponses
  # POST /reponses.json
  def create
    @reponse = Reponse.new(reponse_params)

    respond_to do |format|
      if @reponse.save
        format.html { redirect_to @reponse, notice: 'Reponse was successfully created.' }
        format.json { render :show, status: :created, location: @reponse }
      else
        format.html { render :new }
        format.json { render json: @reponse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reponses/1
  # PATCH/PUT /reponses/1.json
  def update
    respond_to do |format|
      if @reponse.update(reponse_params)
        format.html { redirect_to @reponse, notice: 'Reponse was successfully updated.' }
        format.json { render :show, status: :ok, location: @reponse }
      else
        format.html { render :edit }
        format.json { render json: @reponse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reponses/1
  # DELETE /reponses/1.json
  def destroy
    @reponse.destroy
    respond_to do |format|
      format.html { redirect_to reponses_url, notice: 'Reponse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reponse
      @reponse = Reponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reponse_params
      params.require(:reponse).permit(:name, :email)
    end
end
