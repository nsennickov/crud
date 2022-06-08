# frozen_string_literal: true

class SubitemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @new_sub_item = @item.subitems.create(subitem_params)
    if @new_sub_item.errors.any?
      flash[:error] = @new_sub_item.errors.map { |error| error.full_message }.join(', ')
    end
    redirect_to root_path
  end

  def edit
    @subitem = Subitem.find(params[:id])
  end

  def update
    @subitem_to_update = Subitem.find(params[:id])
    if @subitem_to_update.update(subitem_params)
      redirect_to root_path
    else
      flash[:error] = @subitem_to_update.errors.map { |error| error.full_message }.join(', ')
      redirect_to action: :edit
    end
  end

  def destroy
    Subitem.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def subitem_params
    params.require(:subitems).permit(:title)
  end
end
