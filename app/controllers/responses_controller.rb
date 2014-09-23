class ResponsesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_response, only: [:show, :edit, :update, :destroy, :score, :results]
  before_action :authenticate_user!, except: [:new, :show, :edit, :create, :update]
  before_action :require_admin!, only: [:destroy]
  
  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all.map(&:decorate)
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    
  end

  def score
    score = @response.scores.find_or_create_by(user_id: current_user.id)

    score.populate_ratings if score.ratings.empty?
    score.save
    redirect_to [@response, score]
  end

  def results
    @metrics = Metric.all
    @scores = @response.valid_scores
  end

  # GET /responses/new
  def new
    @closed = true
    @response = Response.new
    @response.populate_answers
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:name, :email, answers_attributes: [:id, :text, :question_id])
    end
end
