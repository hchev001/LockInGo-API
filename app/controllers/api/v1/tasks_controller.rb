class Api::V1::TasksController < ApplicationController
  
  # find the current current user tasks
  def index
    # find all tasks that belong to the current user
    tasks = Task.where(user_id: current_user.id)
    render json: tasks, status: :ok
  end

  # create a new task for the current user
  def create
    task = Task.new(task_params)

    # associate the new tasks with the current user
    task.user = current_user

    if task.save
      render json: task, status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      render json: task, status: :ok
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def complete
    task = current_user.tasks.find(params[:id])
    TaskCompletionService.new(task: task, user: current_user, now: Time.current).call
    head :ok

  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: [ e.message ] }, status: :unprocessable_entity
  rescue TaskCompletionService::AlreadyCompletedError => e
    render json: { errors: [ e.message ] }, status: :bad_request

    #TODO: figure out how to issue the necessary tokens, maybe here would
    # be a potential opportunity to send the task to a queue and just
    # return immediately in case calculations get complex
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    head :no_content
  end

  def task_params
    params.require(:task).permit(:title, :description, :color, :icon, :due_at, :is_active)
  end
end
