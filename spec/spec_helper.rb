lib_dir = File.join(File.dirname(__FILE__), '..', 'lib')
$: << File.expand_path(lib_dir)

ENV['WEBDRIVER'] = 'firefox'
ENV['DISPLAY'] = ":99.0"

require 'rspec/autorun'
require 'watirmark'

RSpec.configure do |config|
  config.mock_with :mocha
end

module Setup
  @@browser = nil
  # Returns an invisible browser. Will reuse same browser if called multiple times.
  def self.browser
    @@browser ||= start_browser
  end
  private
  # Start invisible browser. Make sure browser is closed when tests complete.
  def self.start_browser
    browser = Watir::Browser.new Watirmark::Configuration.instance.webdriver.to_sym
    at_exit{browser.close}
    browser
  end
end

at_exit { Page.browser.close }