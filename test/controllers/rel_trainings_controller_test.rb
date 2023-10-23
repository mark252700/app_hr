require "test_helper"

class RelTrainingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rel_training = rel_trainings(:one)
  end

  test "should get index" do
    get rel_trainings_url
    assert_response :success
  end

  test "should get new" do
    get new_rel_training_url
    assert_response :success
  end

  test "should create rel_training" do
    assert_difference("RelTraining.count") do
      post rel_trainings_url, params: { rel_training: { train_benefit: @rel_training.train_benefit, train_type: @rel_training.train_type } }
    end

    assert_redirected_to rel_training_url(RelTraining.last)
  end

  test "should show rel_training" do
    get rel_training_url(@rel_training)
    assert_response :success
  end

  test "should get edit" do
    get edit_rel_training_url(@rel_training)
    assert_response :success
  end

  test "should update rel_training" do
    patch rel_training_url(@rel_training), params: { rel_training: { train_benefit: @rel_training.train_benefit, train_type: @rel_training.train_type } }
    assert_redirected_to rel_training_url(@rel_training)
  end

  test "should destroy rel_training" do
    assert_difference("RelTraining.count", -1) do
      delete rel_training_url(@rel_training)
    end

    assert_redirected_to rel_trainings_url
  end
end
