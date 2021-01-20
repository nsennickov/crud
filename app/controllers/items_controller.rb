# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = current_user.items.all
  end

  def create
    @new_item = current_user.items.create(item_params)
    flash[:error] = @new_item.errors.map { |error| error.full_message }.join(', ') if @new_item.errors.any?
    redirect_to root_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show; end

  def update
    @item_to_update = Item.find(params[:id])
    if @item_to_update.update(item_params)
      redirect_to root_path
    else
      flash[:error] = @item_to_update.errors.map { |error| error.full_message }.join(', ')
      redirect_to action: :edit
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:todo)
  end
end
