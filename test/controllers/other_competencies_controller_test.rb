require "test_helper"

class OtherCompetenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @other_competency = other_competencies(:one)
  end

  test "should get index" do
    get other_competencies_url
    assert_response :success
  end

  test "should get new" do
    get new_other_competency_url
    assert_response :success
  end

  test "should create other_competency" do
    assert_difference("OtherCompetency.count") do
      post other_competencies_url, params: { other_competency: { competencies: @other_competency.competencies } }
    end

    assert_redirected_to other_competency_url(OtherCompetency.last)
  end

  test "should show other_competency" do
    get other_competency_url(@other_competency)
    assert_response :success
  end

  test "should get edit" do
    get edit_other_competency_url(@other_competency)
    assert_response :success
  end

  test "should update other_competency" do
    patch other_competency_url(@other_competency), params: { other_competency: { competencies: @other_competency.competencies } }
    assert_redirected_to other_competency_url(@other_competency)
  end

  test "should destroy other_competency" do
    assert_difference("OtherCompetency.count", -1) do
      delete other_competency_url(@other_competency)
    end

    assert_redirected_to other_competencies_url
  end
end
