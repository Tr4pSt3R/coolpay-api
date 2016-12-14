require 'vcr'
require 'webmock'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  #config.debug_logger = File.open('vcr_log', 'w')
end
