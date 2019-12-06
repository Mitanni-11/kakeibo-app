require 'test_helper'

class VariableCostAmountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get variable_cost_amounts_index_url
    assert_response :success
  end

  test "should get show" do
    get variable_cost_amounts_show_url
    assert_response :success
  end

  test "should get new" do
    get variable_cost_amounts_new_url
    assert_response :success
  end

  test "should get edit" do
    get variable_cost_amounts_edit_url
    assert_response :success
  end

end
