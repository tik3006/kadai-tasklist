class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy,:show,:edit,:update]
  
  #すべてのタスクの取得表示
  def index
    if logged_in?
     @tasks = current_user.tasks.order(id: :desc).page(params[:page])
    end
  end
  
  def show
  
  end
 
  def new
    @task = Task.new
  end

 
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'success your upload'
      redirect_to @task
    else
      flash.now[:danger] = 'faild'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'your task is update'
      redirect_to @task
    else
      flash.now[:danger] = 'Update faild'
      render :edit
    end 
  end

  def destroy
    @task.destroy
    flash[:success] = 'task is destroy'
    redirect_back(fallback_location: root_path)
  end
  
  
  private

  def task_params
    params.require(:task).permit(:content, :status)
  end
   
   def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
   end
end
