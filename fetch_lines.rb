#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'floripa-public-transit'

lines = [];

FloripaPublicTransit.fetch_line_numbers.each do |line_number|
  puts "Fetching line #{line_number}"

  File.open("data/#{line_number}.json","w") do |f|
    line = FloripaPublicTransit.fetch_line(line_number)
    json = {
      number: line.number,
      name: line.name,
      operator: line.operator,
      itinerary: line.itinerary,
      schedules: line.schedules.map do |schedule|
        {
          origin: schedule.origin,
          destination: schedule.destination,
          period: schedule.period,
          hours: schedule.hours
        }
      end
    }
    lines.push({ number: line.number, name: line.name })
    f.write(json.to_json)
  end

end


File.open("data/index.json", "w") do |f|
  f.write(lines.to_json)
end

puts "Done"
