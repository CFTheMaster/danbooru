ENV["RAILS_ENV"] = "test"

if ENV["SIMPLECOV"]
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_group "Libraries", ["app/logical", "lib"]
    add_group "Presenters", "app/presenters"
  end
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'cache'
require 'webmock/minitest'

Dir[File.expand_path(File.dirname(__FILE__) + "/factories/*.rb")].each {|file| require file}
Dir[File.expand_path(File.dirname(__FILE__) + "/test_helpers/*.rb")].each {|file| require file}

Dotenv.load(Rails.root + ".env.local")

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
    with.library :rails
  end
end

class ActiveSupport::TestCase
  include PostArchiveTestHelper
  include PoolArchiveTestHelper
  include ReportbooruHelper
  include DownloadTestHelper
  include IqdbTestHelper
  include SavedSearchTestHelper
  include UploadTestHelper

  setup do
    mock_popular_search_service!
    mock_missed_search_service!
    WebMock.allow_net_connect!
    Danbooru.config.stubs(:enable_sock_puppet_validation?).returns(false)
  end

  teardown do
    Cache.clear
  end
end

class ActionDispatch::IntegrationTest
  include PostArchiveTestHelper
  include PoolArchiveTestHelper

  def method_authenticated(method_name, url, user, options)
    api_key = user.api_key || ApiKey.generate!(user)
    self.send(method_name, url, options.merge(headers: {"HTTP_AUTHORIZATION" => build_authorization_string(user, api_key)}))
  end

  def build_authorization_string(user, api_key)
    "Basic " + Base64.strict_encode64("#{user.name}:#{api_key.key}")
  end

  def get_auth(url, user, options = {})
    method_authenticated(:get, url, user, options)
  end

  def post_auth(url, user, options = {})
    method_authenticated(:post, url, user, options)
  end

  def put_auth(url, user, options = {})
    method_authenticated(:put, url, user, options)
  end

  def delete_auth(url, user, options = {})
    method_authenticated(:delete, url, user, options)
  end

  def create(factory_bot_model, params = {})
    record = FactoryBot.build(factory_bot_model, params)
    record.save
    raise ActiveRecord::RecordInvalid.new(record) if record.errors.any?
    record
  end

  def as(user, &block)
    CurrentUser.as(user, &block)
  end

  def as_user(&block)
    CurrentUser.as(@user, &block)
  end

  def as_admin(&block)
    CurrentUser.as_admin(&block)
  end

  def setup
    super
    Danbooru.config.stubs(:enable_sock_puppet_validation?).returns(false)
  end

  def teardown
    super
    Cache.clear
  end
end

Delayed::Worker.delay_jobs = false

Rails.application.load_seed
