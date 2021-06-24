class HomeController < ApplicationController
  def top
  end

  def test
    session.delete(:owner_id)
    redirect_to root_path
  end
end
