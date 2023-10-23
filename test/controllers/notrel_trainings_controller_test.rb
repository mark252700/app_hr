require "test_helper"

class NotrelTrainingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notrel_training = notrel_trainings(:one)
  end

  test "should get index" do
    get notrel_trainings_url
    assert_response :success
  end

  test "should get new" do
    get new_notrel_training_url
    assert_response :success
  end

  test "should create notrel_training" do
    assert_difference("NotrelTraining.count") do
      post notrel_trainings_url, params: { notrel_training: { train_benefit: @notrel_training.train_benefit, train_type: @notrel_training.train_type } }
    end

    assert_redirected_to notrel_training_url(NotrelTraining.last)
  end

  test "should show notrel_training" do
    get notrel_training_url(@notrel_training)
    assert_response :success
  end

  test "should get edit" do
    get edit_notrel_training_url(@notrel_training)
    assert_response :success
  end

  test "should update notrel_training" do
    patch notrel_training_url(@notrel_training), params: { notrel_training: { train_benefit: @notrel_training.train_benefit, train_type: @notrel_training.train_type } }
    assert_redirected_to notrel_training_url(@notrel_training)
  end

  test "should destroy notrel_training" do
    assert_difference("NotrelTraining.count", -1) do
      delete notrel_training_url(@notrel_training)
    end

    assert_redirected_to notrel_trainings_url
  end
end
