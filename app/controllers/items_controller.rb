class ItemsController < ApplicationController
  def index
  end
def new

end

def create

end

def edit

end

def show

end

  private
  def item_params
    params.require(:item).permit(:name, :content, :price, :image, :category_id, :condition_id, :charge_id, :area_id, :delivery_id).merge(user_id: current_user.id)
  end
end
