class ItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = current_user.items.build(item_params)
    @user = current_user
    if @item.save
      flash[:notice] = "Your item was saved successfully!"
    else
      flash[:error] = "Item unsuccessful, please try again."
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
      flash[:notice] = "Your item was marked complete!"
    else 
      flash[:error] = "Something went wrong, please try again."
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
