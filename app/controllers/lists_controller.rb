class ListsController < ApplicationController
  before_action :require_login, only: [:index, :create]
  before_action only: [:show, :update, :destroy] do
    require_owner(List, params[:id])
  end

  def index
    @lists = List.where(user: current_user)
    @new_list = List.new
  end

  def show
    # Display all items associated with the list.
  end

  def create
    list = List.new(_list_params)
    list.user = current_user

    if list.save
      flash[:success] = "Shazam! List created."
    else
      flash[:error] = "Your list should probably have a name. Or you might " \
                      "make it sad."
    end

    redirect_to lists_path
  end

  def update
    list = List.find(params[:id])

    if list.update(_list_params)
      flash[:success] = "List updated."
    else
      flash[:error] = "Your list still wants a name."
    end

    redirect_to lists_path
  end

  def destroy
    # TODO: Add cofirmation for deletion.
    list = List.find(params[:id])

    if list.destroy
      flash[:success] = "Your list has been deleted... Forever... Hope you " \
                        "didn't need that."
    else
      flash[:error] = "We couldn't delete that list for some odd reason..."
    end

    redirect_to lists_path
  end

  private

  def _list_params
    params.require(:list).permit(:name)
  end
end