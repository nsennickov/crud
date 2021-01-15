# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    if current_user
      @todos = current_user.items.all
    end
  end

  def create
    current_user.items.create!(item_params)
    redirect_to root_path
  end

  def edit
    @todo = Item.find(params[:id])
  end

  def show; end

  def update
    Item.find(params[:id]).update(item_params)
    redirect_to root_path
  end

  def destroy
    @todo_to_delete = Item.find(params[:id])
    @todo_to_delete.destroy
    redirect_to root_path
  end

  private def item_params
    params.require(:item).permit(:todo, :done => false)
  end
end
