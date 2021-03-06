class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = current_user.tasks.all.page(params[:page])
    unless @tasks
      redirect_to new_session_path
    end
  end
   
  def show
  end

  def new
    @task =  current_user.tasks.new
    unless @task
      redirect_to new_session_path
    end
  end

  def create
    @task =  current_user.tasks.new(task_params)
    unless @task
      redirect_to new_session_path
    end
      
    if @task.save
      flash[:success] = 'sample が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'sample が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'sample は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'sample は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy

    flash[:success] = 'sample は正常に削除されました'
    redirect_to tasks_url
  end

  private
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to new_session_path
    end
  end

  def task_params
    params.require(:task).permit(:content, :status)
  end
end
  
 