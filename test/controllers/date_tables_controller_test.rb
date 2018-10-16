require 'test_helper'

class DateTablesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get date_tables_new_url
    assert_response :success
  end

end
