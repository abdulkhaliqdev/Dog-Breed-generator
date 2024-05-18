require 'capybara/rspec'
require 'selenium/webdriver'

Capybara.default_max_wait_time = 5
Capybara.javascript_driver = :selenium_chrome_headless
