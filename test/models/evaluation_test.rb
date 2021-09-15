require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase
  def setup
    @shop = shops(:sample_shop)
    @user = users(:ryoji)
  end

  test "shopに基づいていないとevaluationは作成されない" do
    evaluation = Evaluation.new(user_id: @user.id)
    assert_not evaluation.save
  end

  test "userに基づいていないとevaluationは作成されない" do
    evaluation = Evaluation.new(shop_id: @shop.id)
    assert_not evaluation.save
  end

  test "shop、userに基づいていればchatは作成される" do
    evaluation = Evaluation.new(shop_id: @shop.id, user_id: @user.id)
    assert evaluation.save
  end
end
