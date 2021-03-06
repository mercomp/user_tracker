require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, :development)

require 'user_tracker/mocks/application_controller_mock.rb'
require 'user_tracker/mocks/mock_controllers.rb'
require 'user_tracker/mocks/mock_track_system.rb'
require 'user_tracker/mocks/user_mock.rb'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end

class TrackingActions
  include UserTracker::TrackingActions

  def initialize
  end
end