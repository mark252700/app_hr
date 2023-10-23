require "test_helper"

class OthCompetenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oth_competency = oth_competencies(:one)
  end

  test "should get index" do
    get oth_competencies_url
    assert_response :success
  end

  test "should get new" do
    get new_oth_competency_url
    assert_response :success
  end

  test "should create oth_competency" do
    assert_difference("OthCompetency.count") do
      post oth_competencies_url, params: { oth_competency: { competency: @oth_competency.competency } }
    end

    assert_redirected_to oth_competency_url(OthCompetency.last)
  end

  test "should show oth_competency" do
    get oth_competency_url(@oth_competency)
    assert_response :success
  end

  test "should get edit" do
    get edit_oth_competency_url(@oth_competency)
    assert_response :success
  end

  test "should update oth_competency" do
    patch oth_competency_url(@oth_competency), params: { oth_competency: { competency: @oth_competency.competency } }
    assert_redirected_to oth_competency_url(@oth_competency)
  end

  test "should destroy oth_competency" do
    assert_difference("OthCompetency.count", -1) do
      delete oth_competency_url(@oth_competency)
    end

    assert_redirected_to oth_competencies_url
  end
end
