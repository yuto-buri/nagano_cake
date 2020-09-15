require 'test_helper'

class Admins::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admins_customers_edit_url
    assert_response :success
  end

  test "should get index" do
    get admins_customers_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_customers_show_url
    assert_response :success
  end

end
