require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get customers_edit_url
    assert_response :success
  end

  test "should get show" do
    get customers_show_url
    assert_response :success
  end

  test "should get withdraw" do
    get customers_withdraw_url
    assert_response :success
  end

end
