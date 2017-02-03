class ItemsController < ApplicationController
  before_action :_set_item, only: [:update, :destroy]
  before_action :_set_list

  def create
    @item = Item.create(_item_params.merge(completed: false))

    respond_to do |format|
      format.js
    end
  end

  def update
    if params.keys.include? "completed"
      @item.update(completed: params[:completed])
    else
      @item.update(_item_params)
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.js
    end
  end

  private

  def _item_params
    params.require(:item).permit(:name, :price, :quantity, :list_id)
  end

  def _set_item
    @item = Item.find(params[:id])
  end

  def _set_list
    @list = List.find(params[:list_id] || params[:item][:list_id])
  end
end
