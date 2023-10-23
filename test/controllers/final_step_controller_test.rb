require "test_helper"

class FinalStepControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get final_step_index_url
    assert_response :success
  end
end
