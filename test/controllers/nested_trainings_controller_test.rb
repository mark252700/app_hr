require "test_helper"

class NestedTrainingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nested_training = nested_trainings(:one)
  end

  test "should get index" do
    get nested_trainings_url
    assert_response :success
  end

  test "should get new" do
    get new_nested_training_url
    assert_response :success
  end

  test "should create nested_training" do
    assert_difference("NestedTraining.count") do
      post nested_trainings_url, params: { nested_training: { sup_name: @nested_training.sup_name, sup_title: @nested_training.sup_title, train_benefit: @nested_training.train_benefit, train_type: @nested_training.train_type } }
    end

    assert_redirected_to nested_training_url(NestedTraining.last)
  end

  test "should show nested_training" do
    get nested_training_url(@nested_training)
    assert_response :success
  end

  test "should get edit" do
    get edit_nested_training_url(@nested_training)
    assert_response :success
  end

  test "should update nested_training" do
    patch nested_training_url(@nested_training), params: { nested_training: { sup_name: @nested_training.sup_name, sup_title: @nested_training.sup_title, train_benefit: @nested_training.train_benefit, train_type: @nested_training.train_type } }
    assert_redirected_to nested_training_url(@nested_training)
  end

  test "should destroy nested_training" do
    assert_difference("NestedTraining.count", -1) do
      delete nested_training_url(@nested_training)
    end

    assert_redirected_to nested_trainings_url
  end
end
