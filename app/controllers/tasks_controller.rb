class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
 
  #すべてのタスクの取得表示
  def index
    @tasks = Task.all
  end

  
  def show
    set_task
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
    set_task
  end

  def update
   set_task
    
    if @task.update(task_params)
      flash[:success] = 'your task is update'
      redirect_to @task
    else
      flash.now[:danger] = 'Update faild'
      render :edit
    end 
  end

  def destroy
   set_task
    @task.destroy
    
    flash[:success] = 'task is destroy'
    redirect_to tasks_url
  end
  
  private
  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content, :status)
  end
end