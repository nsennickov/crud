# frozen_string_literal: true

class SubitemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @new_sub_item = @item.subitems.create!(accepted_params)
    redirect_to root_path
  end

  def edit
    @subitem = Subitem.find(params[:id])
  end

  def update
    Subitem.find(params[:id]).update(accepted_params)
    redirect_to root_path
  end

  def destroy
    Subitem.find(params[:id]).destroy
    redirect_to root_path
  end

  private def accepted_params
    params.require(:subitems).permit(:title)
  end
end
