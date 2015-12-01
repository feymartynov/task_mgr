class TasksController < ApplicationController
  def index
    @tasks = Task.includes(:user).order(:updated_at).reverse_order
  end

  Task.state_machine.events.map(&:name).each do |action|
    define_method(action) do
      if current_user == task.user
        task.public_send(action)
        redirect_to tasks_path
      else
        render status: :forbidden, text: 'Forbidden'
      end
    end
  end

  private

  def task
    @task ||= Task.find(params[:id])
  end
end
