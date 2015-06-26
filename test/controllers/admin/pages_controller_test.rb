require 'test_helper'

class Admin::PagesControllerTest < ActionController::TestCase
  test "should get about_edit" do
    get :about_edit
    assert_response :success
  end

  test "should get about_update" do
    get :about_update
    assert_response :success
  end

  test "should get contact_edit" do
    get :contact_edit
    assert_response :success
  end

  test "should get contact_update" do
    get :contact_update
    assert_response :success
  end

end
