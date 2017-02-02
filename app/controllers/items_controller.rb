class ItemsController < ApplicationController
  before_action :_set_item, only: [:update, :destroy]

  def create
    @item = Item.create(_item_params.merge(completed: false))

    redirect_to :back
  end

  def update
    if params[:completed]
      @item.update(completed: params[:completed])
    else
      @item.update(_item_params)
    end

    redirect_to :back
  end

  def destroy
    @item.destroy
    redirect_to :back
  end

  private

  def _item_params
    params.require(:item).permit(:name, :price, :quantity, :list_id)
  end

  def _set_item
    @item = Item.find(params[:id])
  end
end
