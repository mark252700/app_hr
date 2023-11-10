require "test_helper"

class NestedDescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nested_description = nested_descriptions(:one)
  end

  test "should get index" do
    get nested_descriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_nested_description_url
    assert_response :success
  end

  test "should create nested_description" do
    assert_difference("NestedDescription.count") do
      post nested_descriptions_url, params: { nested_description: { description: @nested_description.description } }
    end

    assert_redirected_to nested_description_url(NestedDescription.last)
  end

  test "should show nested_description" do
    get nested_description_url(@nested_description)
    assert_response :success
  end

  test "should get edit" do
    get edit_nested_description_url(@nested_description)
    assert_response :success
  end

  test "should update nested_description" do
    patch nested_description_url(@nested_description), params: { nested_description: { description: @nested_description.description } }
    assert_redirected_to nested_description_url(@nested_description)
  end

  test "should destroy nested_description" do
    assert_difference("NestedDescription.count", -1) do
      delete nested_description_url(@nested_description)
    end

    assert_redirected_to nested_descriptions_url
  end
end
