require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'pry'

ENVIRONMENT       ||= ENV['ENVIRONMENT']
BROWSER           ||= ENV['BROWSER'].to_sym
ISPARALLELRUNNING ||= ENV['PARALLELRUNNING']

CONFIG_UI = YAML.load_file(File.dirname(__FILE__) +
            "/env/#{ENVIRONMENT}/base.yml")

basedomain = CONFIG_UI['basedomain']

URL = "https://#{basedomain}"

puts "URL Front: #{URL}"

Capybara.register_driver :selenium do |app|
  case BROWSER
  when :chrome
    caps = Selenium::WebDriver::Remote::Capabilities.chrome('goog:chromeOptions' => {
      'args' => \
      %w[
        --ignore-ssl-errors
        --ignore-certificate-errors
        --disable-popup-blocking
        --disable-gpu
        --disable-translate
        --disable-geolocation
        --start-maximized
        --incognito
        --no-sandbox
        --window-size=1420,835
        --acceptInsecureCerts=true
        --disable-impl-side-painting
        --debug_level=3
        --log-level=3
    ]})
    if ENV['HEADLESS']
      caps['goog:chromeOptions']['args'] << '--headless'
      caps['goog:chromeOptions']['args'] << '--disable-site-isolation-trials'
    end
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 60
    options = { browser: :chrome, desired_capabilities: caps, http_client: client }
  when :android
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(mobile_options('Nexus 5X'))
    options = { browser: :chrome, desired_capabilities: caps }
  else
    raise 'Browser not found'
  end
  Capybara::Selenium::Driver.new(app, options)
end

def mobile_options(mobile_emulation)
  opt = { 'goog:chromeOptions' => { mobileEmulation: { deviceName: mobile_emulation } } }
  opt['goog:chromeOptions'][:args] = \
  %w[
    --incognito
    --ignore-ssl-errors
    --ignore-certificate-errors
    --log-level=3
  ]
  if ENV['HEADLESS']
    opt['goog:chromeOptions'][:args] << '--headless'
    opt['goog:chromeOptions'][:args] << '--no-sandbox'
    opt['goog:chromeOptions'][:args] << '--disable-site-isolation-trials'
    opt['goog:chromeOptions'][:args] << '--disable-gpu'
    opt['goog:chromeOptions'][:args] << '--log-level'
  end
  opt
end

$global_timeout = 12
Capybara.default_driver        = :selenium
Capybara.app_host              = URL
Capybara.default_max_wait_time = $global_timeout
