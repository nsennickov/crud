# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!

  helper_method :generate_footer

  def index
    @todos = current_user.items.all
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
    Item.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:todo)
  end

  def generate_footer
    FooterServices.new.call
  end
end
