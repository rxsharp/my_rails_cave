class HubListsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_hub_list, only: [:show, :edit, :update, :destroy]

  # GET /hub_lists
  # GET /hub_lists.json
  def index
    @hub_lists = HubList.all
  end

  # GET /hub_lists/1
  # GET /hub_lists/1.json
  def show
  end

  # GET /hub_lists/new
  def new
    @hub_list = HubList.new
  end

  # GET /hub_lists/1/edit
  def edit
  end

  # POST /hub_lists
  # POST /hub_lists.json
  def create
    @hub_list = HubList.new(hub_list_params)
    @hub_list.user = current_user

    respond_to do |format|
      if @hub_list.save
        format.html { redirect_to @hub_list, notice: 'Hub list was successfully created.' }
        format.json { render :show, status: :created, location: @hub_list }
      else
        format.html { render :new }
        format.json { render json: @hub_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hub_lists/1
  # PATCH/PUT /hub_lists/1.json
  def update
    respond_to do |format|
      if @hub_list.update(hub_list_params)
        format.html { redirect_to @hub_list, notice: 'Hub list was successfully updated.' }
        format.json { render :show, status: :ok, location: @hub_list }
      else
        format.html { render :edit }
        format.json { render json: @hub_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hub_lists/1
  # DELETE /hub_lists/1.json
  def destroy
    @hub_list.destroy
    respond_to do |format|
      format.html { redirect_to hub_lists_url, notice: 'Hub list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hub_list
      @hub_list = HubList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hub_list_params
      params.require(:hub_list).permit(:github, :bitbucket, :codepen, :user_id)
    end
end
