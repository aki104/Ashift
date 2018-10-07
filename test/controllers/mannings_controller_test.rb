require 'test_helper'

class ManningsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mannings_index_url
    assert_response :success
  end

end
