class TasksController < ApplicationController
  before_action :check_id, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクの登録ができました"
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_url, notice: "タスクの編集ができました"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
  end

  private
  def task_params
    params.require(:task).permit(:name, :description).merge(user_id: session[:user_id])
  end

  def check_id
    @task = Task.find_by(id: params[:id])
  end
end
