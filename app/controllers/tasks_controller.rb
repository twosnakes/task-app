class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :description, :deadline))
    if @task.save
      flash[:success] = "Task Added To Your List"
      redirect_to '/'
    else
      flash[:warning] = "Something Went Wrong, Please Try Again!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
    redirect_to tasks_path(@task)
    else
    render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to '/'
  end

  private

    def task_params
      params.require(:task).permit(:title, :description)
    end

    def find_task
      @task = Task.find(params[:id])
    end
end
