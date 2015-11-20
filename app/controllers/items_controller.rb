class ItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    @item = current_user.items.build(item_params)
    if @item.save
      flash.now[:notice] = "Your item was saved successfully!"
    else
      flash.now[:error] = "Item unsuccessful, please try again."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def destroy
    @item = current_user.items.find(params[:id])
    @user = current_user
    if @item.destroy
      flash.now[:notice] = "Your item was marked complete!"
    else 
      flash.now[:error] = "Something went wrong, please try again."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name)
  end
end
