class TasksController < ApplicationController
  def index
    @tasks = Task.includes(:user).order(:updated_at).reverse_order
  end
end
