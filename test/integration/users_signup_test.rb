require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
        post signup_path,  params: { user: { name:  "test001",
                                            email: "user@invalid.com",
                                            password: "foofoo",
                                            password_confirmation: "barbar" } }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation"
    assert_select "div .field_with_errors", 2
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
              post users_path, params: { user: { name:  "Example User",
                                                 email: "user@example.com",
                                                 password: "123456",
                                                 password_confirmation: "123456" }}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_select "div", "欢迎您来到我的范例网站!"
    assert is_logged_in?
  end

end