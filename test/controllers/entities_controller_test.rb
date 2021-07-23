require "test_helper"

class EntitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get entities_create_url
    assert_response :success
  end
end
