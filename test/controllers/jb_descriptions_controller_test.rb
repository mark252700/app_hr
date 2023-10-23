require "test_helper"

class JbDescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jb_description = jb_descriptions(:one)
  end

  test "should get index" do
    get jb_descriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_jb_description_url
    assert_response :success
  end

  test "should create jb_description" do
    assert_difference("JbDescription.count") do
      post jb_descriptions_url, params: { jb_description: { description: @jb_description.description } }
    end

    assert_redirected_to jb_description_url(JbDescription.last)
  end

  test "should show jb_description" do
    get jb_description_url(@jb_description)
    assert_response :success
  end

  test "should get edit" do
    get edit_jb_description_url(@jb_description)
    assert_response :success
  end

  test "should update jb_description" do
    patch jb_description_url(@jb_description), params: { jb_description: { description: @jb_description.description } }
    assert_redirected_to jb_description_url(@jb_description)
  end

  test "should destroy jb_description" do
    assert_difference("JbDescription.count", -1) do
      delete jb_description_url(@jb_description)
    end

    assert_redirected_to jb_descriptions_url
  end
end
