class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @item = Item.build(item_params)
    @item.user = current_user
    if @item.save
      flash[:notice] = "Your item was saved successfully!"
      redirect_to user_path
    else
      flash[:error] = "Item unsuccessful, please try again."
      # Might not have to redirect or render since the create form will be ON the user show page.
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name)
  end
end
