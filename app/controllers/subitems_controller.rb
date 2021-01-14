class SubitemsController < ApplicationController
  def create
    @todo = Item.find(params[:item_id])
		@new_sub_item = @todo.subitems.create!(title: params[:subitems][:subitem], item_id: params[:item_id])
		redirect_to root_path
  end

  def edit
    @subitem = Subitem.find(params[:id])
  end

  def update
    @subitem = Subitem.find(params[:id])
    @subitem.update(title: params[:subitem][:title])
    redirect_to root_path
  end

  def destroy
    @subitem = Subitem.find(params[:id])
    @subitem.destroy
    redirect_to root_path
  end
end
