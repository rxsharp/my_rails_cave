class LearningStatusesController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_learning_status, only: [:show, :edit, :update, :destroy]

  # GET /learning_statuses
  # GET /learning_statuses.json
  def index
    @learning_statuses = LearningStatus.all
  end

  # GET /learning_statuses/1
  # GET /learning_statuses/1.json
  def show
  end

  # GET /learning_statuses/new
  def new
    @learning_status = LearningStatus.new
  end

  # GET /learning_statuses/1/edit
  def edit
  end

  # POST /learning_statuses
  # POST /learning_statuses.json
  def create
    @learning_status = LearningStatus.new(learning_status_params)
    @learning_status.user = current_user

    respond_to do |format|
      if @learning_status.save
        format.html { redirect_to @learning_status, notice: 'Learning status was successfully created.' }
        format.json { render :show, status: :created, location: @learning_status }
      else
        format.html { render :new }
        format.json { render json: @learning_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_statuses/1
  # PATCH/PUT /learning_statuses/1.json
  def update
    respond_to do |format|
      if @learning_status.update(learning_status_params)
        format.html { redirect_to @learning_status, notice: 'Learning status was successfully updated.' }
        format.json { render :show, status: :ok, location: @learning_status }
      else
        format.html { render :edit }
        format.json { render json: @learning_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_statuses/1
  # DELETE /learning_statuses/1.json
  def destroy
    @learning_status.destroy
    respond_to do |format|
      format.html { redirect_to learning_statuses_url, notice: 'Learning status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @learning_status.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_status
      @learning_status = LearningStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learning_status_params
      params.require(:learning_status).permit(:learning_status, :user_id)
    end
end
