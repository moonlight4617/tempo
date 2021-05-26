class TagToShopsController < ApplicationController
  def new

  end

  def create

  end

  def delete
    tag = TagToShop.find_by(shop_id: params[:id], tag_id: params[:tag_id])
    tag.delete

    respond_to do |format|
      format.js
    end
    binding.pry
  end
end
