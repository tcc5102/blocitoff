class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = current_user.items.create(item_params)

    if @item.save
      flash[:notice] = "Item #{@item.name} Now in List"
      redirect_back fallback_location: {action: "show"}
    end
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
