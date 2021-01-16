# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @todos = Item.all
  end

  def create
    Item.create!(subitem_params)
    redirect_to root_path
  end

  def edit
    @todo = Item.find(params[:id])
  end

  def show; end

  def update
    Item.find(params[:id]).update(subitem_params)
    redirect_to root_path
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def subitem_params
    params.require(:item).permit(:todo)
  end
end
