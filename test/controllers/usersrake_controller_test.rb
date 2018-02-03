require 'test_helper'

class UsersrakeControllerTest < ActionDispatch::IntegrationTest
  test "should get db:migrate" do
    get usersrake_db:migrate_url
    assert_response :success
  end

end
