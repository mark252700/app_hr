require "test_helper"

class RequestTrainingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_training = request_trainings(:one)
  end

  test "should get index" do
    get request_trainings_url
    assert_response :success
  end

  test "should get new" do
    get new_request_training_url
    assert_response :success
  end

  test "should create request_training" do
    assert_difference("RequestTraining.count") do
      post request_trainings_url, params: { request_training: { train_benefit: @request_training.train_benefit, train_type: @request_training.train_type } }
    end

    assert_redirected_to request_training_url(RequestTraining.last)
  end

  test "should show request_training" do
    get request_training_url(@request_training)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_training_url(@request_training)
    assert_response :success
  end

  test "should update request_training" do
    patch request_training_url(@request_training), params: { request_training: { train_benefit: @request_training.train_benefit, train_type: @request_training.train_type } }
    assert_redirected_to request_training_url(@request_training)
  end

  test "should destroy request_training" do
    assert_difference("RequestTraining.count", -1) do
      delete request_training_url(@request_training)
    end

    assert_redirected_to request_trainings_url
  end
end
