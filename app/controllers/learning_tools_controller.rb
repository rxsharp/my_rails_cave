class LearningToolsController < ApplicationController
  before_action :set_learning_tool, only: [:show, :edit, :update, :destroy]

  # GET /learning_tools
  # GET /learning_tools.json
  def index
    @learning_tools = LearningTool.all
  end

  # GET /learning_tools/1
  # GET /learning_tools/1.json
  def show
  end

  # GET /learning_tools/new
  def new
    @learning_tool = LearningTool.new
  end

  # GET /learning_tools/1/edit
  def edit
  end

  # POST /learning_tools
  # POST /learning_tools.json
  def create
    @learning_tool = LearningTool.new(learning_tool_params)

    respond_to do |format|
      if @learning_tool.save
        format.html { redirect_to @learning_tool, notice: 'Learning tool was successfully created.' }
        format.json { render :show, status: :created, location: @learning_tool }
      else
        format.html { render :new }
        format.json { render json: @learning_tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_tools/1
  # PATCH/PUT /learning_tools/1.json
  def update
    respond_to do |format|
      if @learning_tool.update(learning_tool_params)
        format.html { redirect_to @learning_tool, notice: 'Learning tool was successfully updated.' }
        format.json { render :show, status: :ok, location: @learning_tool }
      else
        format.html { render :edit }
        format.json { render json: @learning_tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_tools/1
  # DELETE /learning_tools/1.json
  def destroy
    @learning_tool.destroy
    respond_to do |format|
      format.html { redirect_to learning_tools_url, notice: 'Learning tool was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_tool
      @learning_tool = LearningTool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learning_tool_params
      params.require(:learning_tool).permit(:learning_material, :learning_section, :progress, :user_id)
    end
end
