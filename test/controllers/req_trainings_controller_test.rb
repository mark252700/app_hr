require "test_helper"

class ReqTrainingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @req_training = req_trainings(:one)
  end

  test "should get index" do
    get req_trainings_url
    assert_response :success
  end

  test "should get new" do
    get new_req_training_url
    assert_response :success
  end

  test "should create req_training" do
    assert_difference("ReqTraining.count") do
      post req_trainings_url, params: { req_training: { sup_name: @req_training.sup_name, sup_title: @req_training.sup_title, train_benefit: @req_training.train_benefit, train_type: @req_training.train_type } }
    end

    assert_redirected_to req_training_url(ReqTraining.last)
  end

  test "should show req_training" do
    get req_training_url(@req_training)
    assert_response :success
  end

  test "should get edit" do
    get edit_req_training_url(@req_training)
    assert_response :success
  end

  test "should update req_training" do
    patch req_training_url(@req_training), params: { req_training: { sup_name: @req_training.sup_name, sup_title: @req_training.sup_title, train_benefit: @req_training.train_benefit, train_type: @req_training.train_type } }
    assert_redirected_to req_training_url(@req_training)
  end

  test "should destroy req_training" do
    assert_difference("ReqTraining.count", -1) do
      delete req_training_url(@req_training)
    end

    assert_redirected_to req_trainings_url
  end
end
