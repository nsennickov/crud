# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @todos = Item.all
  end

  def create
    @newTodo = Item.create!(todo: params[:item][:todos], done: false)
    redirect_to root_path
  end

  def edit
    @todo = Item.find(params[:id])
  end

  def show; end

  def update
    @todo = Item.find(params[:id])
    @todo.update(todo: params[:item][:todos], done: false)
    redirect_to root_path
  end

  def destroy
    @todo_to_delete = Item.find(params[:id])
    @todo_to_delete.subitems.destroy_all
    @todo_to_delete.destroy
    redirect_to root_path
  end
end
