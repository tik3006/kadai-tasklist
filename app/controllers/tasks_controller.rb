class TasksController < ApplicationController
  
  #すべてのタスクの取得表示
  def index
    @tasks = Task.all
  end

  
  def show
    @task = Task.find(params[:id])
  end

 
  def new
    @task = Task.new
  end

 
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'success your upload'
      redirect_to @task
    else
      flash.now[:danger] = 'faild'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'your task is update'
      redirect_to @task
    else
      flash.now[:danger] = 'Update faild'
      render :edit
    end 
  end

  def destroy
    @task= Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'task is destroy'
    redirect_to tasks_url
  end
  
  private
  def task_params
    params.require(:task).permit(:content)
  end
end
