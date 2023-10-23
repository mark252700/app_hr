require "test_helper"

class ReqCompetenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @req_competency = req_competencies(:one)
  end

  test "should get index" do
    get req_competencies_url
    assert_response :success
  end

  test "should get new" do
    get new_req_competency_url
    assert_response :success
  end

  test "should create req_competency" do
    assert_difference("ReqCompetency.count") do
      post req_competencies_url, params: { req_competency: { competencies: @req_competency.competencies } }
    end

    assert_redirected_to req_competency_url(ReqCompetency.last)
  end

  test "should show req_competency" do
    get req_competency_url(@req_competency)
    assert_response :success
  end

  test "should get edit" do
    get edit_req_competency_url(@req_competency)
    assert_response :success
  end

  test "should update req_competency" do
    patch req_competency_url(@req_competency), params: { req_competency: { competencies: @req_competency.competencies } }
    assert_redirected_to req_competency_url(@req_competency)
  end

  test "should destroy req_competency" do
    assert_difference("ReqCompetency.count", -1) do
      delete req_competency_url(@req_competency)
    end

    assert_redirected_to req_competencies_url
  end
end
