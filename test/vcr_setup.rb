require 'vcr'

VCR.configure do |c|

  c.default_cassette_options = { record: ENV["RECORD"].present? ? ENV["RECORD"].to_sym  : :new_episodes, match_requests_on: [:body] }
  c.cassette_library_dir = 'test/vcr/cassettes'
  c.hook_into :webmock
  c.ignore_hosts 'codeclimate.com'
end

