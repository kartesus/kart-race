gem 'minitest'

require 'minitest/autorun'

require_relative '../lib/kart'
require_relative 'kart/values/timestamp_test'
require_relative 'kart/values/lap_completed_test'
require_relative 'kart/repositories/log_repository_test'
require_relative 'kart/services/drivers_test'
require_relative 'kart/services/best_laps_test'