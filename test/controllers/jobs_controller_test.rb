require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get jobs_new_url
    assert_response :success
  end

  test "should get create" do
    get jobs_create_url
    assert_response :success
  end

end
