require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
ENV['RAILS_ENV'] ||= 'test'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  # 如果用户已登录，返回 true
  def is_logged_in?
    !session[:user_id].nil?
  end
  
end
