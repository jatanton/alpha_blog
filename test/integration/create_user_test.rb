require "test_helper"

class CreateUserTest < ActionDispatch::IntegrationTest
  
  test "should get new user signup page and create new user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: "adamadmin", email: "adam@squeezecmm.com", password: "password", admin: true}
    end
    assert_template 'users/show'
    assert_match "adamadmin", response.body
  end
end