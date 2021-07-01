require "test_helper"

class ShoowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shoow = shoows(:one)
  end

  test "should get index" do
    get shoows_url
    assert_response :success
  end

  test "should get new" do
    get new_shoow_url
    assert_response :success
  end

  test "should create shoow" do
    assert_difference('Shoow.count') do
      post shoows_url, params: { shoow: {  } }
    end

    assert_redirected_to shoow_url(Shoow.last)
  end

  test "should show shoow" do
    get shoow_url(@shoow)
    assert_response :success
  end

  test "should get edit" do
    get edit_shoow_url(@shoow)
    assert_response :success
  end

  test "should update shoow" do
    patch shoow_url(@shoow), params: { shoow: {  } }
    assert_redirected_to shoow_url(@shoow)
  end

  test "should destroy shoow" do
    assert_difference('Shoow.count', -1) do
      delete shoow_url(@shoow)
    end

    assert_redirected_to shoows_url
  end
end
