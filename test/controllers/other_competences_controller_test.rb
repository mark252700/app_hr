require "test_helper"

class OtherCompetencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @other_competence = other_competences(:one)
  end

  test "should get index" do
    get other_competences_url
    assert_response :success
  end

  test "should get new" do
    get new_other_competence_url
    assert_response :success
  end

  test "should create other_competence" do
    assert_difference("OtherCompetence.count") do
      post other_competences_url, params: { other_competence: { competencies: @other_competence.competencies } }
    end

    assert_redirected_to other_competence_url(OtherCompetence.last)
  end

  test "should show other_competence" do
    get other_competence_url(@other_competence)
    assert_response :success
  end

  test "should get edit" do
    get edit_other_competence_url(@other_competence)
    assert_response :success
  end

  test "should update other_competence" do
    patch other_competence_url(@other_competence), params: { other_competence: { competencies: @other_competence.competencies } }
    assert_redirected_to other_competence_url(@other_competence)
  end

  test "should destroy other_competence" do
    assert_difference("OtherCompetence.count", -1) do
      delete other_competence_url(@other_competence)
    end

    assert_redirected_to other_competences_url
  end
end
