class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
      @task = Task.new(:user_id => @user)
      if params[:search].present?
      @tasks = Task.perform_search(params[:search])
      else
      @tasks = Task.all
      end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @bids = Bid.where(task_id: @task.id).order("created_at DESC")
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to new_task_location_path(@task), notice: 'Task was successfully created.' }
        ModelMailer.send_simple_message(current_user).deliver
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :due, :people, :image, :start, :location, :price)
    end


    def owned_post
      @task = Task.find(params[:id])
      unless current_user == @task.user
      flash[:alert] = "That task doesn't belong to you!"
      redirect_to tasks_path
    end
  end


end
