require 'test_helper'

class LinkControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get visit" do
    get :visit
    assert_response :success
  end

end
