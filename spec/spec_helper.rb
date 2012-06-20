#require 'simplecov'
#SimpleCov.start 'rails'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false


  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end




  def sign_in

    OmniAuth.config.test_mode = true

    OmniAuth.config.add_mock(:twitter, {  :provider    => "twitter",
                                          :uid         => "67595179",
                                          :user_info   => {   :name       => "Bob hope",
                                                              },
                                          :credentials => {   :token => "547226058-MaG2cvgXWbrAFNoxv77bLEyPND1Pb1Zu2qnOd1l0"} })

    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]






    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid("twitter", "67595179")

    if !user
    deneme=User.new(:provider =>auth['provider'],:uid => auth['uid'])
    deneme.save
    user = User.find_by_provider_and_uid("twitter", "67595179")
    end
    session[:user_id] = user.id
    #puts user.id

  end





end
