class ItemsController < ApplicationController
  respond_to :html, :js

  def create
    @user = User.find(params[:user_id])
    @item = current_user.items.create(item_params)
    redirect_back fallback_location: {action: "show"}

    # if @item.save
    #   flash[:notice] = "Item #{@item.name} Now in List"
    #   redirect_back fallback_location: {action: "show"}
    # end
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = Item.find(params[:id])
    @item.destroy
    redirect_back fallback_location: {action: "show"}
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
