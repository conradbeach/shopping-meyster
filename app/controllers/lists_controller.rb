class ListsController < ApplicationController
  before_action :require_login, only: [:index, :create]

  before_action only: [:show, :update, :destroy] do
    require_owner(List, params[:id])
  end

  before_action :_set_list, only: [:show, :update, :destroy]

  def index
    @lists = List.where(user: current_user)
    @new_list = List.new
  end

  def show
    @items = @list.items
    @new_item = Item.new
  end

  def create
    @list = List.new(_list_params)
    @list.user = current_user
    @list.save
  end

  def update
    @list.update(_list_params)
  end

  def destroy
    # TODO: Add cofirmation for deletion.
    @list.destroy
  end

  private

  def _list_params
    params.require(:list).permit(:name)
  end

  def _set_list
    @list = List.find(params[:id])
  end
end
