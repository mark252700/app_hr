require "test_helper"

class SupAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sup_admin_index_url
    assert_response :success
  end
end
