require "test_helper"

class HostelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_hostel_url
    assert_response :success
  end

  test "should get create" do
    get create_hostels_url
    assert_response :success
  end

  test "should get update" do
    get update_hostel_url
    assert_response :success
  end

  test "should get edit" do
    get hostels_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get hostels_destroy_url
    assert_response :success
  end

  test "should get index" do
    get hostels_url
    assert_response :success
  end

  test "should get show" do
    get hostels_show_url
    assert_response :success
  end
end
