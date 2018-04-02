class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :description, :deadline))
    if @task.save
      flash[:success] = "Task Added To Your List"
      redirect_to "/"
    else
      flash[:warning] = "Something Went Wrong, Please Try Again!"
      render "new"
    end
  end


end
