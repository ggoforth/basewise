class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :load_todo_list

  def create
    @todo = @todo_list.create(todo_params)
  end

  def update

  end

  def destroy
    @todo = @todo_list.find(params[:id])
    @todo.destroy
    redirect_to project_path(@project)
  end

private

  def todo_params
    params.require(:todo).permit(:title)
  end

  def load_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end
end
