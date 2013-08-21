if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!('rails')
end

ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

FactoryGirl.reload

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  #fixtures :all

  # Add more helper methods to be used by all tests here...
  include FactoryGirl::Syntax::Methods

  def login_as(user)
    session[:user_id] = @user_log.id
  end

  def logout
    session.delete :user_id
  end

  def setup
    @user_log = FactoryGirl.create(:user)
    login_as :user_log if defined? session
  end
end
