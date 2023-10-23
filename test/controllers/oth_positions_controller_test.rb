require "test_helper"

class OthPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oth_position = oth_positions(:one)
  end

  test "should get index" do
    get oth_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_oth_position_url
    assert_response :success
  end

  test "should create oth_position" do
    assert_difference("OthPosition.count") do
      post oth_positions_url, params: { oth_position: { pos_month: @oth_position.pos_month, pos_title: @oth_position.pos_title, pos_yr: @oth_position.pos_yr } }
    end

    assert_redirected_to oth_position_url(OthPosition.last)
  end

  test "should show oth_position" do
    get oth_position_url(@oth_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_oth_position_url(@oth_position)
    assert_response :success
  end

  test "should update oth_position" do
    patch oth_position_url(@oth_position), params: { oth_position: { pos_month: @oth_position.pos_month, pos_title: @oth_position.pos_title, pos_yr: @oth_position.pos_yr } }
    assert_redirected_to oth_position_url(@oth_position)
  end

  test "should destroy oth_position" do
    assert_difference("OthPosition.count", -1) do
      delete oth_position_url(@oth_position)
    end

    assert_redirected_to oth_positions_url
  end
end
