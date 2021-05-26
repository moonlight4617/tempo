class TagToShopsController < ApplicationController
  def new

  end

  def create

  end

  def delete
    tag = TagToShop.find_by(shop_id: params[:id], tag_id: params[:tag_id])
    tag.delete
    redirect_to s_edit_path(id: params[:id])
  end
end
