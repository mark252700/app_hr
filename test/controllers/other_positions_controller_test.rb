require "test_helper"

class OtherPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @other_position = other_positions(:one)
  end

  test "should get index" do
    get other_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_other_position_url
    assert_response :success
  end

  test "should create other_position" do
    assert_difference("OtherPosition.count") do
      post other_positions_url, params: { other_position: { pos_month: @other_position.pos_month, pos_title: @other_position.pos_title, pos_yr: @other_position.pos_yr } }
    end

    assert_redirected_to other_position_url(OtherPosition.last)
  end

  test "should show other_position" do
    get other_position_url(@other_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_other_position_url(@other_position)
    assert_response :success
  end

  test "should update other_position" do
    patch other_position_url(@other_position), params: { other_position: { pos_month: @other_position.pos_month, pos_title: @other_position.pos_title, pos_yr: @other_position.pos_yr } }
    assert_redirected_to other_position_url(@other_position)
  end

  test "should destroy other_position" do
    assert_difference("OtherPosition.count", -1) do
      delete other_position_url(@other_position)
    end

    assert_redirected_to other_positions_url
  end
end
