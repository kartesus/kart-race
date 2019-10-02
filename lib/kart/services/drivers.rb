module Kart::Services::Drivers
  def self.from(log)
    log.inject({found: [], data: []}) do |memo, lap|
      unless memo[:found].include? lap.id
        memo[:found].push(lap.id)
        memo[:data].push(Kart::Values::NewDriverIdentified.new(lap.t, lap.id, lap.name))
      end
      memo
    end[:data]
  end
end