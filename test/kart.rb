gem 'minitest'

require 'minitest/autorun'

require_relative '../lib/kart'

require_relative 'kart/values/timestamp_test'
require_relative 'kart/values/lap_complete_test'

require_relative 'kart/repositories/race_events_repository_test'

require_relative 'kart/services/compute_best_lap_test'
require_relative 'kart/services/compute_complete_laps_test'
require_relative 'kart/services/gather_driver_info_test'