require 'test_helper'

class VariableCostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get variable_costs_index_url
    assert_response :success
  end

  test "should get show" do
    get variable_costs_show_url
    assert_response :success
  end

  test "should get new" do
    get variable_costs_new_url
    assert_response :success
  end

  test "should get edit" do
    get variable_costs_edit_url
    assert_response :success
  end

end
