require 'capybara/dsl'
require "selenium-webdriver"

url = "https://coinpot.co/mine/coinpottokens/?ref=6FD332D08478"

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(headless disable-gpu) }
  )

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    desired_capabilities: capabilities
end

Capybara.default_driver = :headless_chrome

include Capybara::DSL

puts "started"
visit url
puts "visited"
# find('#ThrottleDropdown').find(:xpath, 'option[1]').select_option
puts "select box updated"
1600.times do |i|
  print "."
  puts("100 secs complete" + find(".well h3:nth-child(4)").text()) if i % 100 == 0
  sleep 1
end
