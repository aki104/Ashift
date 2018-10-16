require 'test_helper'

class TimeTablesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get time_tables_new_url
    assert_response :success
  end

  test "should get index" do
    get time_tables_index_url
    assert_response :success
  end

  test "should get edit" do
    get time_tables_edit_url
    assert_response :success
  end

end
