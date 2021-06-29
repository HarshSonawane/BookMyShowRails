require "test_helper"

class TheaterAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get theater_admin_index_url
    assert_response :success
  end

  test "should get screens" do
    get theater_admin_screens_url
    assert_response :success
  end

  test "should get shows" do
    get theater_admin_shows_url
    assert_response :success
  end

  test "should get create_screen" do
    get theater_admin_create_screen_url
    assert_response :success
  end

  test "should get create_show" do
    get theater_admin_create_show_url
    assert_response :success
  end

  test "should get bookings" do
    get theater_admin_bookings_url
    assert_response :success
  end

  test "should get payments" do
    get theater_admin_payments_url
    assert_response :success
  end

  test "should get show_params" do
    get theater_admin_show_params_url
    assert_response :success
  end

  test "should get screen_params" do
    get theater_admin_screen_params_url
    assert_response :success
  end
end
